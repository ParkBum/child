package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
