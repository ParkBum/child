package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
