package Model;

public class CommunityVO {
	private int comm_seq;
	private String comm_subj;
	private String comm_content;
	private String comm_reg_date;
	private int comm_cnt;
	private String m_id;
	public CommunityVO(int comm_seq, String comm_subj, String comm_content, String reg_date, int comm_cnt, String m_id) {
		super();
		this.comm_seq = comm_seq;
		this.comm_subj = comm_subj;
		this.comm_content = comm_content;
		this.comm_reg_date = reg_date;
		this.comm_cnt = comm_cnt;
		this.m_id = m_id;
	}
	public int getcomm_seq() {
		return comm_seq;
	}
	public void setcomm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public String getcomm_subj() {
		return comm_subj;
	}
	public void setcomm_subj(String comm_subj) {
		this.comm_subj = comm_subj;
	}
	public String getcomm_content() {
		return comm_content;
	}
	public void setcomm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getcomm_reg_date() {
		return comm_reg_date;
	}
	public void setcomm_reg_date(String comm_reg_date) {
		this.comm_reg_date = comm_reg_date;
	}
	public int getcomm_cnt() {
		return comm_cnt;
	}
	public void setcomm_cnt(int comm_cnt) {
		this.comm_cnt = comm_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	
	
}
