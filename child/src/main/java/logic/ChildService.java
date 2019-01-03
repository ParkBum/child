package logic;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dao.UserDao;

@Service
public class ChildService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private BoardDao boardDao;

	public int boardCount(Integer bType, String filterType, String searchType, String searchContent) {
		return boardDao.getCount(bType, filterType, searchType, searchContent);
	}

	public List<Board> boardList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit) {
		List<Board> board = boardDao.getList(bType, filterType, searchType, searchContent, pageNum, limit);
		for(Board b : board) {
			b.setNickname(getNickName(b.getMnum()));
		}
		return board;
	}

	public Board getBoard(Integer bnum) {
		Board board = boardDao.getBoard(bnum);
		board.setNickname(getNickName(board.getMnum()));
		return board;
	}
	
	public String getNickName(int mnum) {
		return userDao.nickName(mnum);
	}

	public void userCreate(User user) {
		userDao.createuser(user);
	}

	public int maxnum() {
		return userDao.maxNum();
	}
	
	public User userSelect(String email) {
		User user = userDao.select(email);
		return user;
	}

	public List<User> userList() {
		List<User> list = userDao.userlist(); 
		return list;
	}

	public User userInfo(Integer mnum) {
		User user = userDao.infoSelect(mnum);
		return user;
	}
	public void boardInsert(Board board, HttpServletRequest request) {
		board.setNum(boardDao.maxNum() + 1);
		board.setRef(board.getNum());
		if (board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request, "file"); // file의 내용을 파일로 저장
			board.setFileurl(board.getFile1().getOriginalFilename()); // db에 파일명을 저장
		}
		boardDao.insert(board);
	}

}







