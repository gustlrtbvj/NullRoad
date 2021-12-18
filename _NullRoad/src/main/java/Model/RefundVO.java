package Model;

public class RefundVO {
	private int refd_seq;
	private String m_id;
	private int refd_point;
	private int refd_exqt;

	public RefundVO(int refd_seq, String m_id, int refd_point, int refd_exqt) {
		super();
		this.refd_seq = refd_seq;
		this.m_id = m_id;
		this.refd_point = refd_point;
		this.refd_exqt = refd_exqt;
	}

	public int getRefd_seq() {
		return refd_seq;
	}

	public void setRefd_seq(int refd_seq) {
		this.refd_seq = refd_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getRefd_point() {
		return refd_point;
	}

	public void setRefd_point(int refd_point) {
		this.refd_point = refd_point;
	}

	public int getRefd_exqt() {
		return refd_exqt;
	}

	public void setRefd_exqt(int refd_exqt) {
		this.refd_exqt = refd_exqt;
	}
	public RefundVO(String m_id, int refd_seq, int refd_exqt) {
		this.m_id = m_id;
		this.refd_seq = refd_seq;
		this.refd_exqt = refd_exqt;
	}
	
}
