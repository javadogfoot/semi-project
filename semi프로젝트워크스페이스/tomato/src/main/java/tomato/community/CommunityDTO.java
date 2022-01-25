package tomato.community;

import java.sql.*;

public class CommunityDTO {
	
	private int m_idx;
	private String m_name;
	private int c_idx;
	private String c_sub;
	private String c_con;
	private Date c_joindate;
	private int c_del;
	private int re_count;
	private String m_id;
	
	public CommunityDTO() {
		super();
	}

	public CommunityDTO(int m_idx, String m_name, int c_idx, String c_sub, String c_con, Date c_joindate, int c_del, int re_count) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.c_idx = c_idx;
		this.c_sub = c_sub;
		this.c_con = c_con;
		this.c_joindate = c_joindate;
		this.c_del = c_del;
		this.re_count = re_count;
	}
	

	public CommunityDTO(String m_name, int c_idx, String c_sub, String c_con, Date c_joindate, String m_id) {
		super();
		this.m_name = m_name;
		this.c_idx = c_idx;
		this.c_sub = c_sub;
		this.c_con = c_con;
		this.c_joindate = c_joindate;
		this.m_id = m_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getC_del() {
		return c_del;
	}

	public void setC_del(int c_del) {
		this.c_del = c_del;
	}

	public int getRe_count() {
		return re_count;
	}

	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_name() {
		return m_name;
	}
	
	public void setM_name(String m_name) { 
		this.m_name = m_name;
	}
	
	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_sub() {
		return c_sub;
	}

	public void setC_sub(String c_sub) {
		this.c_sub = c_sub;
	}

	public String getC_con() {
		return c_con;
	}

	public void setC_con(String c_con) {
		this.c_con = c_con;
	}

	public Date getC_joindate() {
		return c_joindate;
	}

	public void setC_joindate(Date c_joindate) {
		this.c_joindate = c_joindate;
	}
	
}
