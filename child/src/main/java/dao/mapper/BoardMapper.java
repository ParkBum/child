package dao.mapper;

import org.apache.ibatis.annotations.Select;

public interface BoardMapper {

	@Select("select * from board where bnum = #{bnum}")
	void select(Integer bnum);

}
