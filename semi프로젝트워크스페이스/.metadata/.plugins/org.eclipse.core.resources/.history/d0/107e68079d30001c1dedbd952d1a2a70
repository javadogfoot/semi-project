package tomato.member;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public MemberDAO() {
		
	}
	public Boolean idCheck(String userid) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_member where m_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			boolean result=rs.next();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**회원 등록 관련 메서드*/
	public int memberJoin(MemberDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="insert into tomato_member values(tomato_member_m_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getM_id());
			ps.setString(2, dto.getM_pwd());
			ps.setString(3, dto.getM_name());
			ps.setString(4, dto.getM_email());
			ps.setString(5, dto.getM_addr());
			ps.setString(6, dto.getM_tel());
			ps.setString(7, dto.getM_birth());
			ps.setInt(8, dto.getM_smsok());
			ps.setInt(9, dto.getM_emailok());
			ps.setString(10, dto.getM_ask());
			ps.setString(11, dto.getM_answer());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	 /**로그인 검증 관련 메서드*/
	  public int loginCheck(String userid, String userpwd) {
	     try {
	        conn=tomato.db.TomatoDB.getConn();
	        String sql="select m_pwd from tomato_member where m_id=?";
	        ps=conn.prepareStatement(sql);
	        ps.setString(1, userid);
	        rs=ps.executeQuery();
	        if(rs.next()) {
	           String dbpwd=rs.getString(1);
	           if(dbpwd.equals(userpwd)) {
	              return LOGIN_OK;
	           }else {
	              return NOT_PWD;
	           }
	        }else {
	           return NOT_ID;
	        }
	     } catch (Exception e) {
	        e.printStackTrace();
	        return ERROR;
	     }finally {
	        try {
	           if(rs!=null)rs.close();
	           if(ps!=null)ps.close();
	           if(conn!=null)conn.close();
	        } catch (Exception e2) {
	       }
	    }
	  }
	  public String getUserInfo(String userid) {
	      try {
	         
	         conn=tomato.db.TomatoDB.getConn();
	         
	         String sql="select m_name from tomato_member where m_id=?";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, userid);
	         rs=ps.executeQuery();
	         rs.next();
	         return rs.getString(1);
	      } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         } catch (Exception e2) {
	            
	         }
	      }
	   }
	  
   public String findIdCheck(String username, String useremail) {
      try {
	        conn=tomato.db.TomatoDB.getConn();
	        String sql="select m_id from tomato_member where m_name=? and m_email=?";
	        ps=conn.prepareStatement(sql);
	        ps.setString(1, username);
	        ps.setString(2, useremail);
	        rs=ps.executeQuery();
	        String result=null;
	        if(rs.next()) {
	        	result=rs.getString(1);
	        }
	        return result;
	     } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	     }finally {
	        try {
	           if(rs!=null)rs.close();
	           if(ps!=null)ps.close();
	           if(conn!=null)conn.close();
	        } catch (Exception e2) {
	        }
	    }
	}
   public String findPwdCheck(String username, String useremail, String useranswer) {
	   try {
		   conn=tomato.db.TomatoDB.getConn();
		   String sql="select m_pwd from tomato_member where m_name=? and m_email=? and m_answer=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, username);
		   ps.setString(2, useremail);
		   ps.setString(3, useranswer);
		   rs=ps.executeQuery();
		   String result=null;
		   if(rs.next()) {
			   result=rs.getString(1);
		   }
		   return result;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }finally {
		   try {
			   if(rs!=null)rs.close();
			   if(ps!=null)ps.close();
			   if(conn!=null)conn.close();
		   }catch(Exception e2) {
			   
		   }
	   }
   }
   public int selectMidx(String userid) {
	   try {
		   conn=tomato.db.TomatoDB.getConn();
		   String sql="select m_idx from tomato_member where m_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, userid);
		   rs=ps.executeQuery();
		   int idx=0;
		   if(rs.next()) {
			   idx=rs.getInt(1);
		   }
		   return idx;
	   }catch(Exception e) {
		   return -1;
	   }finally {
		   try {
			   if(rs!=null)rs.close();
			   if(ps!=null)ps.close();
			   if(conn!=null)conn.close();
		   }catch(Exception e2) {
			   
		   }
	   }
   }
   public String findAddr(String id) {
	   try {
		   conn=tomato.db.TomatoDB.getConn();
		   String sql="select * from tomato_member where m_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   rs=ps.executeQuery();
		   String result=null;
		   if(rs.next()) {
			   result=rs.getString("m_addr");
		   }
		   return result;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }finally {
		   try {
			   if(rs!=null)rs.close();
			   if(ps!=null)ps.close();
			   if(conn!=null)ps.close();
		   }catch(Exception e2) {
			   
		   }
	   }
   }
   /**회원검색 관련 메서드*/
   public ArrayList<MemberDTO> keywordFind(String fkey){
      try {
         
         conn=tomato.db.TomatoDB.getConn();
         String sql="select  m_idx,m_id,m_name,m_email,m_addr,m_tel,m_birth,m_joindate from tomato_member where m_name=?";
         ps=conn.prepareStatement(sql);
         ps.setString(1, fkey);
         rs=ps.executeQuery();
     
         ArrayList<MemberDTO> arr=new ArrayList<MemberDTO>();
      
            while(rs.next()){ 
            int m_idx=rs.getInt("m_idx");
            String m_id=rs.getString("m_id");
            String m_name=rs.getString("m_name");
            String m_email=rs.getString("m_email");
            String m_addr=rs.getString("m_addr");
            String m_tel=rs.getString("m_tel");
            String m_birth=rs.getString("m_birth");
            java.sql.Date m_joindate=rs.getDate("m_joindate");
                  
           MemberDTO dtos= new MemberDTO(m_idx, m_id, m_name, m_email, m_addr, m_tel, m_birth, m_joindate);
           arr.add(dtos);
               }
         
         return arr;
      }catch(Exception e) {
         e.printStackTrace();
         return null;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         }catch(Exception e2) {}      
      }
   }
   
   /**모든 회원 내역 관련 메서드*/
   public ArrayList<MemberDTO> MemberListAll(){
      try{
         
         conn=tomato.db.TomatoDB.getConn();
         String sql="select m_idx,m_id,m_name,m_email,m_addr,m_tel,m_birth,m_joindate from tomato_member order by m_idx desc";
         ps=conn.prepareStatement(sql);
         rs=ps.executeQuery();
         ArrayList<MemberDTO> arr=new ArrayList<MemberDTO>();
         while(rs.next()){ 
            int m_idx=rs.getInt("m_idx");
            String m_id=rs.getString("m_id");
            String m_name=rs.getString("m_name");
            String m_email=rs.getString("m_email");
            String m_addr=rs.getString("m_addr");
            String m_tel=rs.getString("m_tel");
            String m_birth=rs.getString("m_birth");
            java.sql.Date m_joindate=rs.getDate("m_joindate");      
            
            MemberDTO dto= new MemberDTO(m_idx, m_id, m_name, m_email, m_addr, m_tel, m_birth, m_joindate);
            arr.add(dto);
         }
               return arr;
      }catch(Exception e) {
      e.printStackTrace();
      return null; 
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         }catch(Exception e2) {}      
      }   
   }
   
      /**회원정보 조회 관련 메서드*/
      public MemberDTO memberView(String sessionID ){
         try {
            
         conn=tomato.db.TomatoDB.getConn();
         
         String sql="select * from tomato_member where m_id=? ";
         ps=conn.prepareStatement(sql);
      ps.setString(1,sessionID );
      
      rs=ps.executeQuery();      
      
      MemberDTO dto=null;
      
      while(rs.next()){ 
            int m_idx=rs.getInt("m_idx");
            String m_id=rs.getString("m_id");
            String m_name=rs.getString("m_name");
            String m_email=rs.getString("m_email");
            String m_addr=rs.getString("m_addr");
            String m_tel=rs.getString("m_tel");
            String m_birth=rs.getString("m_birth");
            java.sql.Date m_joindate=rs.getDate("m_joindate");         
            
            dto= new MemberDTO(m_idx, m_id, m_name, m_email, m_addr, m_tel, m_birth, m_joindate);       
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
         }catch(Exception e2) {}      
         }
      }
   
      /**회원 정보 수정 관련 메서드*/
      
      public int memberUpdate(MemberDTO dto){
         try {
   
            conn=tomato.db.TomatoDB.getConn();
            String sql = "update tomato_member set m_pwd=?,m_name=?, m_email=?, m_addr=?, m_tel=? "
               + "where m_id=?";
   
            ps=conn.prepareStatement(sql);
            ps.setString(1, dto.getM_pwd());
            ps.setString(2, dto.getM_name());
            ps.setString(3, dto.getM_email());
            ps.setString(4, dto.getM_addr());
            ps.setString(5, dto.getM_tel());
            ps.setString(6, dto.getM_id());
            
            int result=ps.executeUpdate();
            
            return result;
   
         } catch (Exception e) {
             e.printStackTrace();
             return -1;
         } finally {
            try {
               if(ps!=null)ps.close();
               if(conn!=null)conn.close();
            } catch (Exception e2) {
               
            }
         }
      }

      /**회원탈퇴 관련 메서드*/
      public int memberDelete(String m_id) {
            try {
            conn=tomato.db.TomatoDB.getConn();
            String sql="delete from tomato_member where m_id=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, m_id);
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
            } catch (Exception e) {
               // TODO: handle exception
            }
         }
      }
}
