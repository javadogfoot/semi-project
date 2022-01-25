package tomato.lesson_buy;

import java.sql.*;
import java.util.*;
import tomato.lesson.LessonDTO;

public class LessonBuyDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LessonBuyDAO() {
		
	}
	
	/**레슨 신청자 추가 메서드*/
	public int lessonJoin(int l_idx,int m_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="insert into tomato_lesson_buy values(?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			ps.setInt(2, m_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/**레슨 신청자 취소 메서드*/
	public int lessonJoinCancle(int l_idx,int m_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="delete from tomato_lesson_buy where l_idx=? and m_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			ps.setInt(2, m_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/**레슨 신청 중복 여부*/
	public Boolean m_idxCheck(int l_idx,int m_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_lesson_buy where l_idx=? and m_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			ps.setInt(2, m_idx);
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

	
	   /**내가 신청한 레슨 목록 메서드*/
	   public ArrayList<LessonDTO> lessonMylist(int m_idx) {
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         String sql="select lb.*, tl.l_name, tl.l_joindate from tomato_lesson_buy lb "
	               + "left join tomato_lesson tl on tl.l_idx = lb.l_idx "
	               + "where lb.m_idx = ?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, m_idx);
	         rs = ps.executeQuery();
	         ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
	         while(rs.next()) {
	            int l_idx = rs.getInt("l_idx");
	            String l_name = rs.getString("l_name");
	            String l_con = null;
	            java.sql.Date l_joindate = rs.getDate("l_joindate");
	            java.sql.Date l_enddate = null;
	            int l_people = 0;
	            int l_del = 0;
	            int l_lessonok = 0;
	            String l_addr = null;
	            int m_idxcnt = 0;
	            
	            LessonDTO dto=new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del, l_lessonok, l_addr, m_idxcnt);
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
}
