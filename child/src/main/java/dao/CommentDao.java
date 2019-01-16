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
//		return sqlSession.getMapper(CommentMapper.class).selectComment(bnum);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bnum", bnum);
		return sqlSession.selectList(NS + "list", map);
	}

	public int maxCnum() {
		return sqlSession.getMapper(CommentMapper.class).maxBnum();
	}

	public void delete(Integer cnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("cnum", cnum);
		sqlSession.getMapper(CommentMapper.class).delete(cnum);
	}
	
	public void deleteList(Integer bnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("bnum", bnum);
		sqlSession.getMapper(CommentMapper.class).deleteList(bnum);
	}

	public void update(Comment comment) {
		sqlSession.getMapper(CommentMapper.class).update(comment);
	}

	public Comment getSelect(int cnum) {
		return sqlSession.getMapper(CommentMapper.class).select(cnum);
	}

	public int chgRefstep(Comment com) {
		return sqlSession.getMapper(CommentMapper.class).chgRefstep(com);
	}

	public void userCommentDelete(Integer mnum) {
		sqlSession.getMapper(CommentMapper.class).deleteComment(mnum);
	}

	public int commentCnt(int bnum) {
		return sqlSession.getMapper(CommentMapper.class).commentCount(bnum);
	}

	public void myComDelete(Integer[] checkBoard) {
		Map<String,Integer[]> map = new HashMap<String,Integer[]>();
		map.put("bnum", checkBoard);
		sqlSession.selectList(NS + "mycomment", map);
	}

	

}











