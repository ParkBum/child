package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Board;
import logic.Daycare;

@Repository
public class MapDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String NS = "dao.mapper.MapMapper.";


	public List<Daycare> daycareList(String gu, String type, String bus) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("gu", gu);
		map.put("type", type);
		map.put("bus", bus);
		return sqlSession.selectList(NS+"list",map);
	}


	public Daycare selectOne(int code) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("code", code);
		return sqlSession.selectOne(NS+"one",map);
	}


	public List<String> gulist() {	
		return sqlSession.selectList(NS+"gulist");
	}


	public List<Daycare> listBygu(String gu) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("gu", gu);
		return sqlSession.selectList(NS+"listBygu",map);
	}


	public List<Daycare> dcclist() {
		return sqlSession.selectList(NS+"alllist");
	}


	public List<Board> fourlists(Integer code) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("code", code);
		return sqlSession.selectList(NS+"threelists",map);
	}

	
}
