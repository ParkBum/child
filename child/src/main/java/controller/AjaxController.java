package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import logic.ChildService;
import logic.User;

@Controller
public class AjaxController {
	
	@Autowired
	private ChildService service;
	
	/*@ResponseBody
	@RequestMapping("user/check")
	public Map<Object,Object> check(String nickname){
		String dbnick = service.userSelect())
		if(nickname != )
		return null;
	}*/
	
	@ResponseBody
	@RequestMapping("user/niccheck") //비밀번호 일치 하나요??
	public Map<Object, Object> nickcheck(String nickname){
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg ="";
		if(service.userSelect(nickname)==null) {
			msg = "사용가능한 닉네임입니다.";
		} else {
			msg = "이미 사용중인 닉네임입니다.";
		}
		map.put("msg", msg);
		return map;
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/* 
 * === Example === 
   @Autowired
   private ChildService service;
   
   @ResponseBody 			//뷰없이 값만 리턴
   @RequestMapping("board/recmd")
   public Map<Object, Object> recmd(Integer num, Integer type, String userid) {
      Map<Object, Object> map = new HashMap<Object, Object>();
      Board board = new Board(); //board 껍데기 객체 생성
      board.setBoardnum(num);
      board.setBoardtype(type);
      board = service.getBoard(board); //해당 num,type의 board객체 가져옴
      int recmdselect = service.recmdselect(userid,num);
      if(recmdselect<1) { // 해당 게시글에 해당아이디의 추천이 없을때
         if(board.getUserid().equals(userid)) {//본인 게시물일때
            map.put("recmd", board.getRecmd());
            map.put("msg", "본인게시물 추천 불가능!");      
         }else {//본인 게시물이 아닐때
            board.setRecmd(board.getRecmd()+1);      
            int recmd = service.recmd(board,userid);
            map.put("recmd", recmd);
            map.put("msg", "추천이 완료되었습니다!");
         }
      }else {
         map.put("recmd", board.getRecmd());
         map.put("msg", "중복추천 불가능!");         
      }
      return map;
   }
   
   @ResponseBody
   @RequestMapping("board/duck")
   public Map<Object, Object> duck(Integer num, Integer type, String userid) {
      Map<Object, Object> map = new HashMap<Object, Object>();
      Board board = new Board(); //board 껍데기 객체 생성
      board.setBoardnum(num);
      board.setBoardtype(type);
      board = service.getBoard(board); //해당 num,type의 board객체 가져옴
      int duckselect = service.duckselect(userid,num);
      if(duckselect<1) { // 해당 게시글에 해당아이디의 Duck이 없을때
         if(!board.getUserid().equals(userid)) { //자신의 게시물이 아닐때
            try {
               service.boardduck(board,userid);
               map.put("msg", "Duck 완료!");   
            }catch (Exception e) {
               e.printStackTrace();
            }            
         }else {//자신의 게시물일때
            map.put("msg", "본인 게시물입니다!");
         }
      }else {//해당 게시글에 해당 아이디의 Duck이 있을때
         map.put("msg", "이미 Duck한 게시물입니다!");         
      }
      return map;
   }*/
