package logic;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.CommentDao;
import dao.MapDao;
import dao.UserDao;

@Service
public class ChildService {

	@Autowired
	private UserDao userDao;
	@Autowired 
	private BoardDao boardDao;
	@Autowired
	private MapDao mapDao;
	@Autowired
	private CommentDao commentDao;

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/" + path + "/";
		String orgFile = picture.getOriginalFilename(); // 파일명
		try {
			picture.transferTo(new File(uploadPath + orgFile));
			// transferTo : 파일의 내용을 uploadPath + orgFile인 파일에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void boardInsert(Board board, HttpServletRequest request) {
		board.setBnum(boardDao.maxBnum() + 1);
		if (board.getMulti1() != null && !board.getMulti1().isEmpty()) {
			uploadFileCreate(board.getMulti1(), request, "file"); // file의 내용을 파일로 저장
			board.setFile1(board.getMulti1().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti2() != null && !board.getMulti2().isEmpty()) {
			uploadFileCreate(board.getMulti2(), request, "file"); // file의 내용을 파일로 저장
			board.setFile2(board.getMulti2().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti3() != null && !board.getMulti3().isEmpty()) {
			uploadFileCreate(board.getMulti3(), request, "file"); // file의 내용을 파일로 저장
			board.setFile3(board.getMulti3().getOriginalFilename()); // db에 파일명을 저장
		}
		boardDao.insert(board);
	}

	public int boardCount(Integer bType, String filterType, String searchType, String searchContent) {
		return boardDao.getCount(bType, filterType, searchType, searchContent);
	}

	public List<Board> boardList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, int limit) {
		List<Board> board = boardDao.getList(bType, filterType, searchType, searchContent, pageNum, limit);
		for (Board b : board) {
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
	
	public User userSelectnick(String nickname) {
		User user = userDao.selectnick(nickname);
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


	public void userUpdate(User user) {
		userDao.userUpdate(user);
	}


	public List<String> gusort() {
		return mapDao.gusort();
	}

	public List<Integer> cntsort() {
		return mapDao.cntsort();
	}

	public List<String> getpoint(String gu, String type, String bus, String word) {
		
		return mapDao.getpoints(gu,type,bus,word);

	}

	public void userDelete(Integer mnum) {
		userDao.userDelete(mnum);
	}

	public void boardDelete(Integer bnum) {
		boardDao.boardDelete(bnum);
	}
	
	public static boolean isEmail(String email) {
        if (email==null) return false;
        boolean b = Pattern.matches(
            "[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
            email.trim());
        return b;
    }

	public void commentWrite(Comment comment) {
		comment.setCnum(commentDao.maxCnum() + 1);
		commentDao.commentWrite(comment);
	}

	public List<Comment> commentList(Integer bnum) {
		return commentDao.commentSelect(bnum);
	}

	public void addRed(Integer mnum) {
		userDao.addRed(mnum);		
	}
	
	
	
	
	
	
	

/*	public List<Comment> commentlist(Integer bnum) {
		return commentDao.commentwrite(bnum);
	}*/

/*	public void boardUpdate(Board board,HttpServletRequest request) {
		if (board.getMulti1() != null && !board.getMulti1().isEmpty()) {
			uploadFileCreate(board.getMulti1(), request, "file"); // file의 내용을 파일로 저장
			board.setFile1(board.getMulti1().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti2() != null && !board.getMulti2().isEmpty()) {
			uploadFileCreate(board.getMulti2(), request, "file"); // file의 내용을 파일로 저장
			board.setFile2(board.getMulti2().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti3() != null && !board.getMulti3().isEmpty()) {
			uploadFileCreate(board.getMulti3(), request, "file"); // file의 내용을 파일로 저장
			board.setFile3(board.getMulti3().getOriginalFilename()); // db에 파일명을 저장
		}
		boardDao.boardUpdate(board);
	}*/
}













