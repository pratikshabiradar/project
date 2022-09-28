package model;

public class Teacher {
    private int teacher_pk;
    private String tname;
    private String tdob;
    private String tgender;
    private String temail;
    private String taddress;
	private String tcontact;
    private String teacherid;
    
    public int getTeacher_pk() {
		return teacher_pk;
	}
	public void setTeacher_pk(int teacher_pk) {
		this.teacher_pk = teacher_pk;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTdob() {
		return tdob;
	}
	public void setTdob(String tdob) {
		this.tdob = tdob;
	}
	public String getTgender() {
		return tgender;
	}
	public void setTgender(String tgender) {
		this.tgender = tgender;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public String getTaddress() {
		return taddress;
	}
	public void setTaddress(String taddress) {
		this.taddress = taddress;
	}
	public String getTcontact() {
		return tcontact;
	}
	public void setTcontact(String tcontact) {
		this.tcontact = tcontact;
	}
	public String getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}
    
    
}
