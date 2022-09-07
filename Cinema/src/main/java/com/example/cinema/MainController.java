package com.example.cinema;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.cinema.dto.GuestDTO;
import com.example.cinema.dto.MemberDTO;
import com.example.cinema.dto.QnADTO;
import com.example.cinema.service.GuestService;
import com.example.cinema.service.MemberService;
import com.example.cinema.service.QnAService;
import com.example.cinema.service.kakaoAPI;

@Controller
public class MainController {
	private MemberService service;
	private GuestService gservice;
	private QnAService qnaservice;
	private kakaoAPI kakaoAPI; 
	
	
	public MainController(MemberService service, GuestService gservice, QnAService qnaservice, kakaoAPI kakaoAPI) {
		this.service = service;
		this.gservice = gservice;
		this.qnaservice = qnaservice;
		this.kakaoAPI = kakaoAPI;
	}

	@RequestMapping("/")
	public String main() {
		return "homev2";
	}
	
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "memberlogin";
	}
	
	@RequestMapping(value="/login")
    public String login(@RequestParam("code") String code, HttpSession session) {
        System.out.println("code : " + code);

        String access_Token = kakaoAPI.getAccessToken(code);
        System.out.println("access_Token : " + access_Token);
        
        HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("kakaoLogin", true);
        }
    return "homev2";
}
 @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        String access_Token = (String)session.getAttribute("access_Token");

        if(access_Token != null && !"".equals(access_Token)){
            kakaoAPI.kakaoLogout(access_Token);
//            session.removeAttribute("access_Token");
//            session.removeAttribute("userId");
            session.invalidate();
        }else{
            System.out.println("access_Token is null");
            return "redirect:/";
        }
        return "homev2";
        
    }
	
	@RequestMapping("/memberlogin.do")
	public String login(String userEmail, String userPasswd, HttpSession session) {
		MemberDTO dto = service.login(userEmail, userPasswd);
		System.out.println(userEmail + " " + userPasswd);
		System.out.println(dto);
		if(dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("dto", dto);
			session.setAttribute("userEmail", dto.getUserEmail());
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "homev2";
		}
	}
	
	@RequestMapping("/guestLoginView.do")
	public String nonMemberLoginView() {
		return "guest_login";
	}
	
	// 쿼츠 이용해서 게스트 정보 삭제해야함
	@RequestMapping("/guestLogin.do")
	public String nonMemberLogin(GuestDTO gdto, HttpSession session) {
		System.out.println(gdto);
		gservice.insertGuest(gdto);
//		System.out.println("123456" + gdto);
		gdto = gservice.guestLogin(gdto);
//		System.out.println("asdasd" + gdto);
		if(gdto != null) {
			session.setAttribute("login", true);
			session.setAttribute("gdto", gdto);
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "guest_login";
		}
	}
	
	@RequestMapping("/memberlogout.do")
	public String memberlogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("/register.do") 
	public String register(MemberDTO dto, String id, String email, String address1, String address2, String address3) {
		String userEmail = id + email;
		System.out.println(userEmail);
		System.out.println(dto.getUserBirth());
		String address = address1 + " " + address2 + " " + address3;
		dto.setUserEmail(userEmail);
		dto.setAddress(address);
		System.out.println(dto.toString());
		service.insertMember(dto);
		return "homev2";
	}
	
	@RequestMapping("/updateView.do")
	public String updateView() {
		return "member_view";
	}
	
	@RequestMapping("/update.do")
	public String update(MemberDTO dto, String userEmail, String address1, String address2, String address3, int userTel) {
		String address = address1 + " " + address2 + " " + address3;
		dto.setAddress(address);
		dto.setUserTel(userTel);
		System.out.println(dto);
		service.updateMember(dto);
		return "redirect:/";
	}
	
	@RequestMapping("/deleteView.do")
	public String deleteView() {
		return "check_delete";
	}
	
	@RequestMapping("/delete.do")
	public String delete(String id, String email, String userPasswd, HttpSession session) {
		String userEmail = id + email;
		service.deleteMamber(userEmail, userPasswd);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/findIdView.do")
	public String findIdView() {
		return "find_id";
	}
	
	@RequestMapping("findId.do")
	public ResponseEntity<List<MemberDTO>> findId(String userName, int userTel) {
		List<MemberDTO> list = service.selectUserEmail(userName, userTel);
		System.out.println(userTel);
		System.out.println(userName);
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/findPasswdView.do")
	public String findPasswdView() {
		return "find_passwd";
	}
	
	@RequestMapping("findPasswd.do")
	public ResponseEntity<List<MemberDTO>> findPasswd(String userEmail, String userName, int userTel) {
//		System.out.println(userEmail);
//		System.out.println(userName);
//		System.out.println(userTel);
		List<MemberDTO> list = service.selectUserPasswd(userEmail, userName, userTel);
		if(list.size() > -1) {
			list = service.selectUserPasswd(userEmail, userName, userTel);
		}
//		System.out.println(list.toString());
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/updatePasswd.do")
	public String updatePasswd(String userEmail, String userPasswd) {
		System.out.println("updatePasswd.do " + userEmail + " " + userPasswd);
		service.updatePasswd(userEmail, userPasswd);
		return "login";
	}
	
	@RequestMapping("/allMemberView.do")
	public String allMemberView(Model model) {
		List<MemberDTO> list = service.selectAllMember();
		System.out.println(list.toString());
		model.addAttribute("list", list);
		return "all_member_view";
	}
	
	@RequestMapping("qnaWriteView.do")
	public String qnaWriteView() {
		return "qna";
	}
	
	@RequestMapping("/qnaWrite.do")
	public String insertContent(QnADTO dto, HttpSession session) {
		dto.setQnaWriter((String) session.getAttribute("userEmail"));
		System.out.println(dto);
		qnaservice.insertQnA(dto);
		return "qna";
	}
	

}




