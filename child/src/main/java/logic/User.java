package logic;


import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int mnum;
	@NotEmpty(message="email을 입력해 주세요")
	@Email(message="이메일 형식이 아닙니다.")
	private String email;
	@Size(min=3, message="닉네임은 3자 이상이어야 합니다.")
	private String nickname;
	@Size(min=4, message="패스워드는 4자 이상이어야 합니다.")
	private String password;
	private String password1;
	@NotEmpty(message="주소를 입력해주세요")
	private String addr1;
	private String addr2;
	@NotEmpty(message="상세주소를 입력해주세요")
	private String addr3;
	private String id;
	
	

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	
	

}
