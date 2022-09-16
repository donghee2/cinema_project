package com.project;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Service.MemberService;
import com.project.Service.QnAService;
import com.project.Service.kakaoAPI;
import com.project.Service.movieService;
import com.project.dto.MemberDTO;
import com.project.dto.QnADTO;
import com.project.vo.PaggingVO;

@Controller
public class MainController {
	private movieService movieservice;
	private MemberService service;
	private QnAService qnaservice;
	private kakaoAPI kakaoAPI; 

	
	public MainController(movieService movieservice, MemberService service, QnAService qnaservice,
			com.project.Service.kakaoAPI kakaoAPI) {
		this.movieservice = movieservice;
		this.service = service;
		this.qnaservice = qnaservice;
		this.kakaoAPI = kakaoAPI;
	}

	/*---------------------------------------------박홍희------------------------------------------------*/
	@RequestMapping("/admin-mainpage.do")
	public String admin_mainpage(Model model) {
		return "admin-mainpage";
	}
	
	@RequestMapping("/")
	public String index(Model model) {
		return "admin_index";
	}
	@RequestMapping("/main")
	public String blank(Model model) {
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	
	
	/*--------------------------------------------------------------------------------------------------*/

	/*---------------------------------------------이동희------------------------------------------------*/
		
	@RequestMapping("/loginView.do")
	public String loginView(Model model) {
		model.addAttribute("page", "dh/login.jsp");
		return "main_index";
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
    return "main_index";
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
        return "main_index";
        
    }
	
	@RequestMapping("/memberlogin.do")
	public String login(String userEmail, String userPasswd, HttpSession session, Model model) {
		MemberDTO dto = service.login(userEmail, userPasswd);
		System.out.println(userEmail + " " + userPasswd);
		System.out.println(dto);
		model.addAttribute("page", "main_body.jsp");
		if(dto != null) {
			String[] arr = dto.getAddress().split("/");
			session.setAttribute("login", true);
			session.setAttribute("dto", dto);
			session.setAttribute("userEmail", dto.getUserEmail());
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("address1", arr[0]);
			session.setAttribute("address2", arr[1]);
			session.setAttribute("address3", arr[2]);
			return "main_index";
		} else {
			session.setAttribute("login", false);
			return "main_index";
		}
	}
	
	
	@RequestMapping("/memberlogout.do")
	public String memberlogout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/registerView.do")
	public String registerView(Model model) {
		model.addAttribute("page", "dh/register.jsp");
		return "main_index";
	}
	
	@RequestMapping("/register.do") 
	public String register(MemberDTO dto, String id, String email, String address1, String address2, String address3) {
		String userEmail = id + email;
		System.out.println(userEmail);
		System.out.println(dto.getUserBirth());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setUserEmail(userEmail);
		dto.setAddress(address);
		System.out.println(dto.toString());
		service.insertMember(dto);
		return "main_index";
	}
	
	@RequestMapping("/updateView.do")
	public String updateView(Model model) {
		model.addAttribute("page", "dh/member_update.jsp");
		return "main_index";
	}
	
	@RequestMapping("/update.do")
	public String update(MemberDTO dto, String userEmail, String address1, String address2, String address3, int userTel) {
		String address = address1 + "/" + address2 + "/" + address3;
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
	
	@RequestMapping("/allMemberView")
	public String allMemberView(Model model) {
		List<MemberDTO> list = service.selectAllMember();
		System.out.println(list.toString());
		for(int i=0;i<list.size();i++) {
			String[] arr = list.get(i).getAddress().split("/");
			model.addAttribute("address1", arr[0]);
			model.addAttribute("address2", arr[1]);
			model.addAttribute("address3", arr[2]);
		}
		model.addAttribute("page", "dh/all_member_view.jsp");
		model.addAttribute("list", list);
		return "admin_index";
	}
	
	@RequestMapping("/memberDelete.do")
	public void memberDelete(String userEmail, HttpServletResponse response) throws IOException {
		int result = service.adminDeleteMember(userEmail);
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("memberProfile.do")
	public String memberProfile(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String userEmail, Model model) {
		MemberDTO dto = service.selectMemberProfile(userEmail);
		String[] arr = dto.getAddress().split("/");
		
		List<QnADTO> qna = qnaservice.selectQna(userEmail, pageNo);
		System.out.println(qna.toString());
		int count = qnaservice.countQna(userEmail);
		PaggingVO vo = new PaggingVO(count, pageNo, 5 ,5);
		
		model.addAttribute("pagging", vo);
		model.addAttribute("qna", qna);
		model.addAttribute("dto", dto);
		model.addAttribute("address1", arr[0]);
		model.addAttribute("address2", arr[1]);
		model.addAttribute("address3", arr[2]);
		model.addAttribute("page", "dh/member_profile.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/memberUpdate.do")
	public void memberUpdate(MemberDTO dto, String address1, String address2, String address3, HttpServletResponse response) throws IOException {
		System.out.println(dto.toString());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setAddress(address);
		int result = service.adminMemberUpdate(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('수정이 완료되었습니다.');location.href='memberProfile.do?userEmail="+dto.getUserEmail()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('수정에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("qnaWriteView.do")
	public String qnaWriteView(Model model) {
		model.addAttribute("page", "dh/qna.jsp");
		return "main_index";
	}
	
	@RequestMapping("/qnaWrite.do")
	public String insertContent(QnADTO dto, HttpSession session, Model model) {
		dto.setQnaWriter((String) session.getAttribute("userEmail"));
		System.out.println(dto);
		qnaservice.insertQnA(dto);
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/faqView.do")
	public String faqView(Model model) {
		model.addAttribute("page", "dh/faq.jsp");
		return "main_index";
	}
	
	@RequestMapping("allQnaView")
	public String allQnaView(Model model) {
		model.addAttribute("page", "dh/all_qna_view.jsp");
		return "admin_index";
	}
	
	
	/*--------------------------------------------------------------------------------------------------*/
	
	/*---------------------------------------------박은수------------------------------------------------*/
	
	
	
	
	/*--------------------------------------------------------------------------------------------------*/
}