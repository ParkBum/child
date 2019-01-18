package dao.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Message;

public interface MessageMapper {

	@Insert("insert into message (msgnum, bnum, buynum, sellnum, phone, deal) values (#{msgnum}, #{bnum}, #{buynum}, #{sellnum}, #{phone}, 0)")
	void insert(Message msg);

	@Select("select ifnull(max(msgnum), 0) from message")
	int maxMsgnum();

	@Update("update message set deal = #{deal}, msgdate = #{msgdate} where msgnum = #{msgnum}")
	void updateDeal(Message msg);

	@Select("select ifnull(datediff(now(), #{msgdate}), 0)")
	int dayCnt(Date msgdate);

	@Select("select ifnull(max(deal), 0) from message where bnum = #{bnum} and deal < 3")
	int MaxDeal(Integer bnum);

}
