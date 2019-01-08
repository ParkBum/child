package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CommentMapper;
import logic.Comment;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String NS = "dao.mapper.CommentMapper.";

	public void commentWrite(Comment comment) {
		sqlSession.getMapper(CommentMapper.class).insert(comment);
	}

	public List<Comment> commentSelect(Integer bnum) {
		return sqlSession.getMapper(CommentMapper.class).selectComment(bnum);
	}

	public int maxCnum() {
		return sqlSession.getMapper(CommentMapper.class).maxBnum();
	}

	public void delete(Integer cnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("cnum", cnum);
		sqlSession.getMapper(CommentMapper.class).delete(cnum);
	}

	public void update(Integer cnum) {
		sqlSession.getMapper(CommentMapper.class).update(cnum);
	}
	
}











