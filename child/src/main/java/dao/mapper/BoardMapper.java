package dao.mapper;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {

	@Select("select * from board where bnum = #{bnum}")
	Board select(Integer bnum);

}
