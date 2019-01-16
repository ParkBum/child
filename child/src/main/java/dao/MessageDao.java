package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MessageMapper;
import logic.Message;

@Repository
public class MessageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String NS = "dao.mapper.MessageMapper.";

	public void insert(Message msg) {
		sqlSession.getMapper(MessageMapper.class).insert(msg);	
	}

	public int maxMsgnum() {
		return sqlSession.getMapper(MessageMapper.class).maxMsgnum();
	}

}
