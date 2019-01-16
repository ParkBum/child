package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.Message;

public interface MessageMapper {

	@Insert("insert into message (msgnum, bnum, buynum, sellnum, phone, deal) values (#{msgnum}, #{bnum}, #{buynum}, #{sellnum}, #{phone}, #{deal})")
	void insert(Message msg);

}
