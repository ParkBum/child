package dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "dao.mapper.UserMapper.";
	
	
	public void createuser(User user) {
		sqlsession.getMapper(UserMapper.class).insert(user);
	}
	
	public int maxNum() {
		int i = sqlsession.getMapper(UserMapper.class).maxNum();
		return i;
	}

	public String nickName(int mnum) {
		return sqlsession.getMapper(UserMapper.class).nickName(mnum);	
	}
	

}
