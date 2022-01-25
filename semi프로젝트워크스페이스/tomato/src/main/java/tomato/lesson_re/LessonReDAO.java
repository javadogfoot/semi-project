package tomato.lesson_re;

import java.sql.*;



import javax.naming.*;
import javax.sql.*;
import java.util.*;

public class LessonReDAO {
	
		private Connection conn;
		private PreparedStatement ps;
		private ResultSet rs;
		
	public LessonReDAO() {
		
	}
	/**ref 마지막수 반환 메서드?*/
	public int getMaxRef() {
		try {
			String sql="select max(l_r_ref) from tomato_lesson_re";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int ref=0;
			if(rs.next()) {
				ref=rs.getInt(1);
			}
			return ref;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	
	/**레슨 댓글 쓰기 메서드*/
	public int lessonReWrite(LessonReDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			int l_r_ref=getMaxRef();
			String sql="insert into tomato_lesson_re values(tomato_lesson_re_l_r_idx.nextval,?,?,?,sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getL_idx());
			ps.setInt(2, dto.getM_idx());
			ps.setString(3, dto.getL_r_con());
			ps.setInt(4, l_r_ref+1);
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
	/**레슨 댓글 삭제 메서드*/
	public int lessonReDel(int l_r_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_lesson_re set l_r_del=1, l_r_con=? where l_r_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,	"삭제된 댓글입니다.");
			ps.setInt(2, l_r_idx);
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
	/**레슨 대댓글 순번 수정 메서드*/
	public int updateSun(int ref,int sunbun,int l_idx) {
		try {
			String sql="update tomato_lesson_re set l_r_sunbun=l_r_sunbun+1 where l_r_ref=? and l_r_sunbun>=? and l_idx=? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.setInt(3, l_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	/**레슨 대댓글 쓰기 메서드*/
	public int lessonReReWrite(LessonReDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			updateSun(dto.getL_r_ref(),dto.getL_r_sunbun()+1,dto.getL_idx());
			String sql="insert into tomato_lesson_re values(tomato_lesson_re_l_r_idx.nextval,?,?,?,sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getL_idx());
			ps.setInt(2, dto.getM_idx());
			ps.setString(3, dto.getL_r_con());
			ps.setInt(4, dto.getL_r_ref());
			ps.setInt(5, dto.getL_r_lev()+1);
			ps.setInt(6, dto.getL_r_sunbun()+1);
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
	
	/**각레슨에 해당하는 총댓글 수 반환 메서드 */
	public int getReTotalCnt(int l_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_lesson_re where l_idx=? and l_r_del=0";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**레슨 댓글 목록 메서드*/
	public ArrayList<LessonReDTO> lessonReList(int l_idx,int cp,int ls){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from(select rownum as rnum,a.* from "
					+ "(select a.*, b.m_id, b.m_name from tomato_lesson_re a join tomato_member b on a.m_idx=b.m_idx where l_idx=? order by l_r_ref desc, l_r_sunbun asc, l_r_idx desc) a)b "
					+ "where rnum>=? and rnum<=?";
	
			ps=conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			ArrayList<LessonReDTO> arr=new ArrayList<LessonReDTO>();
			while(rs.next()) {
				int l_r_idx=rs.getInt("l_r_idx");
				int m_idx=rs.getInt("m_idx");
				String l_r_con=rs.getString("l_r_con");
				java.sql.Date l_r_joindate=rs.getDate("l_r_joindate");
				int l_r_del=rs.getInt("l_r_del");
				int l_r_ref=rs.getInt("l_r_ref");
				int l_r_lev=rs.getInt("l_r_lev");
				int l_r_sunbun=rs.getInt("l_r_sunbun");
				String m_id=rs.getString("m_id");
				String m_name=rs.getString("m_name");
				
				LessonReDTO dto=new LessonReDTO(l_r_idx, l_idx, m_idx, l_r_con, l_r_joindate, l_r_del, l_r_ref, l_r_lev, l_r_sunbun, m_id, m_name);
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
	}//
}







































