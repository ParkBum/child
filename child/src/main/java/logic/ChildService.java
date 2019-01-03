package logic;


import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dao.UserDao;

@Service
public class ChildService {

	@Autowired
	private UserDao userdao;
	@Autowired
	private BoardDao boarddao;

	public int boardCount(Integer bType, String filterType, String searchType, String searchContent) {
		return boarddao.getCount(bType, filterType, searchType, searchContent);
	}

	public List<Board> boardList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit) {
		List<Board> board = boarddao.getList(bType, filterType, searchType, searchContent, pageNum, limit);
		for(Board b : board) {
			b.setNickname(getNickName(b.getMnum()));
		}
		return board;
	}

	public Board getBoard(Integer bnum) {
		Board board = boarddao.getBoard(bnum);
		board.setNickname(getNickName(board.getMnum()));
		return board;
	}
	
	public String getNickName(int mnum) {
		return userdao.nickName(mnum);
	}

	public void userCreate(User user) {
		userdao.createuser(user);
	}

	public int maxnum() {
		return userdao.maxNum();
	}
	
	public User userSelect(String email) {
		User user = userdao.select(email);
		return user;
	}

	public List<User> userList() {
		List<User> list = userdao.userlist(); 
		return list;
	}

	public User userInfo(Integer mnum) {
		User user = userdao.infoSelect(mnum);
		return user;
	}

}







