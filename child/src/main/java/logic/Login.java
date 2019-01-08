package logic;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Login {
	@NotEmpty(message="email을 입력해 주세요")
	@Email(message="이메일 형식이 아닙니다.")
	private String email;
	@Size(min=4, message="패스워드는 4자 이상이어야 합니다.")
	private String password;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Login [email=" + email + ", password=" + password + "]";
	}
	

}
