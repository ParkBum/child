package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Select("select * from board where bnum = #{bnum}")
	Board select(Integer bnum);

	@Insert("insert into board (bnum,mnum,code,btype,head,subject,content,regdate,readcnt,file1,file2,file3,score,dcname,mkinds) "
			+ "values (#{bnum},#{mnum},#{code},#{bType},#{head},#{subject},#{content},now(),#{readcnt},#{file1},#{file2},#{file3},#{score},#{dcname},#{mkinds})")
	void insert(Board board);

	@Select("select ifnull(max(bnum), 0) from board")
	int maxBnum();

	@Delete("delete from board where bnum = #{bnum}")
	void delete(Integer bnum);

	@Update("Update board set code=#{code}, head=#{head}, subject=#{subject}, content=#{content}, score=#{score},"
				+ " file1=#{file1}, file2=#{file2}, file3=#{file3}, dcname=#{dcname}, mkinds=#{mkinds} where bnum=#{bnum}")
	void update(Board board);


	@Update("update board set readcnt = readcnt + 1 where bnum = #{bnum}")
	void readcntAdd(Integer bnum);

	@Delete("delete from board where mnum=#{mnum}")
	void userBoardDelete(Integer mnum);

	@Select("select * from board where mnum=#{mnum}")
	List<Board> myBoardList(Integer mnum);

	@Select("select count(*) from board where mnum=#{mnum}")
	int myBoardCnt(Integer mnum);

}








