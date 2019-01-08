package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Comment;

public interface CommentMapper {

	@Insert("insert into comment (cnum,bnum,mnum,recomment,comdate)" + 
			" values (#{cnum},#{bnum},#{mnum},#{recomment},now())")
	void insert(Comment comment);

	@Select("select * from comment where bnum = #{bnum}")
	List<Comment> selectComment(Integer bnum);

	@Select("select ifnull(max(cnum), 0) from comment")
	int maxBnum();

	@Delete("delete from comment where cnum = #{cnum}")
	void delete(Integer cnum);
	
}
