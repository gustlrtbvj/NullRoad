package Model;

public class ChartFeeVO {
	
	private String emdong;
	private int t_fee;
	private int t_avg;
	private int t_cnt;
	public String getEmdong() {
		return emdong;
	}
	public void setEmdong(String emdong) {
		this.emdong = emdong;
	}
	public int getT_fee() {
		return t_fee;
	}
	public void setT_fee(int t_fee) {
		this.t_fee = t_fee;
	}
	public int getT_avg() {
		return t_avg;
	}
	public void setT_avg(int t_avg) {
		this.t_avg = t_avg;
	}
	public int getT_cnt() {
		return t_cnt;
	}
	public void setT_cnt(int t_cnt) {
		this.t_cnt = t_cnt;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	private String t_date;
	public ChartFeeVO(String emdong, int t_fee, int t_avg, int t_cnt, String t_date) {
		super();
		this.emdong = emdong;
		this.t_fee = t_fee;
		this.t_avg = t_avg;
		this.t_cnt = t_cnt;
		this.t_date = t_date;
	}
}
