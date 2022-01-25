package tomato.qna;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.*;

import tomato.db.TomatoDB;

public class QnaDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public QnaDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**ref 마지막 값 구하기 관련 메서드*/
	public int getMaxRef() {
		try {
			String sql="select max(q_ref) from tomato_qna";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int q_ref=0;
			if(rs.next()) {
				q_ref=rs.getInt(1);
			}
			return q_ref;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}	
	
	/**글 쓰기 관련 메서드*/
	public int qnaWrite(QnaDTO dto,String m_id) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			int q_ref=getMaxRef();
			String sql="insert into tomato_qna values((select m_idx from tomato_member where m_id=?),tomato_qna_q_idx.nextval,?,?,sysdate,'미완료',?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, m_id);
			ps.setString(2, dto.getQ_sub());
			ps.setString(3, dto.getQ_con());
			ps.setInt(4, q_ref+1);
			
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**순번 수정 관련 메서드*/
	public void updateSun(int q_ref,int q_sunbun) {
		try {
			String sql="update tomato_qna set q_sunbun=q_sunbun+1 where q_ref=? and q_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_ref);
			ps.setInt(2, q_sunbun);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}	
	
	/**답변 글쓰기 관련 메서드*/
	public int qnaReWrite(QnaDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			updateSun(dto.getQ_ref(),dto.getQ_sunbun()+1);
			String sql="insert into tomato_qna values(1,tomato_qna_q_idx.nextval,?,?,sysdate,' ',?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQ_sub());
			ps.setString(2, dto.getQ_con());
			ps.setInt(3, dto.getQ_ref());
			ps.setInt(4, dto.getQ_lev()+1);
			ps.setInt(5, dto.getQ_sunbun()+1);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}	
	
	/**답변시 답변완료로 바꾸는 메서드*/
	public void recomplete(int q_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_qna set q_status='답완료' where q_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_idx);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**총 게시물 수 반환 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count (*) from tomato_qna";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
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
	/**글 목록 보기 관련 메서드 no페이징*/
	public ArrayList<QnaDTO> qnaList2() {
		try {
			conn=tomato.db.TomatoDB.getConn();
			
			String sql="select * from tomato_qna tq "
					+ "left join tomato_member tm on tq.m_idx = tm.m_idx order by q_idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int q_idx=rs.getInt("q_idx");
				String q_sub=rs.getString("q_sub");
				String q_con=rs.getString("q_con");
				java.sql.Date q_joindate=rs.getDate("q_joindate");
				String q_status=rs.getString("q_status");
				String m_name=rs.getString("m_name");
				
				QnaDTO dto=new QnaDTO(m_idx, q_idx, q_sub, q_con, q_joindate, q_status, m_name);
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
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	/**글 목록 보기 관련 메서드 페이징*/
	public ArrayList<QnaDTO> qnaList(int cp, int ls) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from (select rownum as rnum,a.* from"
					+ " (select * from tomato_qna tq left join tomato_member tm on tq.m_idx = tm.m_idx order by q_ref desc, q_sunbun asc) a) b"
					+ " where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			
			ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int q_idx=rs.getInt("q_idx");
				String q_sub=rs.getString("q_sub");
				String q_con=rs.getString("q_con");
				java.sql.Date q_joindate=rs.getDate("q_joindate");
				String q_status=rs.getString("q_status");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				String m_name=rs.getString("m_name");
				String m_id=rs.getString("m_id");
				
				QnaDTO dto=new QnaDTO(m_idx, m_name, q_idx, q_sub, q_con, q_joindate, q_status, q_ref, q_lev, q_sunbun, m_id);
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
	
	/**본문 관련 메서드*/
	public QnaDTO qnaContent(int idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_qna tq left join tomato_member tm on tq.m_idx = tm.m_idx where q_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			QnaDTO dto=null;
			if(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int q_idx=rs.getInt("q_idx");
				String q_sub=rs.getString("q_sub");
				String q_con=rs.getString("q_con");
				java.sql.Date q_joindate=rs.getDate("q_joindate");
				String q_status=rs.getString("q_status");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				String m_name=rs.getString("m_name");
				String m_id=rs.getString("m_id");
				
				dto=new QnaDTO(m_idx, q_idx, q_sub, q_con, q_joindate, q_status, q_ref, q_lev, q_sunbun, m_name, m_id);
				
			}
			return dto;
			
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
	/**QNA질문글 ref값 추출 메서드*/
	public int getQref(int q_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select q_ref from tomato_qna where q_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_idx);
			rs=ps.executeQuery();
			int q_ref=0;
			if(rs.next()) {
				q_ref=rs.getInt(1);
			}
			return q_ref;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
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
	
	/**QNA질문글 삭제 관련 메서드*/
	public int qnaDel(int q_ref) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="delete from tomato_qna where q_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_ref);
			int count=ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**관리자 답변글 삭제 관련 메서드*/
	public int qnaDelAdmin(int idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="delete from tomato_qna where q_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	/**Q&A질문 키워드 검색 관련 메서드*/
	public ArrayList<QnaDTO> keywordFind(String keyword){
		try {
			
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_qna tq left join tomato_member tm on tq.m_idx = tm.m_idx where q_sub like '%"+keyword+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int q_idx=rs.getInt("q_idx");
				String q_sub=rs.getString("q_sub");
				String q_con=rs.getString("q_con");
				java.sql.Date q_joindate=rs.getDate("q_joindate");
				String q_status=rs.getString("q_status");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				String m_name=rs.getString("m_name");
				String m_id=rs.getString("m_id");
				
				QnaDTO dto=new QnaDTO(m_idx, q_idx, q_sub, q_con, q_joindate, q_status, q_ref, q_lev, q_sunbun, m_name, m_id);
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
	
	/**마이페이지 내글 목록 조회 관련 메서드*/
	public ArrayList<QnaDTO> mypageQna(int idx, int cp, int ls) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from (select rownum as rnum,a.* from"
					+ " (select * from tomato_qna where m_idx=? order by q_ref desc, q_sunbun asc) a) b"
					+ " where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			
			ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int q_idx=rs.getInt("q_idx");
				String q_sub=rs.getString("q_sub");
				String q_con=rs.getString("q_con");
				java.sql.Date q_joindate=rs.getDate("q_joindate");
				String q_status=rs.getString("q_status");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				
				QnaDTO dto=new QnaDTO(m_idx, q_idx, q_sub, q_con, q_joindate, q_status, q_ref, q_lev, q_sunbun);
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
	
	
}
