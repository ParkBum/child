package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class Comment {
	private int cnum;
	private int bnum;
	private int mnum;
	@NotEmpty(message = "내용을 입력하세요")
	private String recomment;
	private Date comdate;
	private int ref;
	private int refstep;
	private String nickname;
	private int secret;

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRefstep() {
		return refstep;
	}

	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

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

	public String getRecomment() {
		return recomment;
	}

	public void setRecomment(String recomment) {
		this.recomment = recomment;
	}

	public Date getComdate() {
		return comdate;
	}

	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}

	@Override
	public String toString() {
		return "Comment [cnum=" + cnum + ", bnum=" + bnum + ", mnum=" + mnum + ", recomment=" + recomment + ", comdate="
				+ comdate + ", ref=" + ref + ", refstep=" + refstep + "]";
	}
	

}
