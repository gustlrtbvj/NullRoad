package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	// 전역변수
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	BuildingVO bldvo = null;
	CommunityRepVO crvo = null;
	CommunityVO cvo = null;
	CSReplyVO csvo = null;
	CustomerCenterVO cscvo = null;
	FilesVO fvo = null;
	MemberVO mvo = null;
	ParkingVO pvo = null;
	ReservationVO resvo = null;
	RevCommentVO revcvo = null;
	ReviewVO revvo = null;

	// ===============================================================================
	public void Conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {

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
			psmt.setString(1, m_id);
			psmt.setString(2, m_pw);
			psmt.setString(3, m_name);
			psmt.setString(4, m_jumin);
			psmt.setString(5, m_phone);
			psmt.setString(6, m_car_num);
			psmt.setInt(7, m_point);
			psmt.setString(8, m_type);
			psmt.setString(9, m_account);
			psmt.setString(10, m_joindate);
			psmt.setString(11, admin_yn);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
		} finally {
			close();
		}

		return cnt;

	}
	// ===============================================================================

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

			if (rs.next() == true) {
				String member_id = rs.getString(1);
				String member_pw = rs.getString(2);
				String m_name = rs.getString(3);
				String m_jumin = rs.getString(4);
				String m_phone = rs.getString(5);
				String m_car_num = rs.getString(6);
				int m_point = rs.getInt(7);
				String m_type = rs.getString(8);
				String m_account = rs.getString(9);
				String m_joindate = rs.getString(10);
				String admin_yn = rs.getString(11);

				mvo = new MemberVO(m_id, m_pw, m_name, m_jumin, m_phone, m_car_num, m_point, m_type, m_account,
						m_joindate, admin_yn);
			}
		} catch (Exception e) {

		} finally {
			close();
		}
		return mvo;

	}

	// ===============================================================================
	public int BldRegCon(int bld_seq, String m_id, double bld_lati, double bld_longi, int bld_prk_lots, String bld_owner,
			String bld_owner_phone, String sigungu, String emdong, String detail_addr, String bld_reg_date,
			String bld_approve, String bld_name, String bld_picture1, String bld_picture2) {

		try {
			Conn();
			String sql = "insert into  values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, bld_seq);
			psmt.setString(2, m_id);
			psmt.setDouble(3, bld_lati);
			psmt.setDouble(4, bld_longi);
			psmt.setInt(5, bld_prk_lots);
			psmt.setString(6, bld_owner);
			psmt.setString(7, bld_owner_phone);
			psmt.setString(8, sigungu);
			psmt.setString(9, emdong);
			psmt.setString(10, detail_addr);
			psmt.setString(11, bld_reg_date);
			psmt.setString(12, bld_approve);
			psmt.setString(13, bld_name);
			psmt.setString(14, bld_picture1);
			psmt.setString(15, bld_picture2);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

//===============================================================================
	public int PrkRegCon(int prk_seq, String prk_time, String prk_day, int prk_fee, String prk_status,
			String prk_memo, int bld_seq) {
		try {
			Conn();
			String sql = "insert into t_parking values(?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, prk_seq);
			psmt.setString(2, prk_time);
			psmt.setString(3, prk_day);
			psmt.setInt(4, prk_fee);
			psmt.setString(5, prk_status);
			psmt.setString(6, prk_memo);
			psmt.setInt(7, bld_seq);

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	}

	// ===============================================================================

	public int ResCon(int res_seq, int prk_seq, String res_time, String chk_in_time, String chk_out_time,
			int res_status, String res_reg_date, int user_prk_fee, String m_id) {

		try {
			Conn();
			String sql = "insert into t_reservation values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, res_seq);
			psmt.setInt(2, prk_seq);
			psmt.setString(3, res_time);
			psmt.setString(4, chk_in_time);
			psmt.setString(5, chk_out_time);
			psmt.setInt(6, res_status);
			psmt.setString(7, res_reg_date);
			psmt.setInt(8, user_prk_fee);
			psmt.setString(9, m_id);

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;

	}

	// ===============================================================================

	public int ReviewCon(int rev_seq, String rev_subject, String rev_content, int res_seq, String m_id,
			String rev_reg_date, int rev_cnt) {
		try {
			Conn();
			String sql = "insert into t_review values(?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, rev_seq);
			psmt.setString(2, rev_subject);
			psmt.setString(3, rev_content);
			psmt.setInt(4, res_seq);
			psmt.setString(5, m_id);
			psmt.setString(6, rev_reg_date);
			psmt.setInt(7, rev_cnt);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	public int RevMentCon(int rev_ment_seq, int rev_seq, String rev_ment_content, String rev_ment_reg_date,
			String m_id) {
		try {
			Conn();
			String sql = "insert into t_rev_comment values(?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, rev_seq);
			psmt.setInt(2, rev_seq);
			psmt.setString(3, rev_ment_content);
			psmt.setString(4, rev_ment_reg_date);
			psmt.setString(5, m_id);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	public int CommunityCon(int comm_seq, String comm_subject, String comm_content, String comm_reg_date, int comm_cnt,
			String m_id) {
		try {
			Conn();
			String sql = "insert into t_parking values(?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_seq);
			psmt.setString(2, comm_subject);
			psmt.setString(3, comm_content);
			psmt.setString(4, comm_reg_date);
			psmt.setInt(5, comm_cnt);
			psmt.setString(6, m_id);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;

	}

	public int CommRepCon(int comm_rep_seq, int comm_seq, String comm_rep_content, String comm_rep_reg_date,
			String m_id) {

		try {
			Conn();
			String sql = "insert into t_community_reply values(?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_rep_seq);
			psmt.setInt(2, comm_seq);
			psmt.setString(3, comm_rep_content);
			psmt.setString(4, comm_rep_reg_date);
			psmt.setString(5, m_id);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	public int CustomerCenterCon(int cs_art_seq, String cs_art_subject, String cs_art_content, String cs_art_reg_date,
			int cs_art_cnt, String m_id) {
		try {
			Conn();
			String sql = "insert into t_customer_center values(?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cs_art_seq);
			psmt.setString(2, cs_art_subject);
			psmt.setString(3, cs_art_content);
			psmt.setString(4, cs_art_reg_date);
			psmt.setInt(5, cs_art_cnt);
			psmt.setString(6, m_id);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;

	}

	public int CsReplyCon(int cs_rep, int cs_art_seq, String cs_rep_comment, String cs_rep_reg_date, String m_id) {
		try {
			Conn();
			String sql = "insert into t_customer_reply values(?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cs_rep);
			psmt.setInt(2, cs_art_seq);
			psmt.setString(3, cs_rep_comment);
			psmt.setString(4, cs_rep_reg_date);
			psmt.setString(5, m_id);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;

	}

	public int RefundCon(int refd_seq, String m_id, int refd_point, int refd_exqt) {
		try {
			Conn();
			String sql = "insert into  values(?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, refd_seq);
			psmt.setString(2, m_id);
			psmt.setInt(3, refd_point);
			psmt.setInt(4, refd_exqt);

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	// ===============================================================================

	public ArrayList<BuildingVO> BldSel(){
		
		ArrayList<BuildingVO> bldlist = new ArrayList<BuildingVO>();

		try {
			Conn();
			String sql = "select * from t_building";
			psmt = conn.prepareStatement(sql);


			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				int bld_seq = rs.getInt(1);
				String m_id = rs.getString(2);
				double bld_lati = rs.getDouble(3);
				double bld_longi = rs.getDouble(4);
				int bld_prk_lots = rs.getInt(5);
				String bld_owner = rs.getString(6);
				String bld_owner_phone= rs.getString(7);
				String sigungu = rs.getString(8);
				String emdong = rs.getString(9);
				String detail_addr = rs.getString(10);
				String bld_reg_date = rs.getString(11);
				String bld_approve = rs.getString(12);
				String bld_name = rs.getString(13);
				String bld_picture1 = rs.getString(14);
				String bld_picture2 = rs.getString(15);

				BuildingVO bldvo = new BuildingVO();
				
				bldlist.add(bldvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}finally {
			//6. 연결을 닫아주기
			try {
				if(rs != null) {
					rs.close();
				}
				if(psmt != null) {
					psmt.close();
				}
				if(conn !=null ) {
					conn.close();
				}
			} catch (Exception e2) {
			
			}
		
		}
		return bldlist;
	}
	
	
	
	
}
