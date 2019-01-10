package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String NS = "dao.mapper.BoardMapper.";

	public int getCount(Integer bType, String filterType, String searchType, String searchContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bType", bType);
		map.put("filterType", filterType);
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		Integer ret = sqlSession.selectOne(NS + "count", map);
		return ret;
	}

	public List<Board> getList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("bType", bType);
		map.put("filterType", filterType);
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit);
		return sqlSession.selectList(NS + "list", map);
	}

	public Board getBoard(Integer bnum) {
		return sqlSession.getMapper(BoardMapper.class).select(bnum);
	}

	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}

	public int maxBnum() {
		return sqlSession.getMapper(BoardMapper.class).maxBnum();
	}

	public void boardDelete(Integer bnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("bnum", bnum);
		sqlSession.getMapper(BoardMapper.class).boardDelete(bnum);
	}

	public void readcntAdd(Integer bnum) {
		sqlSession.getMapper(BoardMapper.class).readcntAdd(bnum);
	}

/*	public void boardUpdate(Board board) {
		sqlSession.getMapper(BoardMapper.class).boardUpdate(board);
	}*/
}




