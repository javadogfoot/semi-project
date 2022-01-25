package tomato.community;

import java.sql.*;

import java.sql.Date;
import java.util.*;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import tomato.community_re.CommunityReDTO;
import tomato.qna.QnaDTO;

public class CommunityDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public CommunityDAO() {//의무적으로 만듬
	
	}
	/**순번 수정 관련 메서드*/
	   public void updateSun(int c_r_ref, int c_r_sunbun) {
	      try {
	         String sql = "update tomato_community_re set c_r_sunbun = c_r_sunbun +1 where c_r_ref = ? and c_r_sunbun >= ?";

	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, c_r_ref);
	         ps.setInt(2, c_r_sunbun);
	         ps.executeUpdate();
	      
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if(ps!=null)ps.close();
	         } catch (Exception e2) {}
	      }
	      
	   }
	
	
	   /**c_r_ref 마지막값 구하기 관련 메서드*/
	   public int getMaxC_R_Ref(int c_idx) {
	      try {//독립 수행 x /// 글을 쓰는 기능이 실행될 때 
	         
	         String sql = "select max(c_r_ref) from tomato_community_re where c_idx=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, c_idx);
	         rs = ps.executeQuery();
	         
	         int c_r_ref = 0;
	         if(rs.next()) {
	            c_r_ref = rs.getInt(1);
	         }
	         
	         return c_r_ref;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         return 0; //문제가 발생하면 0이라는 값
	         
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            
	         } catch (Exception e2) {}
	      }
	   }
	
	   /**대댓글 쓰기 관련 메서드*/
	   public int reReWirte(CommunityReDTO dto) {
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         updateSun(dto.getC_r_ref(), dto.getC_r_sunbun()+1);
	         
	         String sql ="insert into tomato_community_re values(tomato_community_re_c_r_idx.nextval, ?, ?, ?, sysdate, 0, ?, ?, ?)";
	         
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, dto.getC_idx());
	         ps.setInt(2, dto.getM_idx());
	         ps.setString(3, dto.getC_r_con());
	         ps.setInt(4, dto.getC_r_ref());
	         ps.setInt(5, dto.getC_r_lev()+1);
	         ps.setInt(6, dto.getC_r_sunbun()+1);
	      
	         int result = ps.executeUpdate();
	         return result;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         return -1;
	         
	      } finally {
	         try {
	            if(ps !=null)ps.close();
	      } catch (Exception e2) {}
	      }
	   }   
	   
	   /**댓글 쓰기 관련 메서드*/
	   public int communityRe(CommunityReDTO dto) {
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         int c_r_ref = getMaxC_R_Ref(dto.getC_idx());
	         
	         String sql = "insert into tomato_community_re values(tomato_community_re_c_r_idx.nextval, ?, ?, ?, sysdate, 0, ?, 0, 0)";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, dto.getC_idx());
	         ps.setInt(2, dto.getM_idx());
	         ps.setString(3, dto.getC_r_con());
	         ps.setInt(4, c_r_ref+1);
	         
	         int count = ps.executeUpdate();
	         
	         return count;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         return -1;
	         
	      }finally {
	         try {
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         } catch (Exception e2) {}
	      }
	   }
	
	   /**총 댓글 수 반환 관련 메서드*/
	   public int getTotalCntRe(int c_idx) {
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         String sql = "select count(*) from tomato_community_re where c_idx=? and c_r_del = 0";
	         
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, c_idx);
	         rs = ps.executeQuery();
	         rs.next();
	         
	         int count = rs.getInt(1);//첫번째 컬럼의 값
	         return count==0?1:count; //카운트가 0이라면 1이라도 돌려주고 아니라면 카운트를 돌려준다.
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         return 1;
	         
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	            
	         } catch (Exception e2) {}
	      }
	   }
	   
	   /**댓글 목록 관련 메서드*/
	   public ArrayList<CommunityReDTO> communityRe(int c_idx, int cp, int ls){
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         //String sql = "select * from tomato_community_re order by c_idx desc";
	         int start = (cp-1)*ls+1;
	         int end = cp*ls;
	         
	         String sql = "select * from "
	               + "(select rownum as rnumRe,a.* from "
	               + "(select re.*, tm.m_name from tomato_community_re re "
	               + "left join tomato_member tm on tm.m_idx = re.m_idx"
	               + " where c_idx=? order by c_r_ref desc, c_r_sunbun asc, c_r_idx asc) a) b "
	               + "where rnumRe>=? and rnumRe<=?";
	         
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, c_idx);
	         ps.setInt(2, start);
	         ps.setInt(3, end);
	         rs = ps.executeQuery();
	         
	         ArrayList<CommunityReDTO> arr = new ArrayList<CommunityReDTO>();
	         while(rs.next()) {
	            int c_r_idx = rs.getInt("c_r_idx");
	            int m_idx = rs.getInt("m_idx");
	            String m_name = rs.getString("m_name");
	            String c_r_con = rs.getString("c_r_con");
	            java.sql.Date c_r_joindate = rs.getDate("c_r_joindate");
	            int c_r_del = rs.getInt("c_r_del");
	            int c_r_ref = rs.getInt("c_r_ref");
	            int c_r_lev = rs.getInt("c_r_lev");
	            int c_r_sunbun = rs.getInt("c_r_sunbun");
	            
	            CommunityReDTO dto = new CommunityReDTO(c_r_idx, c_idx, m_idx, m_name, c_r_con, c_r_joindate, c_r_del, c_r_ref, c_r_lev, c_r_sunbun);
	            arr.add(dto);
	         }
	         return arr;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	         
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         } catch (Exception e2) {}
	         
	      }
	   }
	
	/**댓글 삭제 메서드*/
	public int communityReDel(CommunityReDTO reDTO) {
		int result = 0;
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql ="update tomato_community_re set c_r_del='1', c_r_con='삭제된 댓글입니다.' where c_r_idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reDTO.getC_r_idx());
			
			result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
			
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {}
		}
	}
	
	/**총 게시글 수 반환 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from tomato_community where c_del = 0 ";
			
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {}
		}
	}
	
	/**게시글 목록 관련 메서드*/
	public ArrayList<CommunityDTO> community(int cp, int ls){
		try {
			conn = tomato.db.TomatoDB.getConn();
			//String sql = "select * from tomato_community order by c_idx desc";
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			
			String sql = "select * from(select rownum as rnum, a.* "
					+ "from(select tc.*, tm.m_name, re_count as re_count "
					+ "from tomato_community tc "
					+ "left join tomato_member tm on tm.m_idx = tc.m_idx "
					+ "left join (select re.c_idx, count(*) re_count "
					+ "from tomato_community_re re "
					+ "left join tomato_community a on a.c_idx = re.c_idx "
					+ "where re.c_r_del = 0 "
					+ "group by re.c_idx) r on r.c_idx = tc.c_idx "
					+ "where tc.c_del = 0 "
					+ "order by tc.c_idx desc "
					+ ") a ) b where rnum>=? and rnum<=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			
			ArrayList<CommunityDTO> arr = new ArrayList<CommunityDTO>();
			while(rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String m_name = rs.getString("m_name");
				int c_idx = rs.getInt("c_idx");
				String c_sub = rs.getString("c_sub");
				String c_con = rs.getString("c_con");
				java.sql.Date c_joindate = rs.getDate("c_joindate");
				int c_del = rs.getInt("c_del");
				int re_count = rs.getInt("re_count");
				
				CommunityDTO dto = new CommunityDTO(m_idx, m_name, c_idx, c_sub, c_con, c_joindate, c_del ,re_count);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
		}
	}
	
	/**게시글 본문 관련 메서드*/
	public CommunityDTO communityContent(int c_idx) {
		try {
			
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select tc.*, tm.m_name from tomato_community tc "
					+ "left join tomato_member tm on tm.m_idx = tc.m_idx "
					+ "where c_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			
			rs=ps.executeQuery();
			CommunityDTO dto = null;
			if(rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String m_name = rs.getString("m_name");
				String c_sub = rs.getString("c_sub");
				String c_con = rs.getString("c_con");
				java.sql.Date c_joindate = rs.getDate("c_joindate");
				int c_del = rs.getInt("c_del");
				int re_count = 0;
				
				dto = new CommunityDTO(m_idx, m_name, c_idx, c_sub, c_con, c_joindate, c_del, re_count);
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**게시글 글쓰기 관련 메서드*/
	public int communityWrite(CommunityDTO dto) {
		try {
			
			conn = tomato.db.TomatoDB.getConn();
			String sql = "insert into tomato_community values(?,tomato_community_c_idx.nextval, ?, ?, sysdate, 0)";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getM_idx());
			ps.setString(2, dto.getC_sub());
			ps.setString(3, dto.getC_con());
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**게시글 글 조회 수정 관련 메서드*/
	public int communityUpdate(CommunityDTO dto) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_community set c_sub=?, c_con=? "
					+ "where c_idx = ?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getC_sub());
			ps.setString(2, dto.getC_con());
			ps.setInt(3, dto.getC_idx());
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**게시글 수정 시 글 조회 메서드 */
	public CommunityDTO selectCommunityByCidx(int c_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select * from tomato_community "
						 + "where c_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			
			rs=ps.executeQuery();
			CommunityDTO dto = new CommunityDTO();
			if(rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String m_name = null;
				String c_sub = rs.getString("c_sub");
				String c_con = rs.getString("c_con");
				java.sql.Date c_joindate = rs.getDate("c_joindate");
				int c_del = rs.getInt("c_del");
				int re_count = 0;
				
				dto = new CommunityDTO(m_idx, m_name, c_idx, c_sub, c_con, c_joindate, c_del, re_count);
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**게시글 삭제 메서드 */
	public int communityDel(int c_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql ="update tomato_community set c_del = 1 where c_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {}
		}
	}
	
	/**커뮤니티 키워드 검색 관련 메서드*/
	public ArrayList<CommunityDTO> keywordFind(String keyword){
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_community tc left join tomato_member tm on tc.m_idx = tm.m_idx where c_sub like '%"+keyword+"%' and c_del = 0";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<CommunityDTO> arr=new ArrayList<CommunityDTO>();
			while(rs.next()) {
				int c_idx=rs.getInt("c_idx");
				String c_sub=rs.getString("c_sub");
				String c_con=rs.getString("c_con");
				java.sql.Date c_joindate=rs.getDate("c_joindate");
				String m_name=rs.getString("m_name");
				String m_id=rs.getString("m_id");
				
				CommunityDTO dto=new CommunityDTO(m_name, c_idx, c_sub, c_con, c_joindate, m_id);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}	
	
	/**마이페이지 내가쓴글 조회 관련 메서드*/
	public ArrayList<CommunityDTO> mypageCommunity(int idx, int cp, int ls){
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			
			String sql = "select * from(select rownum as rnum, a.* "
					+ "from(select tc.*, tm.m_name, re_count as re_count "
					+ "from tomato_community tc "
					+ "left join tomato_member tm on tm.m_idx = tc.m_idx "
					+ "left join (select re.c_idx, count(*) re_count "
					+ "from tomato_community_re re "
					+ "left join tomato_community a on a.c_idx = re.c_idx "
					+ "where re.c_r_del = 0 "
					+ "group by re.c_idx) r on r.c_idx = tc.c_idx "
					+ "where tc.c_del = 0 "
					+ "order by tc.c_idx desc "
					+ ") a ) b where m_idx=? and rnum>=? and rnum<=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			
			ArrayList<CommunityDTO> arr = new ArrayList<CommunityDTO>();
			while(rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String m_name = rs.getString("m_name");
				int c_idx = rs.getInt("c_idx");
				String c_sub = rs.getString("c_sub");
				String c_con = rs.getString("c_con");
				java.sql.Date c_joindate = rs.getDate("c_joindate");
				int c_del = rs.getInt("c_del");
				int re_count = rs.getInt("re_count");
				
				CommunityDTO dto = new CommunityDTO(m_idx, m_name, c_idx, c_sub, c_con, c_joindate, c_del ,re_count);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
		}
	}
	
	
}
