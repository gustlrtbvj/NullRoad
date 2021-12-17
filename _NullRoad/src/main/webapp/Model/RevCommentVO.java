package Model;

public class RevCommentVO {
	private int rev_ment_seq;
	private int rev_seq;
	private String rev_ment_content;
	private String rev_ment_reg_date;
	private String m_id;
	public RevCommentVO(int rev_ment_seq, int rev_seq, String rev_ment_content, String rev_ment_reg_date,
			String m_id) {
		super();
		this.rev_ment_seq = rev_ment_seq;
		this.rev_seq = rev_seq;
		this.rev_ment_content = rev_ment_content;
		this.rev_ment_reg_date = rev_ment_reg_date;
		this.m_id = m_id;
	}
	public int getRev_ment_seq() {
		return rev_ment_seq;
	}
	public void setRev_ment_seq(int rev_ment_seq) {
		this.rev_ment_seq = rev_ment_seq;
	}
	public int getRev_seq() {
		return rev_seq;
	}
	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}
	public String getRev_ment_content() {
		return rev_ment_content;
	}
	public void setRev_ment_content(String rev_ment_content) {
		this.rev_ment_content = rev_ment_content;
	}
	public String getRev_ment_reg_date() {
		return rev_ment_reg_date;
	}
	public void setRev_ment_reg_date(String rev_ment_reg_date) {
		this.rev_ment_reg_date = rev_ment_reg_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


}
