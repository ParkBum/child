package dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "dao.mapper.UserMapper.";
	
	
	public void createuser(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}
	

}
