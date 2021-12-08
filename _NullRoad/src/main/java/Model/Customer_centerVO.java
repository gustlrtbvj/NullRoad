package Model;

public class Customer_centerVO {

	private int cs_art_seq;
	private String cs_art_subj;
	private String cs_art_content;
	private String cs_art_reg_date;
	private int cs_art_cnt;
	private String m_id;

	public Customer_centerVO(int cs_art_seq, String cs_art_subj, String cs_art_content, String cs_art_reg_date,
			int cs_art_cnt, String m_id) {

		this.cs_art_seq = cs_art_seq;
		this.cs_art_subj = cs_art_subj;
		this.cs_art_content = cs_art_content;
		this.cs_art_reg_date = cs_art_reg_date;
		this.cs_art_cnt = cs_art_cnt;
		this.m_id = m_id;
	}

	public int getCs_art_seq() {
		return cs_art_seq;
	}
	public void setCs_art_seq(int cs_art_seq) {
		this.cs_art_seq = cs_art_seq;
	}
	public String getCs_art_subj() {
		return cs_art_subj;
	}
	public void setCs_art_subj(String cs_art_subj) {
		this.cs_art_subj = cs_art_subj;
	}
	public String getCs_art_content() {
		return cs_art_content;
	}
	public void setCs_art_content(String cs_art_content) {
		this.cs_art_content = cs_art_content;
	}
	public String getCs_art_reg_date() {
		return cs_art_reg_date;
	}
	public void setCs_art_reg_date(String cs_art_reg_date) {
		this.cs_art_reg_date = cs_art_reg_date;
	}
	public int getCs_art_cnt() {
		return cs_art_cnt;
	}
	public void setCs_art_cnt(int cs_art_cnt) {
		this.cs_art_cnt = cs_art_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	
}
