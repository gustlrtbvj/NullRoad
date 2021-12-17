package Model;

public class CommunityRepVO {

	private int comm_rep_seq;
	private int comm_seq;
	private String comm_rep_content;
	private String comm_rep_reg_date;
	private String m_id;

	public CommunityRepVO(int comm_rep_seq, int comm_seq, String comm_rep_content, String reg_date, String m_id) {
		super();
		this.comm_rep_seq = comm_rep_seq;
		this.comm_seq = comm_seq;
		this.comm_rep_content = comm_rep_content;
		this.comm_rep_reg_date = reg_date;
		this.m_id = m_id;
	}
	public int getComm_rep_seq() {
		return comm_rep_seq;
	}
	public void setComm_rep_seq(int comm_rep_seq) {
		this.comm_rep_seq = comm_rep_seq;
	}
	public int getArt_seq() {
		return comm_seq;
	}
	public void setArt_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public String getComm_rep_content() {
		return comm_rep_content;
	}
	public void setComm_rep_content(String comm_rep_content) {
		this.comm_rep_content = comm_rep_content;
	}
	public String getReg_date() {
		return comm_rep_reg_date;
	}
	public void setReg_date(String reg_date) {
		this.comm_rep_reg_date = reg_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	
	

}
