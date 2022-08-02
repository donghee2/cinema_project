package com.example.cinema;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.cinema.dto.MemberDTO;
import com.example.cinema.dto.NonMemberDTO;
import com.example.cinema.service.MemberService;
import com.example.cinema.service.NonMemberService;

@Controller
public class MainController {
	private MemberService service;
	private NonMemberService nservice;

	public MainController(MemberService service, NonMemberService nservice) {
		this.service = service;
		this.nservice = nservice;
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
	
	@RequestMapping("/nonMemberLoginView.do")
	public String nonMemberLoginView() {
		return "nonmember_login";
	}
	
	@RequestMapping("/nonMemberLogin.do")
	public String nonMemberLogin(NonMemberDTO ndto, HttpSession session) {
		int result = nservice.insertNonMember(ndto);
		ndto = nservice.nonMemberLogin(ndto);
		if(ndto != null) {
			session.setAttribute("login", true);
			session.setAttribute("ndto", ndto);
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "nonmember_login";
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
	
	
}








