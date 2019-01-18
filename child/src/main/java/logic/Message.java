package logic;

import java.util.Date;

public class Message {
	private int msgnum; // 쪽지 번호
	private int bnum; // 구매게시글 번호
	private int buynum; // 구매자 회원번호
	private int sellnum; // 판매자 회원번호
	private String phone; // 휴대폰 번호
	private int deal; // 거래상태 (0:대기중 1:거래중 2:거래완료 3:구매요청거절)
	private Date msgdate; // 요청 수락 날짜
	private Board board; // 구매 게시글 정보
	private User User; // 구매 요청 회원 정보

	public int getMsgnum() {
		return msgnum;
	}

	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

	public int getSellnum() {
		return sellnum;
	}

	public void setSellnum(int sellnum) {
		this.sellnum = sellnum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDeal() {
		return deal;
	}

	public void setDeal(int deal) {
		this.deal = deal;
	}

	public Date getMsgdate() {
		return msgdate;
	}

	public void setMsgdate(Date msgdate) {
		this.msgdate = msgdate;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User user) {
		User = user;
	}
	
}
