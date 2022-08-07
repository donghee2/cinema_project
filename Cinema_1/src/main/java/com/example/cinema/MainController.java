package com.example.cinema;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.cinema.dto.GuestDTO;
import com.example.cinema.dto.MemberDTO;
import com.example.cinema.service.GuestService;
import com.example.cinema.service.MemberService;

@Controller
public class MainController {
	private MemberService service;
	private GuestService gservice;

	public MainController(MemberService service, GuestService gservice) {
		this.service = service;
		this.gservice = gservice;
	}
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping("/login.do")
	public String login(String userEmail, String userPasswd, HttpSession session) {
		MemberDTO dto = service.login(userEmail, userPasswd);
		System.out.println(userEmail + " " + userPasswd);
		System.out.println(dto);
		if(dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("dto", dto);
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "login";
		}
	}
	
	@RequestMapping("/guestLoginView.do")
	public String nonMemberLoginView() {
		return "guest_login";
	}
	
	@RequestMapping("/guestLogin.do")
	public String nonMemberLogin(GuestDTO gdto, HttpSession session) {
		int result = gservice.insertGuest(gdto);
		gdto = gservice.guestLogin(gdto);
		if(gdto != null) {
			session.setAttribute("login", true);
			session.setAttribute("ndto", gdto);
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "guest_login";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("/register.do") 
	public String register(MemberDTO dto) {
		service.insertMember(dto);
		return "login";
	}
	
	@RequestMapping("/updateView.do")
	public String updateView() {
		return "member_view";
	}
	
	@RequestMapping("/update.do")
	public String update(String userEmail) {
		service.updateMember(userEmail);
		return "member_view";
	}
	
	@RequestMapping("/deleteView.do")
	public String deleteView() {
		return "check_delete";
	}
	
	@RequestMapping("/delete.do")
	public String delete(String userEmail, String userPasswd, HttpSession session) {
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
		
		List<MemberDTO> list = service.selectUserPasswd(userEmail, userName, userTel);
		System.out.println(list.toString());
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/updatePasswd.do")
	public String updatePasswd(String userEmail, String userPasswd) {
		service.updatePasswd(userEmail, userPasswd);
		return "login";
	}
}








