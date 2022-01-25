package tomato.sell;

import java.util.*;
import java.sql.*;
import java.io.*;
import java.net.*;
import javax.naming.*;
import javax.sql.*;

public class SellDAO {
	
	public static final String USERS_HOME="C:\\장해림\\semi\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\tomato\\sell\\upload";
	public static final String No_IMAGE="\\tomato\\sell\\upload\\admin\\noImage.png";
	public static final String IMAGE_ROOT="/tomato/sell/upload";
	public static final String DELETE_IMG_ROOT="C:\\장해림\\semi\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps";
	
	private String userid;
	private String crpath;
	private int sellidx;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public SellDAO() {
		
	}
	
	public int getSellIdx() {
		return sellidx;
	}
	public void setSellIdx(int sellidx) {
		this.sellidx=sellidx;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}
	/**폴더 생성*/
	public void sellFolderExist() throws IOException{
		
		File f=new File(USERS_HOME+"/"+userid);
		if(!f.exists()) {
			f.mkdir();
		}
	}
	/**제품 등록 관련 메서드*/
	public int sellProduct(SellDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="insert into tomato_sell values(?,tomato_sell_s_idx.nextval,?,?,?,?,?,0,0,sysdate,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getM_idx());
			ps.setString(2, dto.getS_name());
			ps.setInt(3, dto.getS_price());
			ps.setString(4, dto.getS_cate());
			ps.setString(5, dto.getS_con());
			ps.setString(6, No_IMAGE);
			ps.setString(7, dto.getS_addr());
			int count=ps.executeUpdate();
			int result=-1;
			if(count>0) {
				result=findCurrentIdx();
			}
			return result;
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
	/**사진 경로 들어갈 s_idx 값 찾기*/
	public int findCurrentIdx() {
		try {
			String sql="select tomato_sell_s_idx.currval from tomato_sell";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int s_idx=0;
			if(rs.next()) {
				s_idx=rs.getInt(1);
			}
			return s_idx;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**제품 사진 경로 저장 메서드*/
	public int updateImg(int s_idx, String filepath) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell set s_port=? where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, filepath);
			ps.setInt(2, s_idx);
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
	/**총게시물수 반환*/
	public int getTotalCnt(String addr) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_sell where s_addr=? and s_del=0";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**게시물 리스트*/
	public ArrayList<SellDTO> SellList(int cp, int ls, String addr, String col, String range){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=(cp*ls);
			String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where s_addr=? and s_del=0 order by "+col+" "+range+") a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int s_idx=rs.getInt("s_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
	/**검색된 게시물 수*/
	public int searchGetTotalCnt(String addr, String cate, String searchValue) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_sell where S_NAME like '%"+searchValue+"%' and s_addr=? and s_del=0 and s_cate=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ps.setString(2, cate);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**검색된 상품 리스트 메서드*/
	public ArrayList<SellDTO> searchSellList(String cate, String searchValue, int cp, int ls, String addr){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=(cp*ls);
			String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where (S_NAME like '%"+searchValue+"%' or s_con like '%"+searchValue+"%') and s_addr=? and s_del=0 and s_cate=? order by s_idx desc) a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ps.setString(2, cate);
			ps.setInt(3, start);
			ps.setInt(4, end);
			rs=ps.executeQuery();
			ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int s_idx=rs.getInt("s_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
	
	/////////////////////////////////////////////////////////////
	/**판매완료 상풍 제외*/
	/**총게시물수 반환*/
	public int getTotalCnt_selling(String addr) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_sell where s_addr=? and s_sellok=0 and s_del=0";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**게시물 리스트*/
	public ArrayList<SellDTO> SellList_selling(int cp, int ls, String addr, String col, String range){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=(cp*ls);
			String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where s_addr=? and s_sellok=0 and s_del=0 order by "+col+" "+range+") a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int s_idx=rs.getInt("s_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
	/**제품 정보 관련 메서드*/
	public SellDTO getSellContent(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_sell where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			rs=ps.executeQuery();
			SellDTO dto=null;
			if(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
			}
			return dto;
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
	//장바구니 추가 관련 메서드
	public int plusBuyCount(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell set s_count=s_count+1 where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			int result=ps.executeUpdate();
			return result;
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
	//장바구니 제거 관련 메서드
	public int minusBuyCount(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell set s_count=s_count-1 where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			int result=ps.executeUpdate();
			return result;
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
	//게시물 삭제 관련 메서드
	public int deleteSell(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell set s_del=1 where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			int result=ps.executeUpdate();
			return result;
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
	//제품 정보 가져오는 메서드
	public SellDTO updateSellList(int s_idx) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select * from tomato_sell where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			rs=ps.executeQuery();
			SellDTO dto=null;
			if(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
			}
			return dto;
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
	//제품 정보 수정 메서드
	public int updateSell(SellDTO dto) {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="update tomato_sell set s_name=?, s_price=?, s_cate=?, s_con=?,s_addr=?,s_sellok=? where s_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getS_name());
			ps.setInt(2, dto.getS_price());
			ps.setString(3, dto.getS_cate());
			ps.setString(4, dto.getS_con());
			ps.setString(5, dto.getS_addr());
			ps.setInt(6, dto.getS_sellok());
			ps.setInt(7, dto.getS_idx());
			int result=ps.executeUpdate();
			return result;
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
	//사진 삭제 관련 메서드
	public boolean deleteImg(File f) {
		Boolean result=f.delete();
		return result;
	}
	/////////////////////////////////////////////////////////////////////
	//관리자 한정 메서드
	//게시물 수(서울 전체)
	public int getAdminTotalCnt() {
		try {
			conn=tomato.db.TomatoDB.getConn();
			String sql="select count(*) from tomato_sell where s_del=0";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	//게시물 리스트(서울 전체)
	public ArrayList<SellDTO> adminSellList(int cp, int ls, String col, String range){
		try {
			conn=tomato.db.TomatoDB.getConn();
			int start=(cp-1)*ls+1;
			int end=(cp*ls);
			String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where s_del=0 order by "+col+" "+range+") a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
			while(rs.next()) {
				int m_idx=rs.getInt("m_idx");
				int s_idx=rs.getInt("s_idx");
				String s_name=rs.getString("s_name");
				int s_price=rs.getInt("s_price");
				String s_cate=rs.getString("s_cate");
				String s_con=rs.getString("s_con");
				String s_port=rs.getString("s_port");
				int s_del=rs.getInt("s_del");
				int s_sellok=rs.getInt("s_sellok");
				java.sql.Date s_selldate=rs.getDate("s_selldate");
				String s_addr=rs.getString("s_addr");
				int s_count=rs.getInt("s_count");
				SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
	//////////////////////////////////////////////////////////////
	//판매완료 게시물 제외
	//게시물 수(서울 전체)
		public int getAdminTotalCnt_selling() {
			try {
				conn=tomato.db.TomatoDB.getConn();
				String sql="select count(*) from tomato_sell where s_del=0 and s_sellok=0";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				int count=0;
				if(rs.next()) {
					count=rs.getInt(1);
				}
				return count==0?1:count;
			}catch(Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {
					
				}
			}
		}
		//게시물 리스트
		public ArrayList<SellDTO> adminSellList_selling(int cp, int ls, String col, String range){
			try {
				conn=tomato.db.TomatoDB.getConn();
				int start=(cp-1)*ls+1;
				int end=(cp*ls);
				String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where s_del=0 and s_sellok=0 order by "+col+" "+range+") a) b where rnum>=? and rnum<=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				rs=ps.executeQuery();
				ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
				while(rs.next()) {
					int m_idx=rs.getInt("m_idx");
					int s_idx=rs.getInt("s_idx");
					String s_name=rs.getString("s_name");
					int s_price=rs.getInt("s_price");
					String s_cate=rs.getString("s_cate");
					String s_con=rs.getString("s_con");
					String s_port=rs.getString("s_port");
					int s_del=rs.getInt("s_del");
					int s_sellok=rs.getInt("s_sellok");
					java.sql.Date s_selldate=rs.getDate("s_selldate");
					String s_addr=rs.getString("s_addr");
					int s_count=rs.getInt("s_count");
					SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
		///////////////////////////////////////
		/**관리자 검색된 게시물 수 */
		public int searchGetAdminTotalCnt(String cate, String searchValue) {
			try {
				conn=tomato.db.TomatoDB.getConn();
				String sql="select count(*) from tomato_sell where (S_NAME like '%"+searchValue+"%' or s_con like '%"+searchValue+"%') and s_del=0 and s_cate=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, cate);
				rs=ps.executeQuery();
				int count=0;
				if(rs.next()) {
					count=rs.getInt(1);
				}
				return count==0?1:count;
			}catch(Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {
					
				}
			}
		}
		
		/**관리자 검색된 게시물 리스트*/
				public ArrayList<SellDTO> searchAdminSellList(String s_cate, String searchValue, int cp, int ls){
					try {
						conn=tomato.db.TomatoDB.getConn();
						int start=(cp-1)*ls+1;
						int end=(cp*ls);
						String sql="select * from (select rownum as rnum, a.* from (select * from tomato_sell where (S_NAME like '%"+searchValue+"%' or s_con like '%"+searchValue+"%') and s_del=0 and s_cate=? order by s_idx desc) a) b where rnum>=? and rnum<=?";
						ps=conn.prepareStatement(sql);
						ps.setString(1, s_cate);
						ps.setInt(2, start);
						ps.setInt(3, end);
						rs=ps.executeQuery();
						ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
						while(rs.next()) {
							int m_idx=rs.getInt("m_idx");
							int s_idx=rs.getInt("s_idx");
							String s_name=rs.getString("s_name");
							int s_price=rs.getInt("s_price");
							String s_con=rs.getString("s_con");
							String s_port=rs.getString("s_port");
							int s_del=rs.getInt("s_del");
							int s_sellok=rs.getInt("s_sellok");
							java.sql.Date s_selldate=rs.getDate("s_selldate");
							String s_addr=rs.getString("s_addr");
							int s_count=rs.getInt("s_count");
							SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
				   /**모든 상품 조회 관련 메서드*/
				   public ArrayList<SellDTO> buyList(){
				      try {
				         conn=tomato.db.TomatoDB.getConn();
				         String sql="select * from tomato_sell left join tomato_member on tomato_sell.m_idx = tomato_member.m_idx order by s_idx desc";
				         ps=conn.prepareStatement(sql);
				         rs=ps.executeQuery();
				         ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
				         while(rs.next()) {
				            int m_idx=rs.getInt("m_idx"); 
				            int s_idx=rs.getInt("s_idx");
				            String s_name=rs.getString("s_name");
				            int s_price=rs.getInt("s_price");
				            String s_cate=rs.getString("s_cate");
				            String s_con=rs.getString("s_con");
				            
				            SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con);
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
				   
				   /**상품 키워드 검색 관련 메서드*/
				   public ArrayList<SellDTO> keywordFind(String keyword){
				      try {
				         conn=tomato.db.TomatoDB.getConn();
				         String sql="select * from tomato_sell ts left join tomato_member tm on ts.m_idx = tm.m_idx where s_name like '%"+keyword+"%'";
				         ps=conn.prepareStatement(sql);
				         rs=ps.executeQuery();
				         ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
				         while(rs.next()) {
				            int m_idx=rs.getInt("m_idx"); 
				            int s_idx=rs.getInt("s_idx");
				            String s_name=rs.getString("s_name");
				            int s_price=rs.getInt("s_price");
				            String s_cate=rs.getString("s_cate");
				            String s_con=rs.getString("s_con");
				            
				            SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con);
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
				   
				   ////////////////////////////////////////////////////
				   /**헤더 검색 관련 메서드*/
				   /**헤더 검색 총 게시물 수(삭제된 게시물, 판매완료 게시물 제외 전국)*/
				   public int headerTotalCnt(String searchValue) {
						try {
							conn=tomato.db.TomatoDB.getConn();
							String sql="select count(*) from tomato_sell where (S_NAME like '%"+searchValue+"%' or s_con like '%"+searchValue+"%') and s_del=0 and s_sellok=0";
							ps=conn.prepareStatement(sql);
							rs=ps.executeQuery();
							int count=0;
							if(rs.next()) {
								count=rs.getInt(1);
							}
							return count==0?1:count;
						}catch(Exception e) {
							e.printStackTrace();
							return 1;
						}finally {
							try {
								if(rs!=null)rs.close();
								if(ps!=null)ps.close();
								if(conn!=null)conn.close();
							}catch(Exception e2) {
								
							}
						}
					}
					
					/**헤더 검색된 게시물 리스트(삭제된 게시물, 판매완료 게시물 제외 전국)*/
							public ArrayList<SellDTO> headerSellList(String searchValue, int cp, int ls){
								try {
									conn=tomato.db.TomatoDB.getConn();
									int start=(cp-1)*ls+1;
									int end=(cp*ls);
									String sql="select * from (select rownum as rnum, a.* from \r\n"
											+ "(select * from tomato_sell where s_del=0 and s_sellok=0 and \r\n"
											+ "(S_NAME like '%"+searchValue+"%' or s_con like '%"+searchValue+"%') \r\n"
											+ "order by s_idx desc) a) b where rnum>=? and rnum<=?";
									ps=conn.prepareStatement(sql);
									ps.setInt(1, start);
									ps.setInt(2, end);
									rs=ps.executeQuery();
									ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
									while(rs.next()) {
										int m_idx=rs.getInt("m_idx");
										int s_idx=rs.getInt("s_idx");
										String s_name=rs.getString("s_name");
										int s_price=rs.getInt("s_price");
										String s_cate=rs.getString("s_cate");
										String s_con=rs.getString("s_con");
										String s_port=rs.getString("s_port");
										int s_del=rs.getInt("s_del");
										int s_sellok=rs.getInt("s_sellok");
										java.sql.Date s_selldate=rs.getDate("s_selldate");
										String s_addr=rs.getString("s_addr");
										int s_count=rs.getInt("s_count");
										SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
			/**마이페이지 내가 올린 판매상품 총 게시물 수 반환 메서드*/
			public int getMySellTotalCnt(int m_idx) {
				try {
					conn=tomato.db.TomatoDB.getConn();
					String sql="select count(*) from tomato_sell where m_idx=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, m_idx);
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
					}catch(Exception e2) {
						
					}
				}
			}
			/**마이페이지 내가 올린 상품 리스트 메서드*/
			public ArrayList<SellDTO> mySellList(int m_idx, int cp, int ls){
				try {
					conn=tomato.db.TomatoDB.getConn();
					int start = (cp - 1) * ls + 1;
			        int end = cp * ls;
					String sql="select * from(select rownum as rnum,a.* from(select * from tomato_sell where m_idx=? order by s_idx desc) a)b where rnum>=? and rnum<=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, m_idx);
					ps.setInt(1, m_idx);
			        ps.setInt(2, start);
			        ps.setInt(3, end);
			        rs = ps.executeQuery();
			        ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
			        while(rs.next()) {
			        	int s_idx=rs.getInt("s_idx");
			        	String s_name=rs.getString("s_name");
			        	int s_price=rs.getInt("s_price");
			        	String s_cate=rs.getString("s_cate");
			        	String s_con=rs.getString ("s_con");
			        	String s_port=rs.getString("s_port");
			        	int s_del=rs.getInt("s_del");
			        	int s_sellok=rs.getInt("s_sellok");
			        	java.sql.Date s_selldate=rs.getDate("s_selldate");
			        	String s_addr=rs.getString("s_addr");
			        	int s_count=rs.getInt("s_count");
			        	SellDTO dto=new SellDTO(m_idx, s_idx, s_name, s_price, s_cate, s_con, s_port, s_del, s_sellok, s_selldate, s_addr, s_count);
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
							
}
