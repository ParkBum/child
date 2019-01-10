package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	@Insert("insert into user (mnum,email,password,nickname,id,addr1,addr2,addr3,red)"
			+ " values(#{mnum},#{email},#{password},#{nickname},#{id},#{addr1},#{addr2},#{addr3},#{red})")
	void insert(User user);

	@Select("select ifnull(max(mnum),0) from user")
	int maxNum();

	@Select("select nickname from user where mnum = #{mnum}")
	String nickName(int mnum);

	@Select("select * from user where mnum = #{mnum}")
	User infoSelect(Integer mnum);

	@Update("update user set addr1=#{addr1}, addr2=#{addr2}, addr3=#{addr3}, password=#{password} where mnum = #{mnum}")
	void userUpdate(User user);

	@Delete("Delete from user where mnum = #{mnum}")
	void userDelete(Integer mnum);

	@Insert("update user set red = ifnull(red, 0) + 1 where mnum = #{mnum}")
	void addRed(Integer mnum);

	@Update("update user set password1=#{password1} where mnum = #{mnum}")
	void changePass(User user);

}
