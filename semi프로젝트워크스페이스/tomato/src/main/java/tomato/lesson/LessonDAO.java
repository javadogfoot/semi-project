package tomato.lesson;

import java.sql.*;

import java.util.*;

import tomato.member.MemberDTO;
import tomato.qna.QnaDTO;

public class LessonDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private String userid;

	public LessonDAO() {

	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	/** m_idx 가져오기 메서드 */
	public int selectMidx(String m_id) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select m_idx from tomato_member where m_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, m_id);
			rs = ps.executeQuery();
			rs.next();
			int m_idx = rs.getInt(1);
			return m_idx;
		} catch (Exception e) {
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** member 전부 가져오기 메서드 */
	public MemberDTO selectAllm(String m_id) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select * from tomato_member where m_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, m_id);
			rs = ps.executeQuery();
			MemberDTO dto = null;
			if (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String m_pwd = rs.getString("m_pwd");
				String m_name = rs.getString("m_name");
				String m_email = rs.getString("m_email");
				String m_addr = rs.getString("m_addr");
				String m_tel = rs.getString("m_tel");
				String m_birth = rs.getString("m_birth");
				int m_smsok = rs.getInt("m_smsok");
				int m_emailok = rs.getInt("m_emailok");
				String m_ask = rs.getString("m_ask");
				String m_answer = rs.getString("m_answer");
				java.sql.Date m_joindate = rs.getDate("m_joindate");
				int m_del = rs.getInt("m_del");

				dto = new MemberDTO(m_idx, m_id, m_pwd, m_name, m_email, m_addr, m_tel, m_tel, m_smsok, m_emailok,
						m_ask, m_answer, m_joindate, m_del);
			}
			return dto;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 레슨 글쓰기 메서드 */
	public int lessonWrite(LessonDTO dto) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "insert into tomato_lesson values(?,tomato_lesson_l_idx.nextval,?,?,sysdate,?,?,0,0,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getM_idx());
			ps.setString(2, dto.getL_name());
			ps.setString(3, dto.getL_con());
			ps.setDate(4, dto.getL_enddate());
			ps.setInt(5, dto.getL_people());
			ps.setString(6, dto.getL_addr());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

	}

	/** 레슨 수정 메서드 */
	public int lessonUpdate(LessonDTO dto) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_lesson set l_addr=?,l_name=?,l_con=?,l_enddate=?,l_people=? where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getL_addr());
			ps.setString(2, dto.getL_name());
			ps.setString(3, dto.getL_con());
			ps.setDate(4, dto.getL_enddate());
			ps.setInt(5, dto.getL_people());
			ps.setInt(6, dto.getL_idx());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 레슨 삭제 메서드 */
	public int lessonDel(int l_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_lesson set l_del=1 where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	/** 레슨 날짜 마감 메서드 */
	public int lessonOk() {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_lesson set l_lessonok=1 where l_enddate+1<sysdate";
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)ps.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
	}
	/**레슨 날짜 디데이 메서드*/
	public int lessonDDay(int l_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select trunc(l_enddate-sysdate+1,0) from tomato_lesson where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			rs=ps.executeQuery();
			rs.next();
			int dday=rs.getInt(1);
			return dday;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)ps.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
	}


	/** 전체지역 레슨 총게시물 수 반환 메서드 */
	public int getTotalCnt() {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from tomato_lesson where l_del=0 and l_lessonok=0";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 지역별 레슨 총게시물 수 반환 메서드 */
	public int getTotalCnt(String l_addr) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from tomato_lesson where l_del=0 and l_lessonok=0 and l_addr=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, l_addr);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/** 마이페이지 내가 올린 레슨 총게시물 수 반환 메서드 */
	public int getMyLessonTotalCnt(int m_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from tomato_lesson where m_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/** 관리자페이지 전체지역 레슨 총게시물 수 반환 메서드 */
	public int getAdminLessonTotalCnt() {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from tomato_lesson";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 전체 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> lessonList(int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from " + "(select a.*, b.m_id , b.m_name "
					+ "from tomato_lesson a join tomato_member b "
					+ "on a.m_idx = b.m_idx where l_del=0 and l_lessonok=0 order by l_idx desc) a)b " + "where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);

				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 지역별 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> lessonList(String l_addr, int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from " + "(select a.*, b.m_id , b.m_name "
					+ "from tomato_lesson a join tomato_member b "
					+ "on a.m_idx = b.m_idx where l_del=0 and l_lessonok=0 and l_addr=? order by l_idx desc) a)b "
					+ "where rnum>=? and rnum<=?";
			
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, l_addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);

				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/** 마이페이지 내가 올린 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> myLessonList(int m_idx, int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from(select * from tomato_lesson where m_idx=? order by l_idx desc) a)b where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				 m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt);

				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/** 관리자페이지 모든 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> adminLessonList(int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from " + "(select a.*, b.m_id , b.m_name "
					+ "from tomato_lesson a join tomato_member b "
					+ "on a.m_idx = b.m_idx order by l_idx desc) a)b "
					+ "where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);

				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 전체지역 인기 레슨 총게시물 수 반환 메서드 */
	public int getPopularTotalCnt() {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select count(*) from(select row_number() over(order by m_idxcnt desc)rank from tomato_lesson where l_del=0 and l_lessonok=0)where rank<=3";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 지역별 인기 레슨 총게시물 수 반환 메서드 */
	public int getPopularTotalCnt(String l_addr) {
		try {
			conn = tomato.db.TomatoDB.getConn();/////// 랭크 절 갯수 만들기
			String sql = "select count(*) from(select row_number() over(order by m_idxcnt desc)rank from tomato_lesson where l_del=0 and l_lessonok=0 and l_addr=?)where rank<=3";
			ps = conn.prepareStatement(sql);
			ps.setString(1, l_addr);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 전체지역 인기 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> lessonPopularList(int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from "
					+ "(select a.*, b.m_id, b.m_name, row_number() " // distinct
					+ "over(order by m_idxcnt desc)rank " + "from tomato_lesson a join tomato_member b "
					+ "on a.m_idx = b.m_idx " + "where l_del=0 and l_lessonok=0 order by rank ) a)b "
					+ "where rnum>=? and rnum<=? and rank<=3";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 지역별 인기 레슨 리스트 메서드 */
	public ArrayList<LessonDTO> lessonPopularList(String l_addr, int cp, int ls) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from(select rownum as rnum,a.* from "
					+ "(select a.*, b.m_id, b.m_name, row_number() " // distinct
					+ "over(order by m_idxcnt desc)rank " + "from tomato_lesson a join tomato_member b "
					+ "on a.m_idx = b.m_idx " + "where l_del=0 and l_lessonok=0 and l_addr=? order by rank) a)b "
					+ "where rnum>=? and rnum<=? and rank<=3";

			ps = conn.prepareStatement(sql);
			ps.setString(1, l_addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 레슨 신청인원수 메서드 */
	public int getJoinCnt(int l_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_lesson set m_idxcnt=m_idxcnt+1 where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 레슨 취소 신청인원수 메서드 */
	public int getJoinCancleCnt(int l_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "update tomato_lesson set m_idxcnt=m_idxcnt-1 where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 레슨 본문 메서드 */
	public LessonDTO lessonContent(int l_idx) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select a.*,b.m_id,b.m_name from tomato_lesson a join tomato_member b on a.m_idx=b.m_idx where l_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, l_idx);
			rs = ps.executeQuery();
			LessonDTO dto = null;
			if (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del, l_lessonok,
						l_addr, m_idxcnt, m_id, m_name);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 전체지역 레슨 검색 메서드 */
	public ArrayList<LessonDTO> lessonSearch(String searchKey, String searchValue) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select a.*,b.m_id,b.m_name from tomato_lesson a join tomato_member b on a.m_idx = b.m_idx "
					+ "where " + searchKey + " like '%" + searchValue + "%' and l_del=0 and l_lessonok=0";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				String l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 지역별 레슨 검색 메서드 */
	public ArrayList<LessonDTO> lessonSearch(String searchKey, String searchValue, String l_addr) {
		try {
			conn = tomato.db.TomatoDB.getConn();
			String sql = "select a.*,b.m_id,b.m_name from tomato_lesson a join tomato_member b on a.m_idx = b.m_idx "
					+ "where " + searchKey + " like '%" + searchValue + "%' and l_del=0 and l_lessonok=0 and l_addr=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, l_addr);
			rs = ps.executeQuery();
			ArrayList<LessonDTO> arr = new ArrayList<LessonDTO>();
			while (rs.next()) {
				int m_idx = rs.getInt("m_idx");
				int l_idx = rs.getInt("l_idx");
				String l_name = rs.getString("l_name");
				String l_con = rs.getString("l_con");
				java.sql.Date l_joindate = rs.getDate("l_joindate");
				java.sql.Date l_enddate = rs.getDate("l_enddate");
				int l_people = rs.getInt("l_people");
				int l_del = rs.getInt("l_del");
				int l_lessonok = rs.getInt("l_lessonok");
				l_addr = rs.getString("l_addr");
				int m_idxcnt = rs.getInt("m_idxcnt");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");

				LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
						l_lessonok, l_addr, m_idxcnt, m_id, m_name);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/**레슨 키워드 검색 관련 메서드*/
	public ArrayList<LessonDTO> keywordFind(String keyword){
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_lesson tl left join tomato_member tm on tl.m_idx = tm.m_idx where l_name like '%"+keyword+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<LessonDTO> arr=new ArrayList<LessonDTO>();
			while(rs.next()) {
				String m_name=rs.getString("m_name");
				int l_idx=rs.getInt("l_idx");
				String l_name=rs.getString("l_name");
				String l_con=rs.getString("l_con");
				java.sql.Date l_joindate=rs.getDate("l_joindate");
				
				LessonDTO dto=new LessonDTO(l_idx, l_name, l_con, l_joindate, m_name);
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
	
	 /**신청자 인원수 메서드*/
	   public int lessonJoinList(int l_idx) {
	      try {
	         conn = tomato.db.TomatoDB.getConn();
	         String sql="select count(m_idx) from tomato_lesson_buy where l_idx=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, l_idx);
	         rs = ps.executeQuery();
	         rs.next();
	         int count=rs.getInt(1);
	         return count;
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         }catch(Exception e2) {}
	      }
	   }
	   
	   /**레슨 내가 쓴 글 조회 관련 메서드*/
		public ArrayList<LessonDTO> myLesson(int m_idx, int cp, int ls){
			try {
				conn=tomato.db.TomatoDB.getConn();
				int start = (cp - 1) * ls + 1;
		        int end = cp * ls;
				String sql="select * from(select rownum as rnum,a.* from(select * from tomato_lesson where m_idx=? order by l_idx desc) a)b where rnum>=? and rnum<=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, m_idx);
				ps.setInt(2, start);
		        ps.setInt(3, end);
				rs=ps.executeQuery();	
				ArrayList<LessonDTO> arr=new ArrayList<LessonDTO>();
				while(rs.next()) {
					m_idx = rs.getInt("m_idx");
					int l_idx = rs.getInt("l_idx");
					String l_name = rs.getString("l_name");
					String l_con = rs.getString("l_con");
					java.sql.Date l_joindate = rs.getDate("l_joindate");
					java.sql.Date l_enddate = rs.getDate("l_enddate");
					int l_people = rs.getInt("l_people");
					int l_del = rs.getInt("l_del");
					int l_lessonok = rs.getInt("l_lessonok");
					String l_addr = rs.getString("l_addr");
					int m_idxcnt = rs.getInt("m_idxcnt");

					LessonDTO dto = new LessonDTO(m_idx, l_idx, l_name, l_con, l_joindate, l_enddate, l_people, l_del,
							l_lessonok, l_addr, m_idxcnt);

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
				}
			}
		}
}
