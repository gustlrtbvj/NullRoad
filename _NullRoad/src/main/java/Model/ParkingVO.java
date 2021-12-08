package Model;

public class ParkingVO {
	private int prk_seq;
	private int prk_area_num;
	private String prk_time;
	private String prk_day;
	private int prk_fee;
	private String prk_status;
	private String prk_memo;
	private int bld_seq;

	public ParkingVO(int prk_seq, int prk_area_num, String prk_time, String prk_day, int prk_fee, String prk_status,
			String prk_memo, int bld_seq) {
		this.prk_seq = prk_seq;
		this.prk_area_num = prk_area_num;
		this.prk_time = prk_time;
		this.prk_day = prk_day;
		this.prk_fee = prk_fee;
		this.prk_status = prk_status;
		this.prk_memo = prk_memo;
		this.bld_seq = bld_seq;
	}

	public int getPrk_seq() {
		return prk_seq;
	}

	public void setPrk_seq(int prk_seq) {
		this.prk_seq = prk_seq;
	}

	public int getPrk_area_num() {
		return prk_area_num;
	}

	public void setPrk_area_num(int prk_area_num) {
		this.prk_area_num = prk_area_num;
	}

	public String getPrk_time() {
		return prk_time;
	}

	public void setPrk_time(String prk_time) {
		this.prk_time = prk_time;
	}

	public String getPrk_day() {
		return prk_day;
	}

	public void setPrk_day(String prk_day) {
		this.prk_day = prk_day;
	}

	public int getPrk_fee() {
		return prk_fee;
	}

	public void setPrk_fee(int prk_fee) {
		this.prk_fee = prk_fee;
	}

	public String getPrk_status() {
		return prk_status;
	}

	public void setPrk_status(String prk_status) {
		this.prk_status = prk_status;
	}

	public String getPrk_memo() {
		return prk_memo;
	}

	public void setPrk_memo(String prk_memo) {
		this.prk_memo = prk_memo;
	}

	public int getBld_seq() {
		return bld_seq;
	}

	public void setBld_seq(int bld_seq) {
		this.bld_seq = bld_seq;
	}
	
	
}
