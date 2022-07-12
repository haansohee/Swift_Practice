package emember;

public class EMemberDTO {
	private int num;
	private String name;
	private String userid;
	private String pwd;
	private String email;
	
	private String classnum;
	private String reg_date;
	private int admin;
	
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getName() {
		return name == null ? "" : name.trim(); // return name;
		
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid == null ? "" : userid.trim(); // return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd == null ? "" : pwd.trim();  // return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email == null ? "" : email.trim(); // return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getClassnum() {
		return classnum == null ? "" : classnum.trim(); // return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public String getReg_date() {
		return reg_date == null ? "" : reg_date.trim(); // return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	
}
