package Model;

public class ChartFeeVO {
	
	private String emdong;
	private int user_prk_fee;
	private String chk_out_time;
	public ChartFeeVO(String emdong, int user_prk_fee, String chk_out_time) {
		this.emdong = emdong;
		this.user_prk_fee = user_prk_fee;
		this.chk_out_time = chk_out_time;
	}
	public String getEmdong() {
		return emdong;
	}
	public void setEmdong(String emdong) {
		this.emdong = emdong;
	}
	public int getUser_prk_fee() {
		return user_prk_fee;
	}
	public void setUser_prk_fee(int user_prk_fee) {
		this.user_prk_fee = user_prk_fee;
	}
	public String getChk_out_time() {
		return chk_out_time;
	}
	public void setChk_out_time(String chk_out_time) {
		this.chk_out_time = chk_out_time;
	}

}
