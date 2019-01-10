package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.scenario.effect.impl.prism.PrImage;

import logic.ChildService;
import logic.Daycare;

@Controller
public class AjaxController {
	
	@Autowired
	private ChildService service;
	
	@ResponseBody
	@RequestMapping("user/niccheck") //비밀번호 일치 하나요??
	public Map<Object, Object> nickcheck(String nickname){
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg ="";
		if(service.userSelectnick(nickname)==null) {
			msg = "사용가능한 닉네임입니다.";
		} else {
			msg = "이미 사용중인 닉네임입니다.";
		}
		if(nickname == null || nickname =="") msg=" ";
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("user/emailcheck") //비밀번호 일치 하나요??
	public Map<Object, Object> emailcheck(String email){
		System.out.println(email);
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg ="";
		if(service.userSelect(email)==null) {
			if(service.isEmail(email)) {
				msg = "사용가능한 E-mail입니다.";
			}else {
				msg = "E-mail형식이 아닙니다.";
			}
		} else {
			msg = "중복된 E-mail입니다.";
		}
		if(email == null || email =="") msg=" ";
		map.put("msge", msg);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("map/search")
	public Object search(String gu, String type, String bus/*, String word*/){
		List<Daycare> daycarelist = service.search(gu,type,bus);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("daycarelist",daycarelist);
/*		return map.get("daycarelist");*/
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
