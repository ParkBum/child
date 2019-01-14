package logic;

public class Daycare {

	private String gu;		//구 		ex)강남구
	private String name;	//어린이집 이름
	private int    score;	//평점
	private int	   code;	//고유 번호
	private String type;	//유형 (국공립, 가정... 등등)
	private String nows;	//운영 현황
	private String postno;	//우편번호
	private String addr;	//주소 
	private String tel;		//전화번호
	private String fax;		//팩스번호
	private int classcnt;	//학생수
	private int square;		//면적
	private int playcnt;	//놀이터수
	private int teachercnt;	//교사 수
	private int maxchild;	//정원
	private int nowchild;	//현재 어린이 인원, 현원
	private String lat;		//위도
	private String lon;		//경도
	private String bus;		//버스 운행 여부
	private String homepage;// 홈페이지 주소
	private double child_per_teacher;//어린이집 교사 1명당 담당 영아 수
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
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
	public String getBus() {
		return bus;
	}
	public void setBus(String bus) {
		this.bus = bus;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public double getChild_per_teacher() {
		return child_per_teacher;
	}
	public void setChild_per_teacher(double child_per_teacher) {
		this.child_per_teacher = child_per_teacher;
	}
	@Override
	public String toString() {
		return "Daycare [gu=" + gu + ", name=" + name + ", score=" + score + ", code=" + code
				+ ", type=" + type + ", nows=" + nows + ", postno=" + postno + ", addr=" + addr + ", tel=" + tel
				+ ", fax=" + fax + ", classcnt=" + classcnt + ", square=" + square + ", playcnt=" + playcnt
				+ ", teachercnt=" + teachercnt + ", maxchild=" + maxchild + ", nowchild=" + nowchild + ", lat=" + lat
				+ ", lon=" + lon + ", bus=" + bus + ", homepage=" + homepage + "]";
	}

	
}
