package Model;

public class ReviewVO {
	private int rev_seq;
	private String rev_subject;
	private String rev_content;
	private int res_seq;
	private String m_id;
	private String rev_reg_date;
	private int rev_cnt;
	private int rev_status;
	public ReviewVO(int rev_seq, String rev_subject, String rev_content, int res_seq, String m_id, String rev_reg_date,
			int rev_cnt, int rev_status) {
		super();
		this.rev_seq = rev_seq;
		this.rev_subject = rev_subject;
		this.rev_content = rev_content;
		this.res_seq = res_seq;
		this.m_id = m_id;
		this.rev_reg_date = rev_reg_date;
		this.rev_cnt = rev_cnt;
		this.rev_status = rev_status;
	}
	public ReviewVO(String rev_subject, String rev_content, String m_id) {
		super();

		this.rev_subject = rev_subject;
		this.rev_content = rev_content;
		this.m_id = m_id;

	}
	public int getRev_seq() {
		return rev_seq;
	}
	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}
	public String getRev_subject() {
		return rev_subject;
	}
	public void setRev_subject(String rev_subject) {
		this.rev_subject = rev_subject;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRev_reg_date() {
		return rev_reg_date;
	}
	public void setRev_reg_date(String rev_reg_date) {
		this.rev_reg_date = rev_reg_date;
	}
	public int getRev_cnt() {
		return rev_cnt;
	}
	public void setRev_cnt(int rev_cnt) {
		this.rev_cnt = rev_cnt;
	}
	public int getRev_status() {
		return rev_status;
	}
	public void setRev_status(int rev_status) {
		this.rev_status = rev_status;
	}
	
}
