package Model;

public class CSReplyVO {
	private int cs_rep;
	private int cs_art_seq;
	private String cs_rep_comment;
	private String cs_reg_date;
	private String m_id;
	public CSReplyVO(int cs_rep, int cs_art_seq, String cs_rep_comment, String cs_reg_date, String m_id) {
		super();
		this.cs_rep = cs_rep;
		this.cs_art_seq = cs_art_seq;
		this.cs_rep_comment = cs_rep_comment;
		this.cs_reg_date = cs_reg_date;
		this.m_id = m_id;
	}
	public int getCs_rep() {
		return cs_rep;
	}
	public void setCs_rep(int cs_rep) {
		this.cs_rep = cs_rep;
	}
	public int getCs_art_seq() {
		return cs_art_seq;
	}
	public void setCs_art_seq(int cs_art_seq) {
		this.cs_art_seq = cs_art_seq;
	}
	public String getCs_rep_comment() {
		return cs_rep_comment;
	}
	public void setCs_rep_comment(String cs_rep_comment) {
		this.cs_rep_comment = cs_rep_comment;
	}
	public String getCs_reg_date() {
		return cs_reg_date;
	}
	public void setCs_reg_date(String cs_reg_date) {
		this.cs_reg_date = cs_reg_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


}
