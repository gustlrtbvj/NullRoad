package Model;

public class FilesVO {
	private int f_seq;
	private int comm_seq;
	private int rev_ment_seq;
	private int cs_art_seq;
	private int rev_seq;
	private int comm_rep_seq;
	private int cs_rep;
	private int bld_seq;
	private String f_1;


	public FilesVO(int f_seq, int comm_seq, int rev_ment_seq, int cs_art_seq, int rev_seq, int comm_rep_seq, int cs_rep,
			int bld_seq, String f_1) {

		this.f_seq = f_seq;
		this.comm_seq = comm_seq;
		this.rev_ment_seq = rev_ment_seq;
		this.cs_art_seq = cs_art_seq;
		this.rev_seq = rev_seq;
		this.comm_rep_seq = comm_rep_seq;
		this.cs_rep = cs_rep;
		this.bld_seq = bld_seq;
		this.f_1 = f_1;

	}


	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getComm_seq() {
		return comm_seq;
	}

	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}

	public int getRev_ment_seq() {
		return rev_ment_seq;
	}

	public void setRev_ment_seq(int rev_ment_seq) {
		this.rev_ment_seq = rev_ment_seq;
	}

	public int getCs_art_seq() {
		return cs_art_seq;
	}

	public void setCs_art_seq(int cs_art_seq) {
		this.cs_art_seq = cs_art_seq;
	}

	public int getRev_seq() {
		return rev_seq;
	}

	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}

	public int getComm_rep_seq() {
		return comm_rep_seq;
	}

	public void setComm_rep_seq(int comm_rep_seq) {
		this.comm_rep_seq = comm_rep_seq;
	}

	public int getCs_rep() {
		return cs_rep;
	}

	public void setCs_rep(int cs_rep) {
		this.cs_rep = cs_rep;
	}

	public int getBld_seq() {
		return bld_seq;
	}

	public void setBld_seq(int bld_seq) {
		this.bld_seq = bld_seq;
	}

	public String getF_1() {
		return f_1;
	}

	public void setF_1(String f_1) {
		this.f_1 = f_1;
	}



	
}
