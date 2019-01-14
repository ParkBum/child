package logic;

import java.util.Date;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int bnum; // 게시글번호
	private int mnum; // 작성자 회원번호
	private String nickname; // 닉네임
	private int bType; // 게시판 종류
	private int head; // 말머리
	@NotEmpty(message = "제목을 선택하세요")
	private String subject; // 제목
	@NotEmpty(message = "내용을 선택하세요")
	private String content; // 내용
	private Date regdate; // 작성 날짜
	private int readcnt; // 조회수
	private String file1; // 첨부파일 1 이름
	private String file2; // 첨부파일 2 이름
	private String file3; // 첨부파일 3 이름
	private MultipartFile multi1; // 첨부파일 원본1
	private MultipartFile multi2; // 첨부파일 원본2
	private MultipartFile multi3; // 첨부파일 원본3
	private int red; // 신고 수
	private double score;
	private int code;

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public int getHead() {
		return head;
	}

	public void setHead(int head) {
		this.head = head;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public MultipartFile getMulti1() {
		return multi1;
	}

	public void setMulti1(MultipartFile multi1) {
		this.multi1 = multi1;
	}

	public MultipartFile getMulti2() {
		return multi2;
	}

	public void setMulti2(MultipartFile multi2) {
		this.multi2 = multi2;
	}

	public MultipartFile getMulti3() {
		return multi3;
	}

	public void setMulti3(MultipartFile multi3) {
		this.multi3 = multi3;
	}

	public int getRed() {
		return red;
	}

	public void setRed(int red) {
		this.red = red;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
}