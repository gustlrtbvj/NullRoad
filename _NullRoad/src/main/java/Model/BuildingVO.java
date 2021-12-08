package Model;

public class BuildingVO {
	private int bld_seq;
	private String m_id;
	private int bld_lati; 
	private int bld_longi;
	private int bld_p_lots;
	private String bld_owener;
	private String bld_owener_phone;
	private String sigungu;
	private String emdong;
	private String detail_addr;
	private String bld_reg_date;
	private String bld_approve;

	
	public BuildingVO(int bld_seq, String m_id, int bld_lati, int bld_longi, int bld_p_lots, String bld_owener,
			String bld_owener_phone, String sigungu, String emdong, String detail_addr, String reg_date,
			String bld_approve) {
		super();
		this.bld_seq = bld_seq;
		this.m_id = m_id;
		this.bld_lati = bld_lati;
		this.bld_longi = bld_longi;
		this.bld_p_lots = bld_p_lots;
		this.bld_owener = bld_owener;
		this.bld_owener_phone = bld_owener_phone;
		this.sigungu = sigungu;
		this.emdong = emdong;
		this.detail_addr = detail_addr;
		this.bld_reg_date = reg_date;
		this.bld_approve = bld_approve;
	}


	public int getBld_seq() {
		return bld_seq;
	}


	public void setBld_seq(int bld_seq) {
		this.bld_seq = bld_seq;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getBld_lati() {
		return bld_lati;
	}


	public void setBld_lati(int bld_lati) {
		this.bld_lati = bld_lati;
	}


	public int getBld_long() {
		return bld_longi;
	}


	public void setBld_long(int bld_long) {
		this.bld_longi = bld_long;
	}


	public int getBld_p_lots() {
		return bld_p_lots;
	}


	public void setBld_p_lots(int bld_p_lots) {
		this.bld_p_lots = bld_p_lots;
	}


	public String getBld_owener() {
		return bld_owener;
	}


	public void setBld_owener(String bld_owener) {
		this.bld_owener = bld_owener;
	}


	public String getBld_owener_phone() {
		return bld_owener_phone;
	}


	public void setBld_owener_phone(String bld_owener_phone) {
		this.bld_owener_phone = bld_owener_phone;
	}


	public String getSigungu() {
		return sigungu;
	}


	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}


	public String getEmdong() {
		return emdong;
	}


	public void setEmdong(String emdong) {
		this.emdong = emdong;
	}


	public String getDetail_addr() {
		return detail_addr;
	}


	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}


	public String getReg_date() {
		return bld_reg_date;
	}


	public void setReg_date(String reg_date) {
		this.bld_reg_date = reg_date;
	}


	public String getBld_approve() {
		return bld_approve;
	}


	public void setBld_approve(String bld_approve) {
		this.bld_approve = bld_approve;
	}
	
}
