package tomato.community_re;

import java.sql.*;

public class CommunityReDTO {

	private int c_r_idx;
	private int c_idx;
	private int m_idx;
	private String m_name;
	private String c_r_con;
	private Date c_r_joindate;
	private int c_r_del;
	private int c_r_ref;
	private int c_r_lev;
	private int c_r_sunbun;
	
	public CommunityReDTO() {
		super();
	}

	public CommunityReDTO(int c_r_idx, int c_idx, int m_idx, String m_name, String c_r_con, Date c_r_joindate, int c_r_del,
			int c_r_ref, int c_r_lev, int c_r_sunbun) {
		super();
		this.c_r_idx = c_r_idx;
		this.c_idx = c_idx;
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.c_r_con = c_r_con;
		this.c_r_joindate = c_r_joindate;
		this.c_r_del = c_r_del;
		this.c_r_ref = c_r_ref;
		this.c_r_lev = c_r_lev;
		this.c_r_sunbun = c_r_sunbun;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getC_r_idx() {
		return c_r_idx;
	}

	public void setC_r_idx(int c_r_idx) {
		this.c_r_idx = c_r_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getC_r_con() {
		return c_r_con;
	}

	public void setC_r_con(String c_r_con) {
		this.c_r_con = c_r_con;
	}

	public Date getC_r_joindate() {
		return c_r_joindate;
	}

	public void setC_r_joindate(Date c_r_joindate) {
		this.c_r_joindate = c_r_joindate;
	}

	public int getC_r_del() {
		return c_r_del;
	}

	public void setC_r_del(int c_r_del) {
		this.c_r_del = c_r_del;
	}

	public int getC_r_ref() {
		return c_r_ref;
	}

	public void setC_r_ref(int c_r_ref) {
		this.c_r_ref = c_r_ref;
	}

	public int getC_r_lev() {
		return c_r_lev;
	}

	public void setC_r_lev(int c_r_lev) {
		this.c_r_lev = c_r_lev;
	}

	public int getC_r_sunbun() {
		return c_r_sunbun;
	}

	public void setC_r_sunbun(int c_r_sunbun) {
		this.c_r_sunbun = c_r_sunbun;
	}
	
	
}
