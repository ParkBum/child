package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Daycare;

@Repository
public class MapDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String NS = "dao.mapper.MapMapper.";


	public List<String> gusort() {
		List<String> a =  sqlSession.selectList(NS+"gulist");
		return a;
	}


	public List<Integer> cntsort() {
		return sqlSession.selectList(NS+"list");
	}

/*
	public List<String> getpoints(String gu, String type, String bus, String word) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("gu", gu);
		map.put("type", type);
		map.put("bus", bus);
		map.put("word", word);
		return sqlSession.selectList(NS+"getpoints",map);
	}*/



	public List<Daycare> daycareList(String gu, String type, String bus/*, String word*/) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("gu", gu);
		map.put("type", type);
		map.put("bus", bus);
		return sqlSession.selectList(NS+"list",map);
	}
	
	
}
