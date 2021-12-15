package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	// 전역변수
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	CommunityRepVO crvo = null;
	CommunityVO cvo = null;

	MemberVO mvo = null;


	RevCommentVO revcvo = null;

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
				int m_type = rs.getInt(8);
				String m_account = rs.getString(9);
				String m_joindate = rs.getString(10);
				int admin_yn = rs.getInt(11);

				mvo = new MemberVO(member_id, member_pw, m_name, m_jumin, m_phone, m_car_num, m_point, m_type, m_account,
						m_joindate, admin_yn);
			}
		} catch (Exception e) {

		} finally {
			close();
		}
		return mvo;

	}

	// ===============================================================================
	public int BldRegCon(int bld_seq, String m_id, double bld_lati, double bld_longi, int bld_prk_lots,
			String bld_owner, String bld_owner_phone, String sigungu, String emdong, String detail_addr,
			String bld_reg_date, int bld_approve, String bld_name, String bld_picture1, String bld_picture2) {

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
			psmt.setInt(12, bld_approve);
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
	public int PrkRegCon(int prk_seq, String prk_time, String prk_day, int prk_fee, int prk_status, String prk_memo,
			int bld_seq) {
		try {
			Conn();
			String sql = "insert into t_parking values(?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, prk_seq);
			psmt.setString(2, prk_time);
			psmt.setString(3, prk_day);
			psmt.setInt(4, prk_fee);
			psmt.setInt(5, prk_status);
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
			String rev_reg_date, int rev_cnt, int rev_status) {
		try {
			Conn();
			String sql = "insert into t_review values(?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, rev_seq);
			psmt.setString(2, rev_subject);
			psmt.setString(3, rev_content);
			psmt.setInt(4, res_seq);
			psmt.setString(5, m_id);
			psmt.setString(6, rev_reg_date);
			psmt.setInt(7, rev_cnt);
			psmt.setInt(8, rev_status);

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

	public int CommunityCon(String comm_subject, String comm_content, String m_id) {
		try {
			Conn();
			String sql = "INSERT INTO t_community (comm_subject, comm_content, comm_reg_date, comm_cnt, m_id, comm_status) VALUES (?, ?, sysdate, 0, ?, 0)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, comm_subject);
			psmt.setString(2, comm_content);
			psmt.setString(3, m_id);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			close();
		}
		return cnt;
	}
	
	

	public int CommRepCon(int comm_seq, String comm_rep_content) {

		try {
			System.out.println("돼?");
			Conn();
			String sql = "insert into t_community_reply (comm_seq, comm_rep_content, comm_rep_reg_date, m_id) VALUES (?, ?, sysdate, 'm_id 4')";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_seq);
			psmt.setString(2, comm_rep_content);
			
			cnt = psmt.executeUpdate();
			
			System.out.println(cnt);
			
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
			String sql = "insert into t_customer_center values(?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cs_art_seq);
			psmt.setString(2, cs_art_subject);
			psmt.setString(3, cs_art_content);
			psmt.setString(4, cs_art_reg_date);
			psmt.setInt(5, cs_art_cnt);
			psmt.setString(6, m_id);
			psmt.setInt(7, cs_art_status);

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

	
	public ArrayList<CommunityVO> CommSel() {

		ArrayList<CommunityVO> Commlist = new ArrayList<CommunityVO>();

		try {
			Conn();
			String sql = "select * from t_community where comm_status =0 order by comm_seq desc";
			psmt = conn.prepareStatement(sql);
			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			while (rs.next() == true) {
				int comm_seq = rs.getInt(1);
				String comm_subject = rs.getString(2);
				String comm_content = rs.getString(3);
				String comm_reg_date = rs.getString(4);
				int comm_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int comm_status = rs.getInt(7);

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
	
	public ArrayList<CommunityRepVO> CommRepSel(int comm_seq) {

		ArrayList<CommunityRepVO> CommReplist = new ArrayList<CommunityRepVO>();

		try {
			Conn();
			String sql = "select * from t_community_reply where comm_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comm_seq);
			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			while (rs.next() == true) {
				int comm_rep_seq = rs.getInt(1);
				int tcomm_seq = rs.getInt(2);
				String comm_rep_content = rs.getString(3);
				String comm_rep_reg_date = rs.getString(4);
				String m_id = rs.getString(5);

				CommunityRepVO cvo = new CommunityRepVO(comm_rep_seq, tcomm_seq, comm_rep_content, comm_rep_reg_date, m_id);
				System.out.println(cvo);
				CommReplist.add(cvo);
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

		return CommReplist;
	}

	public CommunityVO SelectOne(int comm_seq) {
		CommunityVO bvo = null;
		// try문
		// JDBC 코드는 문법이 맞더라도, 실행중에 발생하는 오류(런타임 오류) 처리 필요
		try {
			// JDBC
			// 1. 동적로딩
			System.out.println("conn확인" + comm_seq);
			Conn();
			// 3. sql문 준비
			String sql = "select * from t_community where comm_seq =?";
			psmt = conn.prepareStatement(sql);

			// 4. 바인드 변수 채우기(물음표 없다. -> 바인드변수 노필요)
			psmt.setInt(1, comm_seq);

			// 5. 실행
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			System.out.println(rs);
			System.out.print("DAO" + comm_seq);
			// 로그인 때는, rs에 딱 1행만
			// 모든 회원정보를 가져옴 > 몇번 반복해야할지 모름
			if (rs.next() == true) {

				// 글번호, 작성자, 제목, 파일이름, 내용, 날짜
				int bcomm_seq = rs.getInt(1);
				String comm_subj = rs.getString(2);
				String comm_content = rs.getString(3);
				String comm_reg_date = rs.getString(4);
				int comm_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int comm_status = rs.getInt(7);
				// 한보따리로 묶는다.
				bvo = new CommunityVO(bcomm_seq, comm_subj, comm_content, comm_reg_date, comm_cnt, m_id, comm_status);
				comm_cnt += 1;
				String sql2 = "update t_community set comm_cnt = comm_cnt +1  where comm_seq=?";
				psmt = conn.prepareStatement(sql2); 
				psmt.setInt(1, comm_seq);
				int tt = psmt.executeUpdate();
				System.out.println(tt);
				
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

		return bvo;
	}

	

	public CommunityVO SelectPre(int comm_seq) {
		CommunityVO bvo = null;
		// try문
		// JDBC 코드는 문법이 맞더라도, 실행중에 발생하는 오류(런타임 오류) 처리 필요
		try {
			// JDBC
			// 1. 동적로딩
			System.out.println("conn확인" + comm_seq);
			Conn();
			// 3. sql문 준비
			String sql = "select * from t_community where comm_seq =?";
			psmt = conn.prepareStatement(sql);

			// 4. 바인드 변수 채우기(물음표 없다. -> 바인드변수 노필요)
			psmt.setInt(1, comm_seq);

			// 5. 실행
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			System.out.println(rs);
			System.out.print("DAO" + comm_seq);
			// 로그인 때는, rs에 딱 1행만
			// 모든 회원정보를 가져옴 > 몇번 반복해야할지 모름
			if (rs.next() == true) {

				// 글번호, 작성자, 제목, 파일이름, 내용, 날짜
				int bcomm_seq = rs.getInt(1);
				String comm_subj = rs.getString(2);
				String comm_content = rs.getString(3);
				String comm_reg_date = rs.getString(4);
				int comm_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int comm_status = rs.getInt(7);

				// 한보따리로 묶는다.
				bvo = new CommunityVO(bcomm_seq, comm_subj, comm_content, comm_reg_date, comm_cnt, m_id, comm_status);

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

		return bvo;
	}	
	public int DeleteCommunityCon(int comm_seq) {
		try {
			Conn();
			String sql = "UPDATE t_community SET comm_status = 1 WHERE comm_seq=?";
					
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, comm_seq);

			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			close();
		}
		System.out.println(cnt);
		return cnt;
	}
	public int UpdateCommunityCon(int comm_seq, String comm_content) {
		try {
			Conn();
			String sql = "UPDATE t_community SET comm_content = ? WHERE comm_seq=?";
					
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, comm_content);
			psmt.setInt(2, comm_seq);

			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			close();
		}
		System.out.println(cnt);
		return cnt;
	}
	
	public ArrayList<CommunityVO> CommSelBest() {

		ArrayList<CommunityVO> Commlist = new ArrayList<CommunityVO>();

		try {
			Conn();
			String sql = "select * from t_community where comm_status =0 order by comm_cnt desc";
			psmt = conn.prepareStatement(sql);
			// 5.
			// select -> executeQuery() --> return ResultSet
			// insert, delete, update -> executeUpdate() --> return int(몇 행이 성공했는지)
			rs = psmt.executeQuery();
			while (rs.next() == true) {
				int comm_seq = rs.getInt(1);
				String comm_subject = rs.getString(2);
				String comm_content = rs.getString(3);
				String comm_reg_date = rs.getString(4);
				int comm_cnt = rs.getInt(5);
				String m_id = rs.getString(6);
				int comm_status = rs.getInt(7);

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
	
	
}
