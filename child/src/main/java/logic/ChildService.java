package logic;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import dao.MessageDao;
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
	@Autowired
	private MessageDao messageDao;

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
		Daycare dc = mapDao.selectOne(board.getCode());
		board.setDcname(dc.getName());
		boardDao.insert(board);
	}

	public int boardCount(Integer bType, String filterType, String searchType, String searchContent, String filterType2) {
		return boardDao.getCount(bType, filterType, searchType, searchContent,filterType2);
	}

	public List<Board> boardList(Integer bType, String filterType, String searchType, String searchContent,
			Integer pageNum, String filterType2, int limit) {
		List<Board> board = boardDao.getList(bType, filterType, searchType, searchContent, pageNum, limit, filterType2);
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

	public void boardUpdate(Board board, HttpServletRequest request) {
		if (board.getMulti1() != null && !board.getMulti1().isEmpty()) {
			uploadFileCreate(board.getMulti1(), request, "file"); // file1의 내용을 파일로 저장
			board.setFile1(board.getMulti1().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti2() != null && !board.getMulti2().isEmpty()) {
			uploadFileCreate(board.getMulti2(), request, "file"); // file2의 내용을 파일로 저장
			board.setFile2(board.getMulti2().getOriginalFilename()); // db에 파일명을 저장
		}
		if (board.getMulti3() != null && !board.getMulti3().isEmpty()) {
			uploadFileCreate(board.getMulti3(), request, "file"); // file3의 내용을 파일로 저장
			board.setFile3(board.getMulti3().getOriginalFilename()); // db에 파일명을 저장
		}
		Daycare dc = mapDao.selectOne(board.getCode());
		board.setDcname(dc.getName());
		boardDao.update(board);
	}

	public void readcntAdd(Integer bnum) {
		boardDao.readcntAdd(bnum);
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

	public void userDelete(Integer mnum) {
		userDao.userDelete(mnum);
	}

	public void boardDelete(Integer bnum) {
		boardDao.delete(bnum);
	}

	public static boolean isEmail(String email) {
		if (email == null)
			return false;
		boolean b = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", email.trim());
		return b;
	}
 
	public void commentWrite(Comment comment) {
		comment.setCnum(commentDao.maxCnum() + 1);
		comment.setRef(comment.getCnum());
		commentDao.commentWrite(comment);
	}

	public List<Comment> commentList(Integer bnum) {
		return commentDao.commentSelect(bnum);
	}

	public void addRed(Integer mnum) {
		userDao.addRed(mnum);
	}
	public void commentDelete(Integer cnum) {
		commentDao.delete(cnum);
	}

// 머리쓰기 싫어서 여러개 만들었어요 죗옹해요. 이름 구리면 변경할게요 알려주세요ㅠㅠ
	//게시글 삭제 위해서 댓글 삭제
	public void commentDeleteList(Integer bnum) {
		commentDao.deleteList(bnum);
	}
	//회원탈퇴하려고 다 삭제
	public void userCommentDelete(Integer mnum) {
		commentDao.userCommentDelete(mnum);
	}

	public void userBoardDelete(Integer mnum) {
		boardDao.userBoardDelete(mnum);
	}
//	
	public void commentUpdate(Comment comment) {
		commentDao.update(comment);
	}

	public void changePass(String newpass1, Integer mnum) {
		userDao.changePass(newpass1,mnum);
	}

	public void reWrite(Comment comment) {
		// 원댓글 정보 가져옴.
		Comment com = commentDao.getSelect(comment.getCnum());
		int refstep = com.getRefstep();
		commentDao.chgRefstep(com); // 기존 레코드 step 변경 메서드
		comment.setCnum(commentDao.maxCnum() + 1); // cnum증가
		comment.setRef(com.getRef());
		comment.setRefstep(refstep + 1); // 1번댓의 몇번째 대댓인지
		commentDao.commentWrite(comment);

	}

	public List<Daycare> search(String gu, String type, String bus) {
		if (gu == null || gu.equals("")) {
			gu = null;
		}
		if (type == null || type.equals("")) {
			type = null;
		}
		if (bus == null || bus.equals("")) {
			bus = null;
		}
		return mapDao.daycareList(gu, type, bus);
	}

	public Daycare selectOne(Integer code) {
		return mapDao.selectOne(code);
	}

	public List<Daycare> gulist() {

		return mapDao.gulist();
	}

	public List<Daycare> listBygu(String gu) {
		return mapDao.listBygu(gu);
	}


	public List<Board> fourlists(Integer code) {

		return mapDao.fourlists(code);
	}

	public Daycare_total getTotal() {
		
		return mapDao.getTotal();
	}

	public int commentCount(int bnum) {
		return commentDao.commentCnt(bnum);
	}
/*	public double getScore_avg(Integer code) {
		
		return mapDao.getScore_avg(code);
	}
*/

	public List<Daycare> autoMarkerlist(Double lat, Double lon) {
		// TODO Auto-generated method stub
		return mapDao.autoMarkerlist(lat,lon);
	}

	public List<Board> myBoardList(Integer mnum) {
		return boardDao.myBoardList(mnum);
	}

	public void myBoardDelete(Integer[] checkBoard) {	
		myComDelete(checkBoard);
		boardDao.myBoardDelete(checkBoard);
	}

	private void myComDelete(Integer[] checkBoard) {
		commentDao.myComDelete(checkBoard);
	}

	public void buyItem(Message msg) {
		msg.setMsgnum(messageDao.maxMsgnum() + 1);
		messageDao.insert(msg);
	}

	public List<Message> messageList(Integer bnum) {
		return messageDao.messageList(bnum);
	}

	public List<Message> getMyMessageList(Integer mnum) {
		return messageDao.getMymessageList(mnum);
	}




	/*
	 * public Comment commentSelect(Integer bnum) { return
	 * commentDao.commentSelect(bnum); }
	 */
}

/*
 * public List<Comment> commentlist(Integer bnum) { return
 * commentDao.commentwrite(bnum); }
 */
