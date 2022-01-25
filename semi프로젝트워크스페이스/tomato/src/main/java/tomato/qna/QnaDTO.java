package tomato.qna;

import java.sql.*;

public class QnaDTO {

	private int m_idx;
	private String m_name;
	private int q_idx;
	private String q_sub;
	private String q_con;
	private Date q_joindate;
	private String q_status;
	private int q_ref;
	private int q_lev;
	private int q_sunbun;
	private String m_id;
	
	public QnaDTO() {
		super();
	}

	
	
	public QnaDTO(int m_idx, int q_idx, String q_sub, String q_con, Date q_joindate, String q_status, String m_name) {
		super();
		this.m_name = m_name;
		this.m_idx = m_idx;
		this.q_idx = q_idx;
		this.q_sub = q_sub;
		this.q_con = q_con;
		this.q_joindate = q_joindate;
		this.q_status = q_status;
	}



	public QnaDTO(int m_idx, int q_idx, String q_sub, String q_con, Date q_joindate, String q_status, int q_ref,
			int q_lev, int q_sunbun, String m_name, String m_id) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.q_idx = q_idx;
		this.q_sub = q_sub;
		this.q_con = q_con;
		this.q_joindate = q_joindate;
		this.q_status = q_status;
		this.q_ref = q_ref;
		this.q_lev = q_lev;
		this.q_sunbun = q_sunbun;
		this.m_name = m_name;
	}
	
	

	public QnaDTO(int m_idx, int q_idx, String q_sub, String q_con, Date q_joindate, String q_status, int q_ref,
			int q_lev, int q_sunbun) {
		super();
		this.m_idx = m_idx;
		this.q_idx = q_idx;
		this.q_sub = q_sub;
		this.q_con = q_con;
		this.q_joindate = q_joindate;
		this.q_status = q_status;
		this.q_ref = q_ref;
		this.q_lev = q_lev;
		this.q_sunbun = q_sunbun;
	}

	
	
	
	public QnaDTO(int m_idx, String m_name, int q_idx, String q_sub, String q_con, Date q_joindate, String q_status,
			int q_ref, int q_lev, int q_sunbun, String m_id) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.q_idx = q_idx;
		this.q_sub = q_sub;
		this.q_con = q_con;
		this.q_joindate = q_joindate;
		this.q_status = q_status;
		this.q_ref = q_ref;
		this.q_lev = q_lev;
		this.q_sunbun = q_sunbun;
		this.m_id = m_id;
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

	public int getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}

	public String getQ_sub() {
		return q_sub;
	}

	public void setQ_sub(String q_sub) {
		this.q_sub = q_sub;
	}

	public String getQ_con() {
		return q_con;
	}

	public void setQ_con(String q_con) {
		this.q_con = q_con;
	}

	public Date getQ_joindate() {
		return q_joindate;
	}

	public void setQ_joindate(Date q_joindate) {
		this.q_joindate = q_joindate;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_lev() {
		return q_lev;
	}

	public void setQ_lev(int q_lev) {
		this.q_lev = q_lev;
	}

	public int getQ_sunbun() {
		return q_sunbun;
	}

	public void setQ_sunbun(int q_sunbun) {
		this.q_sunbun = q_sunbun;
	}
	
	
	
}
