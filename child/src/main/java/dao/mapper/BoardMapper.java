package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Select("select * from board where bnum = #{bnum}")
	Board select(Integer bnum);

	@Insert("insert into board (bnum,mnum,btype,head,subject,content,regdate,readcnt,file1,file2,file3,score) "
			+ "values (#{bnum},#{mnum},#{bType},#{head},#{subject},#{content},now(),#{readcnt},#{file1},#{file2},#{file3},#{score})")
	void insert(Board board);

	@Select("select ifnull(max(bnum), 0) from board")
	int maxBnum();

	@Delete("delete from board where bnum = #{bnum}")
	void boardDelete(Integer bnum);
/*
	@Update("Update board set subject=#{subject}, content=#{content}, score=#{score}"
				+ " multi1=#{file1}, multi2=#{file2}, multi3=#{file3} where bnum=#{bnum}")
	void boardUpdate(Board board);
*/

	@Update("update board set readcnt = readcnt + 1 where bnum = #{bnum}")
	void readcntAdd(Integer bnum);

}








