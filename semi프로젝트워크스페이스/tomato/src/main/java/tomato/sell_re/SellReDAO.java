package tomato.sell_re;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class SellReDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public SellReDAO() {
		
	}
	
	public int getTotalCnt(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_sell_re where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
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
				if(conn!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	public ArrayList<SellReDTO> sellReList(int s_idx, int cp, int ls){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=(cp*ls);
			String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell_re where s_idx=? order by s_r_ref desc, s_r_sunbun asc, s_r_idx desc) a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			ArrayList<SellReDTO> arr=new ArrayList<SellReDTO>();
			while(rs.next()){
				int s_r_idx=rs.getInt("s_r_idx");
				int m_idx=rs.getInt("m_idx");
				String s_r_con=rs.getString("s_r_con");
				java.sql.Date s_r_joindate=rs.getDate("s_r_joindate");
				int s_r_del=rs.getInt("s_r_del");
				int s_r_ref=rs.getInt("s_r_ref");
				int s_r_lev=rs.getInt("s_r_lev");
				int s_r_sunbun=rs.getInt("s_r_sunbun");
				SellReDTO dto=new SellReDTO(s_r_idx, s_idx, m_idx, s_r_con, s_r_joindate, s_r_del, s_r_ref, s_r_lev, s_r_sunbun);
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
			}catch(Exception e2) {
				
			}
		}
	}
	public String getMemberId(int m_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select m.m_id from tomato_member m, tomato_sell_re sr where m.m_idx=sr.m_idx and m.m_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			rs=ps.executeQuery();
			String m_id=null;
			if(rs.next()) {
				m_id=rs.getString(1);
			}
			return m_id;
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
	public int getMaxRef(int s_idx) {
		try {
			String sql="select max(s_r_ref) from tomato_sell_re where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			rs=ps.executeQuery();
			int s_r_ref=0;
			if(rs.next()) {
				s_r_ref=rs.getInt(1);
			}
			return s_r_ref;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	public int replyWrite(SellReDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			int s_r_ref=getMaxRef(dto.getS_idx());
			String sql="insert into tomato_sell_re values(tomato_sell_re_s_r_idx.nextval,?,?,?,sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setInt(2, dto.getM_idx());
			ps.setString(3, dto.getS_r_con());
			ps.setInt(4, s_r_ref+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**순번 수정 관련 메서드*/
	public void updateSun(int s_r_ref, int s_r_sunbun, int s_idx) {
		try {
			String sql="update tomato_sell_re set s_r_sunbun=s_r_sunbun+1 where s_r_ref=? and s_r_sunbun>=? and s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_r_ref);
			ps.setInt(2, s_r_sunbun);
			ps.setInt(3, s_idx);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**답변 글쓰기 관련 메서드*/
	public int reReWirte(SellReDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			updateSun(dto.getS_r_ref(), dto.getS_r_sunbun()+1, dto.getS_idx());
			String sql="insert into tomato_sell_re values(tomato_sell_re_s_r_idx.nextval,?,?,?,sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setInt(2, dto.getM_idx());
			ps.setString(3, dto.getS_r_con());
			ps.setInt(4, dto.getS_r_ref());
			ps.setInt(5, dto.getS_r_lev()+1);
			ps.setInt(6, dto.getS_r_sunbun()+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				
			}
		}
	}
	/**답변 삭제 관련메서드*/
	public int deleteReply(int s_r_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell_re set s_r_del=1, s_r_con=? where s_r_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, "삭제된 댓글입니다.");
			ps.setInt(2, s_r_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**댓글 읽기 가능한 사람 구하기*/
	public int getReWriter(int s_r_ref, int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select m_idx from tomato_sell_re where s_r_ref=? and s_r_lev=0 and s_r_sunbun=0 and s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_r_ref);
			ps.setInt(2, s_idx);
			rs=ps.executeQuery();
			rs.next();
			int writerIdx=rs.getInt(1);
			return writerIdx;
		}catch(Exception e) {
			e.printStackTrace();
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
}
