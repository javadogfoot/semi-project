package tomato.lesson_buy;

import java.sql.*;

public class LessonBuyDTO {

	private int l_idx;
	private int m_idx;
	
	public LessonBuyDTO() {
		super();
	}

	public LessonBuyDTO(int l_idx, int m_idx) {
		super();
		this.l_idx = l_idx;
		this.m_idx = m_idx;
	}

	public int getL_idx() {
		return l_idx;
	}

	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	
	
}
