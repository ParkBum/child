package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.User;

public interface UserMapper {
	@Insert("insert into user (email,password,nickname,"
			+ "phoneno) values(#{email},#{password},#{nickname},#{phoneNo}")
	void insert(User user);



}
