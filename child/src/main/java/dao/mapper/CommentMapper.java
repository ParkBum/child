package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Comment;

public interface CommentMapper {

	@Insert("insert into comment (cnum,bnum,mnum,recomment,comdate,ref,refstep)" + 
			" values(#{cnum},#{bnum},#{mnum},#{recomment},now(),#{ref},#{refstep})")
	void insert(Comment comment);

/*	@Select("select * from comment where bnum = #{bnum} order by ref desc, refstep")
	List<Comment> selectComment(Integer bnum);
*/
	@Select("select ifnull(max(cnum), 0) from comment")
	int maxBnum();

	@Delete("delete from comment where cnum = #{cnum}")
	void delete(Integer cnum);

	@Update("update comment set recomment = #{recomment} where cnum=#{cnum}")
	void update(Comment comment);

	@Select("select * from comment where cnum=#{cnum}")
	Comment select(int cnum);

	@Update("update comment set refstep = refstep+1 where ref=#{ref} and refstep > 0")
	int chgRefstep(Comment com);
/*
	@Select("select count(*) from comment where bnum=#{bnum}")
	int cnumCnt(Comment com);
*/
}
