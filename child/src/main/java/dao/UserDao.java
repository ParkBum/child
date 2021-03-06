package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	

	public User select(String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		return sqlsession.selectOne(NS + "list", map);
	}
	
	public User selectnick(String nickname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);
		return sqlsession.selectOne(NS + "list", map);
	}


	public List<User> userlist() {
		return sqlsession.selectList(NS + "list");
	}

	public User infoSelect(Integer mnum) {
		return sqlsession.getMapper(UserMapper.class).infoSelect(mnum);
	}

	public void userUpdate(User user) {
		sqlsession.getMapper(UserMapper.class).userUpdate(user);
	}


	public void userDelete(Integer mnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mnum", mnum);
		sqlsession.getMapper(UserMapper.class).userDelete(mnum);
	}

	public void addRed(Integer mnum) {
		sqlsession.getMapper(UserMapper.class).addRed(mnum);
	}

	public void changePass(String newpass1, Integer mnum) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("mnum", mnum);
		map.put("newpass1", newpass1);
		sqlsession.getMapper(UserMapper.class).changePass(map);
	}

}






















