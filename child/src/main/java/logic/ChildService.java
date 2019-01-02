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
		return boarddao.getList(bType, filterType, searchType, searchContent, pageNum, limit);
	}

	public void userCreate(User user) {
		userdao.createuser(user);
	}

	public int maxnum() {
		return userdao.maxNum();
	}
}