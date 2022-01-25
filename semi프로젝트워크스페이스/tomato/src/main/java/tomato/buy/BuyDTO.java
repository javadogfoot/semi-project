package tomato.buy;

import java.sql.*;

public class BuyDTO {

	private int s_idx;
	private int m_idx;
	
	public BuyDTO() {
		
	}

	public BuyDTO(int s_idx, int m_idx) {
		super();
		this.s_idx = s_idx;
		this.m_idx = m_idx;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	
		
}
