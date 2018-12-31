package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChildService {
	@Autowired
	User user;

	public int boardCount(Integer bType, String filterType, String searchType, String searchContent) {
		return 0;
	}

	public List<Board> boardList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit) {
		return null;
	}
}