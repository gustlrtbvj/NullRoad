package Model;

public class ReservationVO {
	private int res_seq;
	private int prk_seq;
	private String res_time;
	private String chk_in_time;
	private String chk_out_time;
	private int res_status;
	private String res_reg_date;
	private int user_prk_fee;
	private String m_id;
	
	
	public ReservationVO(int res_seq, int prk_seq, String chk_in_time, String chk_out_time,
			int rev_status, String reg_date, int user_prk_fee, String m_id) {
		
		this.res_seq = res_seq;
		this.prk_seq = prk_seq;
		this.chk_in_time = chk_in_time;
		this.chk_out_time = chk_out_time;
		this.res_status = rev_status;
		this.res_reg_date = reg_date;
		this.user_prk_fee = user_prk_fee;
		this.m_id = m_id;
	}


	public int getRes_seq() {
		return res_seq;
	}


	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}


	public int getPrk_seq() {
		return prk_seq;
	}


	public void setPrk_seq(int prk_seq) {
		this.prk_seq = prk_seq;
	}


	public String getChk_in_time() {
		return chk_in_time;
	}


	public void setChk_in_time(String chk_in_time) {
		this.chk_in_time = chk_in_time;
	}


	public String getChk_out_time() {
		return chk_out_time;
	}


	public void setChk_out_time(String chk_out_time) {
		this.chk_out_time = chk_out_time;
	}


	public int getRev_status() {
		return res_status;
	}


	public void setRev_status(int rev_status) {
		this.res_status = rev_status;
	}


	public String getReg_date() {
		return res_reg_date;
	}


	public void setReg_date(String reg_date) {
		this.res_reg_date = reg_date;
	}


	public int getUser_prk_fee() {
		return user_prk_fee;
	}


	public void setUser_prk_fee(int user_prk_fee) {
		this.user_prk_fee = user_prk_fee;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	
}
