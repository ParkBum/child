package logic;

import java.util.Date;

public class Daycare {
	private String sido;
	private String gu;
	private String name;
	private String type;
	private String nows;
	private String postno;
	private String addr;
	private String tel;
	private String fax;
	private int classcnt;
	private int square;
	private int playcnt;
	private int teachercnt;
	private int maxchild;
	private int nowchild;
	private String lat;
	private String lon;
	private String homepage;
	private Date permitdate;
	private String restartdate;
	private String restenddate;
	private String closedate;
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNows() {
		return nows;
	}
	public void setNows(String nows) {
		this.nows = nows;
	}
	public String getPostno() {
		return postno;
	}
	public void setPostno(String postno) {
		this.postno = postno;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public int getClasscnt() {
		return classcnt;
	}
	public void setClasscnt(int classcnt) {
		this.classcnt = classcnt;
	}
	public int getSquare() {
		return square;
	}
	public void setSquare(int square) {
		this.square = square;
	}
	public int getPlaycnt() {
		return playcnt;
	}
	public void setPlaycnt(int playcnt) {
		this.playcnt = playcnt;
	}
	public int getTeachercnt() {
		return teachercnt;
	}
	public void setTeachercnt(int teachercnt) {
		this.teachercnt = teachercnt;
	}
	public int getMaxchild() {
		return maxchild;
	}
	public void setMaxchild(int maxchild) {
		this.maxchild = maxchild;
	}
	public int getNowchild() {
		return nowchild;
	}
	public void setNowchild(int nowchild) {
		this.nowchild = nowchild;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public Date getPermitdate() {
		return permitdate;
	}
	public void setPermitdate(Date permitdate) {
		this.permitdate = permitdate;
	}
	public String getRestartdate() {
		return restartdate;
	}
	public void setRestartdate(String restartdate) {
		this.restartdate = restartdate;
	}
	public String getRestenddate() {
		return restenddate;
	}
	public void setRestenddate(String restenddate) {
		this.restenddate = restenddate;
	}
	public String getClosedate() {
		return closedate;
	}
	public void setClosedate(String closedate) {
		this.closedate = closedate;
	}
	@Override
	public String toString() {
		return "Daycare [sido=" + sido + ", gu=" + gu + ", name=" + name + ", type=" + type + ", nows=" + nows + ", postno="
				+ postno + ", addr=" + addr + ", tel=" + tel + ", fax=" + fax + ", classcnt=" + classcnt + ", square="
				+ square + ", playcnt=" + playcnt + ", teachercnt=" + teachercnt + ", maxchild=" + maxchild
				+ ", nowchild=" + nowchild + ", lat=" + lat + ", lon=" + lon + ", homepage=" + homepage
				+ ", permitdate=" + permitdate + ", restartdate=" + restartdate + ", restenddate=" + restenddate
				+ ", closedate=" + closedate + "]";
	}
}
