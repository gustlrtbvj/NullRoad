package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DAO {
	
	//전역변수
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	BuildingVO bldvo= null;
	Community_Rep_VO crvo = null;
	CommunityVO cvo= null;
	CS_ReplyVO csvo= null;
	Customer_centerVO cscvo= null;
	FilesVO fvo= null;
	MemberVO mvo= null;
	ParkingVO pvo= null;
	ReservationVO resvo= null;
	Rev_CommentVO revcvo= null;
	ReviewVO revvo= null;
	
	public void Conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		}catch (Exception e) {

		}
	}

	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
		}
	}
	



	public int Join(String m_id, String m_pw, String m_name, String m_jumin, String m_phone, String m_car_num,
			int m_point, String m_type, String m_account, String m_joindate, String admin_yn) {
		try {
			Conn();
			
			String sql = "insert into t_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			psmt = conn.prepareStatement(sql);
			
			// 4. 바인드 변수 채우기
			psmt.setString(1,m_id);
			psmt.setString(2,m_pw);
			psmt.setString(3,m_name);
			psmt.setString(4,m_jumin);
			psmt.setString(5,m_phone);
			psmt.setString(6,m_car_num);
			psmt.setInt(7,m_point);
			psmt.setString(8,m_type);
			psmt.setString(9,m_account);
			psmt.setString(10,m_joindate);
			psmt.setString(11,admin_yn);
			
			// 5. 
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			cnt  = psmt.executeUpdate();
		} catch (Exception e) {
		}finally {
			close();	
		}
		
		return cnt;
		
	}


	public MemberVO Login(String m_id, String m_pw) {
		try {
			Conn();
			String sql = "select * from t_member where m_id =? and m_pw = ?";
			psmt = conn.prepareStatement(sql);
			
			// 4. 바인드 변수 채우기
			psmt.setString(1, m_id);
			psmt.setString(2, m_pw);
			
			// 5. 
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			
			if(rs.next() == true) {
				String member_id = rs.getString(1);
				String member_pw = rs.getString(2);
				String m_name = rs.getString(3);
				String m_jumin= rs.getString(4);
				String m_phone= rs.getString(5);
				String m_car_num= rs.getString(6);
				int m_point= rs.getInt(7);
				String m_type= rs.getString(8);
				String m_account= rs.getString(9);
				String m_joindate= rs.getString(10);
				String admin_yn= rs.getString(11);
				
				
				mvo = new MemberVO(m_id, m_pw, m_name, m_jumin, m_phone, m_car_num, m_point, m_type, m_account, m_joindate, admin_yn);
			}
		} catch (Exception e) {
			
		}finally {
			close();	
		}
		return mvo;
	
	}


	public int RegBld(int bld_seq, String m_id, int bld_lati, int bld_longi, int bld_prk_lots, String bld_owner,
			String bld_owner_phone, String sigungu, String emdong, String detail_addr, String bld_reg_date,
			String bld_approve) {

		try {
			Conn();
			
			String sql = "insert into t_building values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1,bld_seq);
			psmt.setString(2,m_id);
			psmt.setInt(3,bld_lati);
			psmt.setInt(4,bld_longi);
			psmt.setInt(5,bld_prk_lots);
			psmt.setString(6,bld_owner);
			psmt.setString(7,bld_owner_phone);
			psmt.setString(8,sigungu);
			psmt.setString(9,emdong);
			psmt.setString(10,detail_addr);
			psmt.setString(11,bld_reg_date);
			psmt.setString(11,bld_reg_date);
			
			cnt  = psmt.executeUpdate();
			
		} catch (Exception e) {
		}finally {
			close();
		}
		return cnt;
	}

	

}	

