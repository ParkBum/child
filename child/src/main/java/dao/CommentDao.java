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

	public List<Comment> commentSelect(Integer bnum, Integer pageNum, int limit) {
		Map<String,Object> map = new HashMap<String,Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("bnum", bnum);
		map.put("pageNum", pageNum);
		map.put("limit", limit);
		map.put("startrow", startrow);
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
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("cnum", cnum);
		return sqlSession.getMapper(CommentMapper.class).select(cnum);
	}

	public int chgRefstep(Comment com) {
		return sqlSession.getMapper(CommentMapper.class).chgRefstep(com);
	}

	public void userCommentDelete(Integer mnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("mnum", mnum);
		sqlSession.getMapper(CommentMapper.class).deleteComment(mnum);
	}

	public int commentCnt(int bnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("bnum", bnum);
		return sqlSession.getMapper(CommentMapper.class).commentCount(bnum);
	}

	public void myComDelete(Integer[] checkBoard) {
		Map<String,Integer[]> map = new HashMap<String,Integer[]>();
		map.put("bnum", checkBoard);
		sqlSession.selectList(NS + "mycomment", map);
	}

	

}











