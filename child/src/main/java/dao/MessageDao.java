package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<Message> messageList(Integer bnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bnum", bnum);
		return sqlSession.selectList(NS + "list", map);
	}

	public List<Message> getMymessageList(Integer mnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sellnum", mnum);
		return sqlSession.selectList(NS + "list", map);
	}

	public Message getMessage(Integer msgnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msgnum", msgnum);
		return sqlSession.selectOne(NS + "list", map);
	}

	public void updateDeal(Integer msgnum, Integer deal, Date date) {
		Message msg = new Message();
		msg.setMsgnum(msgnum);
		msg.setDeal(deal);
		msg.setMsgdate(date);
		sqlSession.getMapper(MessageMapper.class).updateDeal(msg);
	}

	public int dayCnt(Date msgdate) {
		return sqlSession.getMapper(MessageMapper.class).dayCnt(msgdate);
	}

	public int MaxDeal(Integer bnum) {
		return sqlSession.getMapper(MessageMapper.class).MaxDeal(bnum);
	}

	public void updateBuynum(Integer mnum) {
		sqlSession.getMapper(MessageMapper.class).updateBuynum(mnum);		
	}

	public void updateBnum(Integer bnum) {
		sqlSession.getMapper(MessageMapper.class).updateBnum(bnum);		
	}

	public void cancelDeal(Integer bnum) {
		sqlSession.getMapper(MessageMapper.class).cancelDeal(bnum);				
	}

}
