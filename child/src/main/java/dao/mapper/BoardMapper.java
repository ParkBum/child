package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {

	@Select("select * from board where bnum = #{bnum}")
	Board select(Integer bnum);

	@Insert("insert into board (bnum,mnum,btype,head,subject,content,regdate,readcnt,file1,file2,file3,red,score) "
			+ "values (#{bnum},#{mnum},#{bType},#{head},#{subject},#{content},now(),#{readcnt},#{file1},#{file2},#{file3},0,#{score})")
	void insert(Board board);

	@Select("select ifnull(max(bnum), 0) from board")
	int maxBnum();

	@Delete("delete from board where bnum = #{bnum}")
	void boardDelete(Integer bnum);

}
