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

	public int getCount(Integer bType, String filterType, String searchType, String searchContent, String filterType2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bType", bType);
		map.put("filterType", filterType);
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("filterType2",filterType2);
		Integer ret = sqlSession.selectOne(NS + "count", map);
		return ret;
	}

	public List<Board> getList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit, String filterType2) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("bType", bType);
		map.put("filterType", filterType);
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit);
		map.put("filterType2", filterType2);
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

	public void delete(Integer bnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("bnum", bnum);
		sqlSession.getMapper(BoardMapper.class).delete(bnum);
	}

	public void readcntAdd(Integer bnum) {
		sqlSession.getMapper(BoardMapper.class).readcntAdd(bnum);
	}

	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}

	public void userBoardDelete(Integer mnum) {
		sqlSession.getMapper(BoardMapper.class).userBoardDelete(mnum);
	}

	public List<Board> myBoardList(Integer mnum,Integer pageNum, int limit) {
		Map<String,Object> map = new HashMap<String,Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("mnum", mnum);
		map.put("pageNum", pageNum);
		map.put("limit", limit);
		map.put("startrow", startrow);
		return sqlSession.selectList(NS + "mylist", map);
	//	return sqlSession.getMapper(BoardMapper.class).myBoardList(mnum);
	}

	public void myBoardDelete(Integer[] checkBoard) {
		Map<String,Integer[]> map = new HashMap<String,Integer[]>();
		map.put("bnum", checkBoard);
		sqlSession.selectList(NS + "myboard" , map);
	}

	public int myBoardCnt(Integer mnum) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("mnum", mnum);
		return sqlSession.getMapper(BoardMapper.class).myBoardCnt(mnum);
	}
}




