package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DAO {

	// 전역변수
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	BuildingVO bldvo = null;
	CommunityRepVO crvo = null;
	CommunityVO cvo = null;
	CustomerCenterVO csvo = null;
	CustomerCenterVO cscvo = null;
	FilesVO fvo = null;
	MemberVO mvo = null;
	ParkingVO pvo = null;
	ReservationVO resvo = null;
	RevCommentVO revcvo = null;
	ReviewVO revvo = null;
	ArrayList<ChartFeeVO> chvo = new ArrayList<ChartFeeVO>();
	ParkableVO prkablevo = null;

	// ===============================================================================
	public void Conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@172.30.1.20:1521:xe";
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
			String m_account) {
		// 메소드의 매개변수는 name에서 가져오는 값
		try {
			Conn();
			// 쿼리문은 sql로 넣어줘야하는 모든값
			String sql = "insert into t_member values(?, ?, ?, ?, ?, ?, 0, 0, ?, sysdate, 0)";
			psmt = conn.prepareStatement(sql);

			// 4. 바인드 변수 채우기
			psmt.setString(1, m_id);
			psmt.setString(2, m_pw);
			psmt.setString(3, m_name);
			psmt.setString(4, m_jumin);
			psmt.setString(5, m_phone);
			psmt.setString(6, m_car_num);
			psmt.setString(7, m_account);

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
				int m_type = rs.getInt(8);
				String m_account = rs.getString(9);
				String m_joindate = rs.getString(10);
				int admin_yn = rs.getInt(11);

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
	public int BldRegCon(String m_id, int bld_prk_lots, String bld_owner, String bld_owner_phone, String sigungu,
			String emdong, String detail_addr, String bld_name, String bld_picture1, String bld_picture2) {
		System.out.println(m_id + bld_prk_lots+ bld_owner+ bld_owner_phone+ sigungu+emdong+ detail_addr+bld_name+ bld_picture1+ bld_picture2);
		try {
			Conn();
			String sql = "INSERT INTO t_building (m_id, bld_prk_lots, bld_owner, bld_owner_phone, sigungu, emdong, detail_addr, bld_reg_date, bld_name, bld_picture1, bld_picture2) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?,?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, m_id);
			psmt.setInt(2, bld_prk_lots);
			psmt.setString(3, bld_owner);
			psmt.setString(4, bld_owner_phone);
			psmt.setString(5, sigungu);
			psmt.setString(6, emdong);
			psmt.setString(7, detail_addr);
			psmt.setString(8, bld_name);
			psmt.setString(9, bld_picture1);
			psmt.setString(10, bld_picture2);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

//===============================================================================
	public int PrkRegCon(String prk_time, String prk_day, int prk_fee, int prk_status, String prk_memo, int bld_seq) {
		try {
			Conn();
			String sql = "INSERT INTO t_parking (prk_time, prk_day, prk_fee, prk_status, prk_memo, bld_seq) VALUES (?, ?, 1000, 0, ?, ?);";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, prk_time);
			psmt.setString(2, prk_day);
			psmt.setInt(3, prk_fee);
			psmt.setInt(4, prk_status);
			psmt.setString(5, prk_memo);
			psmt.setInt(6, bld_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	}

	// ===============================================================================

	public int ResCon(int prk_seq, String chk_in_time, String chk_out_time, int res_status, String res_reg_date,
			int user_prk_fee, String m_id) {

		try {
			Conn();
			String sql = "INSERT INTO t_reservation (prk_seq, chk_in_time, chk_out_time, res_status, res_reg_date, user_prk_fee, m_id) VALUES (?, sysdate, sysdate, 0, sysdate, ?, ?);";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, prk_seq);
			psmt.setString(2, chk_in_time);
			psmt.setString(3, chk_out_time);
			psmt.setInt(4, res_status);
			psmt.setString(5, res_reg_date);
			psmt.setInt(6, user_prk_fee);
			psmt.setString(7, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;

	}

	// ===============================================================================

	public int ReviewCon(int rev_seq, String rev_subject, String rev_content, int res_seq, String m_id,
			String rev_reg_date, int rev_cnt, int rev_status) {
		try {
			Conn();
			String sql = "insert into t_review values(t_review_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, rev_seq);
			psmt.setString(2, rev_subject);
			psmt.setString(3, rev_content);
			psmt.setInt(4, res_seq);
			psmt.setString(5, m_id);
			psmt.setString(6, rev_reg_date);
			psmt.setInt(7, rev_cnt);
			psmt.setInt(8, rev_status);

			cnt = psmt.executeUpdate();

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
			String sql = "insert into t_rev_comment values(t_rev_comment_seq.nextval, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, rev_seq);
			psmt.setInt(2, rev_seq);
			psmt.setString(3, rev_ment_content);
			psmt.setString(4, rev_ment_reg_date);
			psmt.setString(5, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	public int CommunityCon(int comm_seq, String comm_subject, String comm_content, String comm_reg_date, int comm_cnt,
			String m_id, int comm_status) {
		try {
			Conn();
			String sql = "insert into t_community values(t_community_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_seq);
			psmt.setString(2, comm_subject);
			psmt.setString(3, comm_content);
			psmt.setString(4, comm_reg_date);
			psmt.setInt(5, comm_cnt);
			psmt.setString(6, m_id);
			psmt.setInt(7, comm_status);

			cnt = psmt.executeUpdate();

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
			String sql = "insert into t_community_reply values(t_community_reply_seq.nextval, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_rep_seq);
			psmt.setInt(2, comm_seq);
			psmt.setString(3, comm_rep_content);
			psmt.setString(4, comm_rep_reg_date);
			psmt.setString(5, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	public int CustomerCenterCon(int cs_art_seq, String cs_art_subject, String cs_art_content, String cs_art_reg_date,
			int cs_art_cnt, String m_id, int cs_art_status) {
		try {
			Conn();
			String sql = "insert into t_customer_center values(t_customer_center_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cs_art_seq);
			psmt.setString(2, cs_art_subject);
			psmt.setString(3, cs_art_content);
			psmt.setString(4, cs_art_reg_date);
			psmt.setInt(5, cs_art_cnt);
			psmt.setString(6, m_id);
			psmt.setInt(7, cs_art_status);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;

	}

	public int CsReplyCon(int cs_rep, int cs_art_seq, String cs_rep_comment, String cs_rep_reg_date, String m_id) {
		try {
			Conn();
			String sql = "insert into t_customer_reply values(t_cs_reply_seq.nextval, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cs_rep);
			psmt.setInt(2, cs_art_seq);
			psmt.setString(3, cs_rep_comment);
			psmt.setString(4, cs_rep_reg_date);
			psmt.setString(5, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;

	}

	public int RefundCon(int refd_seq, String m_id, int refd_point, int refd_exqt) {
		try {
			Conn();
			String sql = "insert into  values(t_refund_seq.nextval, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, refd_seq);
			psmt.setString(2, m_id);
			psmt.setInt(3, refd_point);
			psmt.setInt(4, refd_exqt);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}

	// ===============================================================================

	public ArrayList<BuildingVO> BldSel() {

		ArrayList<BuildingVO> bldlist = new ArrayList<BuildingVO>();

		try {
			Conn();
			String sql = "select * from t_building";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int bld_seq = rs.getInt(1);
				String m_id = rs.getString(2);
				double bld_lati = rs.getDouble(3);
				double bld_longi = rs.getDouble(4);
				int bld_prk_lots = rs.getInt(5);
				String bld_owner = rs.getString(6);
				String bld_owner_phone = rs.getString(7);
				String sigungu = rs.getString(8);
				String emdong = rs.getString(9);
				String detail_addr = rs.getString(10);
				String bld_reg_date = rs.getString(11);
				int bld_approve = rs.getInt(12);
				String bld_name = rs.getString(13);
				String bld_picture1 = rs.getString(14);
				String bld_picture2 = rs.getString(15);

				BuildingVO bldvo = new BuildingVO();

				bldlist.add(bldvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return bldlist;
	}

	public ArrayList<BuildingVO> BldSelOne(int bld_num) {

		ArrayList<BuildingVO> bldlist = new ArrayList<BuildingVO>();

		try {
			Conn();
			String sql = "select * from t_building where bld_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bld_num);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int bld_seq = rs.getInt(1);
				String m_id = rs.getString(2);
				double bld_lati = rs.getDouble(3);
				double bld_longi = rs.getDouble(4);
				int bld_prk_lots = rs.getInt(5);
				String bld_owner = rs.getString(6);
				String bld_owner_phone = rs.getString(7);
				String sigungu = rs.getString(8);
				String emdong = rs.getString(9);
				String detail_addr = rs.getString(10);
				String bld_reg_date = rs.getString(11);
				int bld_approve = rs.getInt(12);
				String bld_name = rs.getString(13);
				String bld_picture1 = rs.getString(14);
				String bld_picture2 = rs.getString(15);

				BuildingVO bldvo = new BuildingVO(bld_seq, m_id, bld_lati, bld_longi, bld_prk_lots, bld_owner,
						bld_owner_phone, sigungu, emdong, detail_addr, bld_reg_date, bld_approve, bld_name,
						bld_picture1, bld_picture2);

				bldlist.add(bldvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return bldlist;
	}

	public ArrayList<CommunityVO> CommSel() {

		System.out.println("arr");
		ArrayList<CommunityVO> Commlist = new ArrayList<CommunityVO>();

		try {
			System.out.println("여긴 살았냐?");
			Conn();
			String sql = "select * from t_community order by comm_seq";
			psmt = conn.prepareStatement(sql);
			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)

			rs = psmt.executeQuery();
			System.out.println("나는 rs입니다." + rs);
			while (rs.next() == true) {

				int comm_seq = rs.getInt(1);
				String comm_subject = rs.getString(2);
				String comm_content = rs.getString(3);
				String comm_reg_date = rs.getString(4);
				int comm_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int comm_status = rs.getInt(7);
				System.out.println("rs");
				CommunityVO cvo = new CommunityVO(comm_seq, comm_subject, comm_subject, comm_reg_date, comm_cnt, m_id,
						comm_status);
				System.out.println(cvo);
				Commlist.add(cvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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

		return Commlist;
	}

	public ArrayList<BuildingVO> BldHidOn() {

		ArrayList<BuildingVO> bldlist = new ArrayList<BuildingVO>();

		try {
			Conn();
			String sql = "select * from t_building where bld_seq in (select distinct bld_seq from t_parking where prk_status = 0) and bld_approve = 1";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int bld_seq = rs.getInt(1);
				String m_id = rs.getString(2);
				double bld_lati = rs.getDouble(3);
				double bld_longi = rs.getDouble(4);
				int bld_prk_lots = rs.getInt(5);
				String bld_owner = rs.getString(6);
				String bld_owner_phone = rs.getString(7);
				String sigungu = rs.getString(8);
				String emdong = rs.getString(9);
				String detail_addr = rs.getString(10);
				String bld_reg_date = rs.getString(11);
				int bld_approve = rs.getInt(12);
				String bld_name = rs.getString(13);
				String bld_picture1 = rs.getString(14);
				String bld_picture2 = rs.getString(15);

				BuildingVO bldvo = new BuildingVO(bld_seq, m_id, bld_lati, bld_longi, bld_prk_lots, bld_owner,
						bld_owner_phone, sigungu, emdong, detail_addr, bld_reg_date, bld_approve, bld_name,
						bld_picture1, bld_picture2);

				bldlist.add(bldvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return bldlist;
	}

	public ArrayList<ParkingVO> PrkSel() {

		ArrayList<ParkingVO> prklist = new ArrayList<ParkingVO>();

		try {
			Conn();
			String sql = "select * from t_parking";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int prk_seq = rs.getInt(1);
				String prk_time = rs.getString(2);
				String prk_day = rs.getString(3);
				int prk_fee = rs.getInt(4);
				int prk_status = rs.getInt(5);
				String prk_memo = rs.getString(6);
				int bld_seq = rs.getInt(7);

				ParkingVO prkvo = new ParkingVO(prk_seq, prk_time, prk_day, prk_fee, prk_status, prk_memo, bld_seq);

				prklist.add(prkvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return prklist;
	}

	public ArrayList<ReservationVO> ResSel() {

		ArrayList<ReservationVO> reslist = new ArrayList<ReservationVO>();

		try {
			Conn();
			String sql = "select * from t_reservation";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int res_seq = rs.getInt(1);
				int prk_seq = rs.getInt(2);
				String chk_in_time = rs.getString(3);
				String chk_out_time = rs.getString(4);
				int res_status = rs.getInt(5);
				String res_reg_date = rs.getString(6);
				int user_prk_fee = rs.getInt(7);
				String m_id = rs.getString(8);

				ReservationVO resvo = new ReservationVO(res_seq, prk_seq, chk_in_time, chk_out_time, res_status,
						res_reg_date, user_prk_fee, m_id);

				reslist.add(resvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return reslist;
	}

	public int ResPrkUpdate(int prk_status, int prk_seq) {

		try {

			Conn();

			String sql = "update t_parking set prk_status = 0 where prk_seq=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prk_status);
			psmt.setInt(2, prk_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// 6. 연결의 닫아주기
			try {
				if (psmt != null) {
					psmt.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}

	public int BldRegUpdCon(String m_id, int bld_seq, int bld_prk_lots, String bld_owner, String bld_owner_phone,
			String sigungu, String emdong, String detail_addr, String bld_name, String bld_picture1,
			String bld_picture2) {

		try {
			Conn();
			String sql = "UPDATE t_building set bld_prk_lots ='?', bld_owner ='?', bld_owner_phone ='?',sigungu ='?', emdong='?', "
					+ "detail_addr='?', bld_reg_date='?', bld_name='?', bld_picture1='?', bld_picture2='?' where bld_seq=? and m_id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, bld_prk_lots);
			psmt.setString(2, bld_owner);
			psmt.setString(3, bld_owner_phone);
			psmt.setString(4, sigungu);
			psmt.setString(5, emdong);
			psmt.setString(6, detail_addr);
			psmt.setString(7, bld_name);
			psmt.setString(8, bld_picture1);
			psmt.setString(9, bld_picture2);
			psmt.setInt(10, bld_seq);
			psmt.setString(11, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			close();
		}

		return cnt;
	}

	// ===============================================================================

	public ReservationVO IdResSelect(String m_id) {
		try {
			Conn();
			String sql = "select * from t_reservation where m_id = ? and res_status = 0 ";
			psmt = conn.prepareStatement(sql);
			// 4. 바인드 변수 채우기
			psmt.setString(1, m_id);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				int res_seq = rs.getInt(1);
				int prk_seq = rs.getInt(2);
				String chk_in_time = rs.getString(3);
				String chk_out_time = rs.getString(4);
				int res_status = rs.getInt(5);
				String res_reg_date = rs.getString(6);
				int user_prk_fee = rs.getInt(7);
				String member_id = rs.getString(8);

				resvo = new ReservationVO(res_seq, prk_seq, chk_in_time, chk_out_time, res_status, res_reg_date,
						user_prk_fee, member_id);
			}
		} catch (Exception e) {

		} finally {
			close();
		}
		return resvo;

	}

	// ===============================================================================
	public ParkingVO ParkSelect(String lot) {
		try {
			Conn();
			String sql = "select * from t_parking where prk_seq = ? ";
			psmt = conn.prepareStatement(sql);
			// 4. 바인드 변수 채우기
			psmt.setString(1, lot);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				int prk_seq = rs.getInt(1);
				String prk_time = rs.getString(2);
				String prk_day = rs.getString(3);
				int prk_fee = rs.getInt(4);
				int prk_status = rs.getInt(5);
				String prk_memo = rs.getString(6);
				int bld_seq = rs.getInt(7);

				pvo = new ParkingVO(prk_seq, prk_time, prk_day, prk_fee, prk_status, prk_memo, bld_seq);
			}
		} catch (Exception e) {

		} finally {
			close();
		}
		return pvo;

	}

	// ===============================================================================

	public int PayResCon(int prk_seq, int user_prk_fee, String m_id) {

		try {
			Conn();
			String sql1 = "INSERT INTO t_reservation (prk_seq, chk_in_time, chk_out_time, res_status, res_reg_date, user_prk_fee, m_id) VALUES (?, sysdate, sysdate, 0, sysdate, ?, ?)";
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, prk_seq);
			psmt.setInt(2, user_prk_fee);
			psmt.setString(3, m_id);
			int insert = psmt.executeUpdate();
			if (insert > 0) {
				System.out.println("영수증 생성 성공");

				String sql2 = "UPDATE t_parking set prk_status = 1 where prk_seq = ? ";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, prk_seq);
				cnt = psmt.executeUpdate();
				if (cnt > 0) {
					System.out.println("주차장 사용완료");
				} else {
					System.out.println("주차장 사용실패");
				}

			} else {
				System.out.println("영수증 생성 실패");

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;

	}

	// ===============================================================================

	public int PaySetGold(String m_id, int money) {

		try {
			Conn();

			String sql0 = "select m_point from t_member where m_id = ? ";
			psmt = conn.prepareStatement(sql0);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				int m_point = rs.getInt(1);
				System.out.println("기본금액 : " + m_point);

				String sql1 = "UPDATE t_member set m_point = ? where m_id = ? ";
				psmt = conn.prepareStatement(sql1);
				int con = m_point + money;
				psmt.setInt(1, con);
				psmt.setString(2, m_id);
				cnt = psmt.executeUpdate();
				if (cnt > 0) {
					System.out.println("변화금액 : " + con);
				}
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;

	}

	// ===============================================================================

	public int PayResSet(int res_seq, int prk_seq, int money) {

		try {
			Conn();
			String sql1 = "UPDATE t_parking set prk_status = 0 where prk_seq = ? ";
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, prk_seq);
			cnt = psmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("주차장 결제완료");
				String sql2 = "UPDATE t_reservation set res_status = 1 , chk_out_time = sysdate , user_prk_fee = ? where res_seq = ?";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, money);
				psmt.setInt(2, res_seq);
				cnt = psmt.executeUpdate();
				if (cnt > 0) {
					System.out.println("영수증 결제완료");
				} else {
					System.out.println("영수증 결제실패");
				}
			} else {
				System.out.println("주차장 결제실패");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;

	}
	// ===============================================================================

	public String PayReserSelect(int bld_seq, String m_id) {
		String str = null;
		try {
			Conn();
			String sql1 = "select prk_seq, prk_fee from T_PARKING where bld_seq = ? and prk_status = 0";
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, bld_seq);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				System.out.println("주차장 찾기 완료");
				int prk_seq = rs.getInt(1);
				int prk_fee = rs.getInt(2);

				String sql2 = "INSERT INTO t_reservation (prk_seq, chk_in_time, chk_out_time, res_status, res_reg_date, user_prk_fee, m_id) VALUES (?, sysdate, sysdate, 2, sysdate, ?, ?)";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, prk_seq);
				psmt.setInt(2, prk_fee);
				psmt.setString(3, m_id);
				int insert = psmt.executeUpdate();
				if (insert > 0) {
					System.out.println("예약 영수증 생성 성공");
					String sql3 = "UPDATE t_parking set prk_status = 2 where prk_seq = ? ";
					psmt = conn.prepareStatement(sql3);
					psmt.setInt(1, prk_seq);
					cnt = psmt.executeUpdate();
					if (cnt > 0) {
						System.out.println("주차장 예약완료");
						str = String.valueOf(prk_seq);
					} else {
						System.out.println("주차장 예약실패");
					}

				} else {
					System.out.println("예약 영수증 생성 실패");

				}
			}else {
				System.out.println("주차장에 빈자리가 없습니다.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		return str;

	}
	// ===============================================================================

	public int PayReserCheck() {

		try {
			Conn();
			int check = 0;
			String sql1 = "select prk_seq from T_PARKING where prk_status = 2";
			psmt = conn.prepareStatement(sql1);
			rs = psmt.executeQuery();
			while (rs.next() == true) {
				int prk_seq = rs.getInt(1);
				System.out.println("예약된 주차장 찾기 완료 : " + prk_seq);
				String sql2 = "select res_seq, chk_in_time from T_RESERVATION where res_status = 2 and prk_seq = ? ";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, prk_seq);
				ResultSet rss = psmt.executeQuery();
				if (rss.next() == true) {
					check += 1;
					int res_seq = rss.getInt(1);
					String chk_in_time = rss.getString(2);
					String Systime = Sysdate();
					SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
					Date Start = format.parse(chk_in_time);
					Date End = format.parse(Systime);
					int UseTime = (int)(End.getTime() - Start.getTime()) / 60000;
					System.out.println("예약 영수증 찾기 성공 : " + UseTime + " 분");
					close();
					Conn();
					if (UseTime >= 30) {
						String sql3 = "UPDATE t_parking set prk_status = 0 where prk_seq = ?";
						psmt = conn.prepareStatement(sql3);
						psmt.setInt(1, prk_seq);
						cnt = psmt.executeUpdate();
						String sql4 = "UPDATE T_RESERVATION set res_status = 3 , chk_out_time = sysdate where res_seq = ? ";
						psmt = conn.prepareStatement(sql4);
						psmt.setInt(1, res_seq);
						cnt = psmt.executeUpdate();
						System.out.println("예약취소 : "+res_seq);
					}
				}
			}
			System.out.println("예약된 주차장 수 :" + check);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return cnt;

	}

	// ===============================================================================

	public String Sysdate() {
		String time = null;
		try {
			Conn();
			String sql = "select sysdate from SYS.dual";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				time = rs.getString(1);
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		return time;

	}

	public String Sysdate_C() {
		String time = null;
		try {
			Conn();
			String sql = "select to_char(sysdate,'yyyy-mm-dd') from SYS.dual";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				time = rs.getString(1);
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		return time;

	}

	public ArrayList<ChartFeeVO> chartData() {

		try {
			Conn();

			String sql = "select b.emdong , sum(s.user_prk_fee),AVG(s.user_prk_fee),count(s.user_prk_fee),TO_CHAR(s.chk_out_time, 'YY-MM-DD')from(select r.prk_seq, r.user_prk_fee, r.chk_out_time , p.bld_seq from t_reservation r , t_parking p  where r.prk_seq = p.prk_seq and r.user_prk_fee > 0) s, t_building b  where s.bld_seq = b.bld_seq group by b.emdong, TO_CHAR(s.chk_out_time, 'YY-MM-DD') "
					+ "order by TO_CHAR(s.chk_out_time, 'YY-MM-DD') " + "desc";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			System.out.println(rs.next());

			while (rs.next()) {
				String emdong = rs.getString(1);
				int n1 = rs.getInt(2);
				int n2 = rs.getInt(3);
				int n3 = rs.getInt(4);
				String n4 = rs.getString(5);

				ChartFeeVO vo = new ChartFeeVO(emdong, n1, n2, n3, n4);
				chvo.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return chvo;
	}

	public ParkingVO PrkFeeSelect(int bld_num) {
		try {
			Conn();
			String sql = "select prk_fee from t_parking where bld_seq=?";
			psmt = conn.prepareStatement(sql);
			// 4. 바인드 변수 채우기
			psmt.setInt(1, bld_num);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				int prk_seq = rs.getInt(1);
				String prk_time = rs.getString(2);
				String prk_day = rs.getString(3);
				int prk_fee = rs.getInt(4);
				int prk_status = rs.getInt(5);
				String prk_memo = rs.getString(6);
				int bld_seq = rs.getInt(7);

				pvo = new ParkingVO(prk_seq, prk_time, prk_day, prk_fee, prk_status, prk_memo, bld_seq);
			}
		} catch (Exception e) {

		} finally {
			close();
		}
		return pvo;

	}

	public ArrayList<ParkableVO> Prkable() {
		ArrayList<ParkableVO> prkableList = new ArrayList<ParkableVO>();
		try {
			Conn();
			String sql = "select b.bld_seq ,count(*) from t_building b , t_parking p where b.bld_seq = p.bld_seq and p.prk_status = 0 group by b.bld_seq";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int bld_seq = rs.getInt(1);
				int bld_prkable = rs.getInt(2);
				ParkableVO prkablevo = new ParkableVO(bld_seq, bld_prkable);
				prkableList.add(prkablevo);

			}
			System.out.println("주차장가능수 성공");
		} catch (Exception e) {
			System.out.println("오류생김");
		} finally {
			close();
		}
		return prkableList;

	}

	public int RefundEexquteUpdate(int refd_exqt, int refd_seq) {
		try {
			Conn();

			String sql = "update t_refund set refd_exqt=? where refd_seq =?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, refd_exqt);
			psmt.setInt(2, refd_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<RefundVO> RefundSel() {

		ArrayList<RefundVO> refundlist = new ArrayList<RefundVO>();

		try {
			Conn();
			String sql = "select * from t_refund order by refd_seq";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int refd_seq = rs.getInt(1);
				String m_id = rs.getString(2);
				int refd_point = rs.getInt(3);
				int refd_exqt = rs.getInt(4);

				RefundVO rfdvo = new RefundVO(refd_seq, m_id, refd_point, refd_exqt);

				refundlist.add(rfdvo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return refundlist;
	}

	public int CsCenterUpAdmin(int cs_art_status, int cs_art_seq) {
		try {
			Conn();

			String sql = "update t_refund set cs_art_status=? where cs_art_seq =?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cs_art_status);
			psmt.setInt(2, cs_art_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<CustomerCenterVO> CsCenterSel() {

		ArrayList<CustomerCenterVO> cscenterlist = new ArrayList<CustomerCenterVO>();

		try {
			Conn();
			String sql = "select * from t_customer_center order by cs_art_seq";
			psmt = conn.prepareStatement(sql);

			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int cs_art_seq = rs.getInt(1);
				String cs_art_subject = rs.getString(2);
				String cs_art_content = rs.getString(3);
				String cs_art_reg_date = rs.getString(4);
				int cs_art_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int cs_art_art_status = rs.getInt(7);

				CustomerCenterVO cscentervo = new CustomerCenterVO(cs_art_seq, cs_art_subject, cs_art_content,
						cs_art_reg_date, cs_art_cnt, m_id, cs_art_art_status);

				cscenterlist.add(cscentervo);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 6. 연결을 닫아주기
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
		return cscenterlist;
	}

	public int CorUpd(String m_pw, String m_phone, String m_car_number, String m_account, String m_id) {
		try {
			Conn();

			String sql = "update t_member set m_pw=?, m_phone=? , m_car_num=?, m_account=? where m_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_pw);
			psmt.setString(2, m_phone);
			psmt.setString(3, m_car_number);
			psmt.setString(4, m_account);
			psmt.setString(5, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	
		

	}
	public int MyUseCount(String m_id) {
		try {
			Conn();
			String sql = "SELECT count(*) FROM t_reservation where m_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}  finally {
			close();
		}
		return cnt;
	}
	
	public int MyLotCount(String m_id) {
		try {
			Conn();
			String sql = "select sum(bld_prk_lots) from t_building where m_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			if (rs.next() == true) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}  finally {
			close();
		}
		return cnt;
	}
	
	public int MycashCount(String m_id) {
		try {
			Conn();
			String sql = "select SUM(s.user_prk_fee)from(select r.prk_seq, r.user_prk_fee, r.chk_out_time , p.bld_seq from t_reservation r , t_parking p where r.prk_seq = p.prk_seq ) s, t_building b where s.bld_seq = b.bld_seq and b.bld_owner = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}  finally {
			close();
		}
		return cnt;
	}


	public int One(String cs_art_subject, String cs_art_content, String m_id) {
		try {
			Conn();

			String sql = "INSERT INTO t_customer_center (cs_art_subject, cs_art_content, cs_art_reg_date, cs_art_cnt, m_id, cs_art_status) VALUES (?, ?, sysdate, 0, ?, 0)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cs_art_subject);
			psmt.setString(2, cs_art_content);
			psmt.setString(3, m_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
		} finally {
			close();
		}
		return cnt;
	}

	public CustomerCenterVO CsSelectOne(int cs_art_seq) {
		try {
			// JDBC
			// 1. 동적로딩
			System.out.println("conn확인" + cs_art_seq);
			Conn();
			// 3. sql문 준비
			String sql = "select * from t_customer_center where cs_art_seq =?";
			psmt = conn.prepareStatement(sql);

			// 4. 바인드 변수 채우기(물음표 없다. -> 바인드변수 노필요)
			psmt.setInt(1, cs_art_seq);

			// 5. 실행
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			System.out.println(rs);
			System.out.print("DAO" + cs_art_seq);
			// 로그인 때는, rs에 딱 1행만
			// 모든 회원정보를 가져옴 > 몇번 반복해야할지 모름
			if (rs.next() == true) {

				// 글번호, 작성자, 제목, 파일이름, 내용, 날짜
				int cs_art_seqq = rs.getInt(1);
				String cs_art_subject = rs.getString(2);
				String cs_art_content = rs.getString(3);
				String cs_art_reg_date = rs.getString(4);
				int cs_art_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int cs_art_status = rs.getInt(7);	



				// 한보따리로 묶는다.
				csvo = new CustomerCenterVO(cs_art_seqq, cs_art_subject, cs_art_content, cs_art_reg_date, cs_art_cnt, m_id, cs_art_status);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 6. 연결을 닫아주기
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

		return csvo;
	}
}