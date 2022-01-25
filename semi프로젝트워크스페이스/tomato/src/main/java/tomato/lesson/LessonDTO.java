package tomato.lesson;

import java.sql.*;

public class LessonDTO {
	
	private int m_idx;
	private int l_idx;
	private String l_name;
	private String l_con;
	private Date l_joindate;
	private Date l_enddate;
	private int l_people;
	private int l_del;
	private int l_lessonok;
	private String l_addr;
	private String m_id; //추가정보
	private String m_name; //추가정보
	private int m_idxcnt; //추가정보
	
	
	public LessonDTO() {
		super();
	}
	public LessonDTO(int m_idx, int l_idx, String l_name, String l_con, Date l_joindate, Date l_enddate, int l_people,
			int l_del, int l_lessonok, String l_addr, int m_idxcnt) {
		super();
		this.m_idx = m_idx;
		this.l_idx = l_idx;
		this.l_name = l_name;
		this.l_con = l_con;
		this.l_joindate = l_joindate;
		this.l_enddate = l_enddate;
		this.l_people = l_people;
		this.l_del = l_del;
		this.l_lessonok = l_lessonok;
		this.l_addr = l_addr;
		this.m_idxcnt = m_idxcnt;
	}
	
	public LessonDTO(int m_idx, int l_idx, String l_name, String l_con, Date l_joindate, Date l_enddate, int l_people,
			int l_del, int l_lessonok, String l_addr, int m_idxcnt, String m_id, String m_name) {
		super();
		this.m_idx = m_idx;
		this.l_idx = l_idx;
		this.l_name = l_name;
		this.l_con = l_con;
		this.l_joindate = l_joindate;
		this.l_enddate = l_enddate;
		this.l_people = l_people;
		this.l_del = l_del;
		this.l_lessonok = l_lessonok;
		this.l_addr = l_addr;
		this.m_idxcnt = m_idxcnt;
		this.m_id = m_id;
		this.m_name = m_name;
	}
	
	
	
	
	public LessonDTO(int l_idx, String l_name, Date l_joindate) {
		super();
		this.l_idx = l_idx;
		this.l_name = l_name;
		this.l_joindate = l_joindate;
	}
	public LessonDTO(int l_idx, String l_name, String l_con, Date l_joindate, String m_name) {
		super();
		this.l_idx = l_idx;
		this.l_name = l_name;
		this.l_con = l_con;
		this.l_joindate = l_joindate;
		this.m_name = m_name;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_con() {
		return l_con;
	}
	public void setL_con(String l_con) {
		this.l_con = l_con;
	}
	public Date getL_joindate() {
		return l_joindate;
	}
	public void setL_joindate(Date l_joindate) {
		this.l_joindate = l_joindate;
	}
	public Date getL_enddate() {
		return l_enddate;
	}
	public void setL_enddate(Date l_enddate) {
		this.l_enddate = l_enddate;
	}
	public int getL_people() {
		return l_people;
	}
	public void setL_people(int l_people) {
		this.l_people = l_people;
	}
	public int getL_del() {
		return l_del;
	}
	public void setL_del(int l_del) {
		this.l_del = l_del;
	}
	public int getL_lessonok() {
		return l_lessonok;
	}
	public void setL_lessonok(int l_lessonok) {
		this.l_lessonok = l_lessonok;
	}
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public int getM_idxcnt() {
		return m_idxcnt;
	}
	public void setM_idxcnt(int m_idxcnt) {
		this.m_idxcnt = m_idxcnt;
	}
	
	
}
