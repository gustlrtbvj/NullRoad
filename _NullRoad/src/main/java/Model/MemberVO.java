package Model;

public class MemberVO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_jumin;
	private String m_phone;
	private String m_car_num;
	private int m_point;
	private int m_type; 
	private String m_account;
	private String m_joindate;
	private int admin_yn;
	public MemberVO(String m_id, String m_pw, String m_name, String m_jumin, String m_phone, String m_car_num,
			int m_point, int m_type, String m_account, String m_joindate, int admin_yn) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_jumin = m_jumin;
		this.m_phone = m_phone;
		this.m_car_num = m_car_num;
		this.m_point = m_point;
		this.m_type = m_type;
		this.m_account = m_account;
		this.m_joindate = m_joindate;
		this.admin_yn = admin_yn;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_jumin() {
		return m_jumin;
	}
	public void setM_jumin(String m_jumin) {
		this.m_jumin = m_jumin;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_car_num() {
		return m_car_num;
	}
	public void setM_car_num(String m_car_num) {
		this.m_car_num = m_car_num;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public int getM_type() {
		return m_type;
	}
	public void setM_type(int m_type) {
		this.m_type = m_type;
	}
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public String getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}
	public int getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}

	
	
}
	
