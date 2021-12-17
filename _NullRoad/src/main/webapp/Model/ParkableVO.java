package Model;

public class ParkableVO {

	private int bld_seq;
	private int bld_prkable;
	public int getBld_seq() {
		return bld_seq;
	}
	public void setBld_seq(int bld_seq) {
		this.bld_seq = bld_seq;
	}
	public int getBld_prkable() {
		return bld_prkable;
	}
	public void setBld_prkable(int bld_prkable) {
		this.bld_prkable = bld_prkable;
	}
	public ParkableVO(int bld_seq, int bld_prkable) {
		super();
		this.bld_seq = bld_seq;
		this.bld_prkable = bld_prkable;
	}
}
