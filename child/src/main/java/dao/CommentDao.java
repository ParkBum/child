package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
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
	
}
