package logic;

public class Message {
	private int msgnum; // 쪽지 번호
	private int bnum; // 구매게시글 번호
	private int buynum; // 구매자 회원번호
	private int sellnum; // 판매자 회원번호
	private String phone; // 휴대폰 번호
	private int deal; // 거래상태(0:판매중  1:구매요청  2:판매완료)

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

}
