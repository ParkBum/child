package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.User;

public interface UserMapper {
	@Insert("insert into user (mnum,email,password,nickname)"
			+ " values(#{mnum},#{email},#{password},#{nickname})")
	void insert(User user);

	@Select("select ifnull(max(mnum),0) from user")
	int maxNum();


}
