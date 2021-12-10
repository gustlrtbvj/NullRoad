package Model;

public class CommunityVO {
	private int comm_seq;
	private String comm_subj;
	private String comm_content;
	private String comm_reg_date;
	private int comm_cnt;
	private String m_id;
	private int comm_status;
	public CommunityVO(int comm_seq, String comm_subj, String comm_content, String comm_reg_date, int comm_cnt,
			String m_id, int comm_status) {
		super();
		this.comm_seq = comm_seq;
		this.comm_subj = comm_subj;
		this.comm_content = comm_content;
		this.comm_reg_date = comm_reg_date;
		this.comm_cnt = comm_cnt;
		this.m_id = m_id;
		this.comm_status = comm_status;
	}
	public int getComm_seq() {
		return comm_seq;
	}
	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public String getComm_subj() {
		return comm_subj;
	}
	public void setComm_subj(String comm_subj) {
		this.comm_subj = comm_subj;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getComm_reg_date() {
		return comm_reg_date;
	}
	public void setComm_reg_date(String comm_reg_date) {
		this.comm_reg_date = comm_reg_date;
	}
	public int getComm_cnt() {
		return comm_cnt;
	}
	public void setComm_cnt(int comm_cnt) {
		this.comm_cnt = comm_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getComm_status() {
		return comm_status;
	}
	public void setComm_status(int comm_status) {
		this.comm_status = comm_status;
	}

	
}
