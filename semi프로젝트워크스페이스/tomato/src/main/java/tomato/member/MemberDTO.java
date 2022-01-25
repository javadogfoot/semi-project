package tomato.member;

import java.sql.*;

public class MemberDTO {

	private int m_idx;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_addr;
	private String m_tel;
	private String m_birth;
	private int m_smsok;
	private int m_emailok;
	private String m_ask;
	private String m_answer;
	private Date m_joindate;
	private int m_del;
	
	public MemberDTO() {
		
	}

	public MemberDTO(int m_idx, String m_id, String m_pwd, String m_name, String m_email, String m_addr, String m_tel,
			String m_birth, int m_smsok, int m_emailok, String m_ask, String m_answer, Date m_joindate, int m_del) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_addr = m_addr;
		this.m_tel = m_tel;
		this.m_birth = m_birth;
		this.m_smsok = m_smsok;
		this.m_emailok = m_emailok;
		this.m_ask = m_ask;
		this.m_answer = m_answer;
		this.m_joindate = m_joindate;
		this.m_del = m_del;
	}
	
	public MemberDTO(int m_idx, String m_id, String m_name, String m_email, String m_addr, String m_tel, String m_birth,
		       Date m_joindate) {
		    super();
		    this.m_idx = m_idx;
		    this.m_id = m_id;
		    this.m_name = m_name;
		    this.m_email = m_email;
		    this.m_addr = m_addr;
		    this.m_tel = m_tel;
		    this.m_birth = m_birth;
		    this.m_joindate = m_joindate;
	 }
	
	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public int getM_smsok() {
		return m_smsok;
	}

	public void setM_smsok(int m_smsok) {
		this.m_smsok = m_smsok;
	}

	public int getM_emailok() {
		return m_emailok;
	}

	public void setM_emailok(int m_emailok) {
		this.m_emailok = m_emailok;
	}

	public String getM_ask() {
		return m_ask;
	}

	public void setM_ask(String m_ask) {
		this.m_ask = m_ask;
	}

	public String getM_answer() {
		return m_answer;
	}

	public void setM_answer(String m_answer) {
		this.m_answer = m_answer;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	public int getM_del() {
		return m_del;
	}

	public void setM_del(int m_del) {
		this.m_del = m_del;
	}
	
}
