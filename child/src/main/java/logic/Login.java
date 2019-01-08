package logic;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Login {
	@NotEmpty(message="email을 입력해 주세요")
	@Email(message="이메일 형식이 아닙니다.")
	private String login_email;
	@Size(min=4, message="패스워드는 4자 이상이어야 합니다.")
	private String login_password;
	public String getLogin_email() {
		return login_email;
	}
	public void setLogin_email(String login_email) {
		this.login_email = login_email;
	}
	public String getLogin_password() {
		return login_password;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	@Override
	public String toString() {
		return "Login [login_email=" + login_email + ", login_password=" + login_password + "]";
	}
	
}
