package tomato.buy;

import java.sql.*;


import java.util.*;
import javax.naming.*;
import javax.sql.*;

import tomato.sell.SellDTO;

public class BuyDAO {

   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   public BuyDAO() {
      
   }
   public int buyItem(int s_idx, int m_idx) {
      try {
         conn=tomato.db.TomatoDB.getConn();
         String sql="insert into tomato_buy values(?,?)";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, s_idx);
         ps.setInt(2, m_idx);
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
   /**찜하기 유무 관련 메서드*/
   public int getbuyY_N(int s_idx, int m_idx) {
      try {
         conn=tomato.db.TomatoDB.getConn();
         String sql="select count(*) from tomato_buy where s_idx=? and m_idx=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, s_idx);
         ps.setInt(2, m_idx);
         rs=ps.executeQuery();
         rs.next();
         int result=rs.getInt(1);
         return result;
      }catch(Exception e) {
         e.printStackTrace();
         return 0;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         }catch(Exception e2) {
            
         }
      }
   }
   public int deleteBuyItem(int s_idx, int m_idx) {
      try {
         conn=tomato.db.TomatoDB.getConn();
         String sql="delete from tomato_buy where s_idx=? and m_idx=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, s_idx);
         ps.setInt(2, m_idx);
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
   public int sellJjimTotalCnt(int m_idx) {
	   try {
		   conn=tomato.db.TomatoDB.getConn();
		   String sql="select count(*) from tomato_buy where m_idx=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, m_idx);
		   rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count==0?1:count;
	   }catch(Exception e){
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
   
   /**내가 찜한 목록 관련 메서드*/
      public ArrayList<SellDTO> SellJjimList(int m_idx){
         try {
            conn=tomato.db.TomatoDB.getConn();
         
            String sql="select tb.*, ts.s_name, ts.s_selldate, ts.s_count, ts.s_del, ts.s_sellok from tomato_buy tb "
                  + "left join tomato_sell ts on ts.s_idx = tb.s_idx "
                  + "where tb.m_idx = ?";
            ps=conn.prepareStatement(sql);
            ps.setInt(1, m_idx);
            
            rs=ps.executeQuery();
            ArrayList<SellDTO> arr=new ArrayList<SellDTO>();
            while(rs.next()) {
               int s_idx=rs.getInt("s_idx");
               String s_name=rs.getString("s_name");
               int s_price= 0;
               String s_cate= null;
               String s_con= null;
               String s_port= null;
               int s_del=rs.getInt("s_del");
               int s_sellok= rs.getInt("s_sellok");
               java.sql.Date s_selldate=rs.getDate("s_selldate");
               String s_addr= null;
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