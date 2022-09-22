package com.project;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.Service.BookingService;
import com.project.Service.MemberService;
import com.project.Service.NaverAPI;
import com.project.Service.QnAService;
import com.project.Service.ScreenService;
import com.project.Service.kakaoAPI;
import com.project.Service.movieService;
import com.project.dto.AdminDTO;
import com.project.dto.BookingDTO;
import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MovieDTO;
import com.project.dto.QnADTO;
import com.project.dto.ScreenDTO;
import com.project.dto.ScreenMovieDTO;
import com.project.vo.PaggingVO;

@Controller
public class MainController {
	private movieService movieservice;
	private MemberService service;
	private QnAService qnaservice;
	private kakaoAPI kakaoAPI;
	private ScreenService screenservice;
	private BookingService bookingservice;
	private NaverAPI naverAPI;
	
	
	
	public MainController(movieService movieservice, MemberService service, QnAService qnaservice,
			com.project.Service.kakaoAPI kakaoAPI, ScreenService screenservice, BookingService bookingservice,
			com.project.Service.NaverAPI naverAPI) {
		super();
		this.movieservice = movieservice;
		this.service = service;
		this.qnaservice = qnaservice;
		this.kakaoAPI = kakaoAPI;
		this.screenservice = screenservice;
		this.bookingservice = bookingservice;
		this.naverAPI = naverAPI;
	}

	/*---------------------------------------------박홍희------------------------------------------------*/
	@RequestMapping("/admin-mainpage.do")
	public String admin_mainpage(Model model) {
		return "admin-mainpage";
	}

	@RequestMapping("/")
	public String index() {
		return "admin-login";
	}
	// 지점 관리 (은수은수은수)
//	@RequestMapping("/adminLogin.do")
//	public String adminMain(Model model, String cinemacode, String name, HttpSession session) {	
//		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
//		session.setAttribute("cinemacode", cinemacode);
//		session.setAttribute("name", name);
//		model.addAttribute("Cinemalist", Cinemalist);
//		return "admin_index";
//	}
	
	@RequestMapping("adminLogin.do")
	public void adminMain(String adminId, String adminPasswd, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		System.out.println("23123123"+adminPasswd);
		AdminDTO adto = service.adminLogin(adminId, adminPasswd);
		System.out.println(adto);
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		if(adto != null) {
			session.setAttribute("login", true);
			session.setAttribute("adto", adto);
			session.setAttribute("adminId", adto.getAdminId());
			session.setAttribute("gradeName", adto.getGradeName());
			response.getWriter().write("<script>alert('로그인 되었습니다.');location.href='admin.do';</script>");
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('이메일과 비밀번호를 확인하세요');location.href='/';</script>");
		}
	}
	
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin_index";
	}

	@RequestMapping("/main.do")
	public String blank(Model model, HttpServletResponse response) {
		List<MovieDTO> NowShowingMovielist = movieservice.selectNowshowingMovieList();
		System.out.println(NowShowingMovielist);
		model.addAttribute("NowShowingMovielist", NowShowingMovielist);
		List<MovieDTO> ComingSoonMovieList = movieservice.selectComingSoonMovieList();
		model.addAttribute("page", "main_body.jsp");
		model.addAttribute("ComingSoonMovieList", ComingSoonMovieList);

		return "main_index";
	}

	@RequestMapping("/select_all_movielist.do")
	public String selectAllMovieList(Model model) {
		List<MovieDTO> movieList = movieservice.selectAllMovieList();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		model.addAttribute("page", "hh/select_all_movielist.jsp");
		return "admin_index";
	}

	@RequestMapping("/deletemovie.do")
	public String deretemovie(Model model, String mcode) {
		String[] index = mcode.split(",");
		movieservice.deleteMovie(index);
		model.addAttribute("page", "hh/select_all_movielist.jsp");
		return "redirect:/select_all_movielist.do";
	}

	@RequestMapping("/select_movie_openAPI.do")
	public String openAPI(MovieDTO dto, Model model, HttpSession session, String cinemacode, String name) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		/* model.addAttribute("Cinemalist", Cinemalist); */
		model.addAttribute("page", "hh/select_movie_openAPI.jsp");
		return "admin_index";
	}

	@RequestMapping("/insertMovie_pop.do")
	public String insertMovie_pop(HttpServletResponse response, MovieDTO dto) {
		return "insertMovie_pop";
	}

	@RequestMapping("fileDown.do")
	public void fileDown(int fno, String mcode, HttpServletResponse response) throws IOException {
		System.out.println("ASdasd");
		String path = movieservice.selectFile(mcode, fno);
		File file = new File(path);
		response.setHeader("Content-Disposition", "attachement;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());

		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024 * 1024];
		while (true) {
			int size = fis.read(buffer);
			if (size == -1)
				break;
			bos.write(buffer, 0, size);
			bos.flush();
		}
		bos.close();
		fis.close();
	}

	@RequestMapping("/uploadmovie.do")
	public String uploadmovie(Model model, MovieDTO dto, ScreenMovieDTO scdto, MultipartHttpServletRequest request,
			String close, String update, int[] newfileindex, int[] oldfile) {
		if (update != null) {
			dto.setMcode(update);
			scdto.setmcode(update);
			movieservice.updateMovie(dto, scdto);
			// 파일 업로드
			// 저장할 경로
			String root = "c:\\fileUpload\\";
			File userRoot = new File(root);
			if (!userRoot.exists())
				userRoot.mkdirs();
			String mcode = dto.getMcode();
			List<MultipartFile> fileList = request.getFiles("file");
			List<MultipartFile> newfileList = request.getFiles("newfile");
			int i = 1;
			int nf = 0;
			if (newfileindex != null) {
				nf = newfileindex[0];
			}
			/*
			 * for(int ii = 0;ii<=4;ii++) { System.out.println("asd"+oldfile[ii]);
			 * System.out.println("asd"+newfileindex[i]); }
			 */
			for (MultipartFile f : fileList) {
				/*
				 * if (f.getOriginalFilename() != "") { i++; continue; }
				 */
				String originalFileName = f.getOriginalFilename();
				if (f.getSize() == 0) {
					i++;
					continue;
				}
				File uploadFile = new File(root + "\\" + originalFileName);
				movieservice.deleteFileList(mcode, i);
				movieservice.insertFileList(new FileDTO(uploadFile, mcode, i));
				i++;
				try {
					f.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (newfileindex != null) {
				int index = 0;
				for (MultipartFile f : newfileList) {
					String originalFileName = f.getOriginalFilename();
					if (f.getSize() == 0)
						continue;
					File uploadFile = new File(root + "\\" + originalFileName);
					movieservice.insertFileList(new FileDTO(uploadFile, mcode, newfileindex[index]));
					nf++;
					try {
						f.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					index++;
				}
			}
			if (close == null) {
				List<MovieDTO> list = movieservice.selectAllMovieList();
				model.addAttribute("list", list);
				return "redirect:/select_all_movielist.do";
			}
			return "close";
		} else {
			String mcode = movieservice.insertMovie(dto, scdto);
			// 파일 업로드
			// 저장할 경로
			String root = "c:\\fileUpload\\";
			File userRoot = new File(root);
			if (!userRoot.exists())
				userRoot.mkdirs();

			List<MultipartFile> fileList = request.getFiles("file");
			int i = 1;
			for (MultipartFile f : fileList) {
				String originalFileName = f.getOriginalFilename();
				if (f.getSize() == 0)
					continue;
				File uploadFile = new File(root + "\\" + originalFileName);
				movieservice.insertFileList(new FileDTO(uploadFile, mcode, i));
				i++;
				try {
					f.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (close == null) {
				List<MovieDTO> list = movieservice.selectAllMovieList();
				model.addAttribute("list", list);
				return "redirect:/select_all_movielist.do";
			}
			return "close";
		}
	}

	@RequestMapping("/close.do")
	public String close(Model model, String mcode) {
		return "close";
	}

	@RequestMapping("/movieView.do")
	public String movieView(String mcode, String update, Model model, HttpSession session) {
		MovieDTO dto = movieservice.selectMovieDTO(mcode);
		List<FileDTO> Filelist = movieservice.selectFilePath(mcode);
		ScreenMovieDTO scdto = movieservice.selectScreenMovieList(mcode);
		model.addAttribute("movie", dto);
		model.addAttribute("Filepath", Filelist);
		model.addAttribute("scdto", scdto);
		model.addAttribute("page", "hh/select_movie_detail_view.jsp");

		return "admin_index";
	}

	@RequestMapping("/data.do")
	public String data() {
		return "data";
	}

	@RequestMapping("/insert_movie.do")
	public String insertMovie(HttpSession session, HttpServletResponse response, Model model, MovieDTO dto,
			String cinemacode, String name) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		model.addAttribute("Cinemalist", Cinemalist);
		model.addAttribute("page", "hh/insert_movie.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/moviesingle.do")
	   public String moviesingle(Model model) {
	      model.addAttribute("page", "hh/moviesingle.jsp");
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
    public String login(@RequestParam("code") String code, HttpSession session, Model model) {
        System.out.println("code : " + code);

        String access_Token = kakaoAPI.getAccessToken(code);
        System.out.println("access_Token : " + access_Token);
        
        HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        model.addAttribute("page", "dh/simple-register.jsp");
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userEmail", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("kakaoLogin", true);
        }
        
    return "main_index";
}
 @RequestMapping(value="/logout")
    public String logout(HttpSession session, Model model) {
        String access_Token = (String)session.getAttribute("access_Token");
        model.addAttribute("page", "main_body.jsp");
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
 
	 /*
	  * 네이버 로그인
	  */
	 @RequestMapping("/naverLogin.do")
	 public String naverLogin(String code, HttpSession session, Model model) throws UnsupportedEncodingException {
	    System.out.println("naver-code : " + code);
	
	    String access_token = naverAPI.getAccessToken(code);
	
	    HashMap<String, Object> userInfo = naverAPI.getUserInfo(access_token);
	    String nickname = (String) userInfo.get("nickname");
	    String email = (String) userInfo.get("email");
	    
	    session.setAttribute("naverlogin", true);
	    session.setAttribute("userName", nickname);
	    session.setAttribute("userEmail", email);
	    
	    session.setAttribute("naverToken", access_token);
	    
	    model.addAttribute("page", "dh/simple-register.jsp");
	    System.out.println("nickname : "+nickname);
	    System.out.println("email : "+email);
	    
	    return "main_index";
	
	 }
	
	@RequestMapping("/memberlogin.do")
	public void login(String userEmail, String userPasswd, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		MemberDTO dto = service.login(userEmail, userPasswd);
		System.out.println(userEmail + " " + userPasswd);
		System.out.println(dto);
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		if(dto != null) {
			String[] arr = dto.getAddress().split("/");
			session.setAttribute("login", true);
			session.setAttribute("dto", dto);
			session.setAttribute("userEmail", dto.getUserEmail());
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("address1", arr[0]);
			session.setAttribute("address2", arr[1]);
			session.setAttribute("address3", arr[2]);
			response.getWriter().write("<script>alert('"+dto.getUserName()+"님 환영합니다.');location.href='main.do';</script>");
//			return "main_index";
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('이메일과 비밀번호를 확인하세요');location.href='main.do';</script>");
//			return "main_index";
		}
	}
	
	
	@RequestMapping("/memberlogout.do")
	public void memberlogout(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		session.invalidate();
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('로그아웃이 정상적으로 처리되었습니다');location.href='main.do';</script>");
//		return "main_index";
	}
	
	@RequestMapping("/registerView.do")
	public String registerView(Model model) {
		model.addAttribute("page", "dh/register.jsp");
		return "main_index";
	}
	
	@RequestMapping("/register.do") 
	public String register(MemberDTO dto, String id, String email, String address1, String address2, String address3, Model model) {
		String userEmail = id + email;
		System.out.println(userEmail);
		System.out.println(dto.getUserBirth());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setUserEmail(userEmail);
		dto.setAddress(address);
		System.out.println(dto.toString());
		model.addAttribute("page", "main_body.jsp");
		service.insertMember(dto);
		return "main_index";
	}
	
	@RequestMapping("/memberMypage.do")
	public String memberMypage(Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");
		MemberDTO mdto = service.selectMembermypage(userEmail);
		List<QnADTO> qdto = qnaservice.selectQnamypage(userEmail);
		model.addAttribute("mdto", mdto);
		model.addAttribute("qdto", qdto);
		model.addAttribute("page", "dh/mypage.jsp");
		return "main_index";
	}
	
	@RequestMapping("/qnaDetailView.do")
	public String qnaDetailView(int qno, Model model) {
		QnADTO qdto = qnaservice.selectQnaDetail(qno);
		model.addAttribute("qdto", qdto);
		model.addAttribute("page", "dh/qna-detail.jsp");
		return "main_index";
	}
	
	@RequestMapping("/updateView.do")
	public String updateView(Model model) {
		model.addAttribute("page", "dh/member_update.jsp");
		return "main_index";
	}
	
	@RequestMapping("/update.do")
	public String update(MemberDTO dto, String userEmail, String address1, String address2, String address3, String userTel, Model model) {
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setAddress(address);
		dto.setUserTel(userTel);
		System.out.println(dto);
		service.updateMember(dto);
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/deleteView.do")
	public String deleteView(Model model) {
		model.addAttribute("page", "dh/check_delete.jsp");
		return "main_index";
	}
	
	@RequestMapping("/delete.do")
	public String delete(String id, String email, String userPasswd, HttpSession session, Model model) {
		String userEmail = id + email;
		service.deleteMamber(userEmail, userPasswd);
		model.addAttribute("page", "main_body.jsp");
		session.invalidate();
		return "main_index";
	}
	
	@RequestMapping("/findIdView.do")
	public String findIdView(Model model) {
		model.addAttribute("page", "dh/find-id.jsp");
		return "main_index";
	}
	
	@RequestMapping("findId.do")
	public ResponseEntity<List<MemberDTO>> findId(String userName, String userTel) {
		List<MemberDTO> list = service.selectUserEmail(userName, userTel);
		System.out.println(userTel);
		System.out.println(userName);
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/findPasswdView.do")
	public String findPasswdView(Model model) {
		model.addAttribute("page", "dh/find-passwd.jsp");
		return "main_index";
	}
	
	@RequestMapping("findPasswd.do")
	public ResponseEntity<List<MemberDTO>> findPasswd(String userEmail, String userName, String userTel) {
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
		return "redirect:/main";
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
		System.err.println(userEmail);
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
		dto.setuserEmail((String) session.getAttribute("userEmail"));
		System.out.println(dto);
		qnaservice.insertQnA(dto);
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/updateQnaResponse.do")
	public void updateQnaResponse(QnADTO dto, int qno, String qnaTitle, String response, HttpServletResponse script) throws IOException {
		int result = qnaservice.updateQnaResponse(qno, response);
		script.setContentType("text/html;charset=utf-8");
		if(result == 1)
			script.getWriter().write(
					"<script>alert('답변이 등록되었습니다.');location.href='memberProfile.do?userEmail="+dto.getuserEmail()+"';</script>");
		else
			script.getWriter().write(
					"<script>alert('답변등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/faqView.do")
	public String faqView(Model model) {
		model.addAttribute("page", "dh/faq.jsp");
		return "main_index";
	}
	
	@RequestMapping("allQnaView")
	public String allQnaView(Model model) {
		List<QnADTO> qlist = qnaservice.selectAllQnaView();
		System.out.println(qlist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("page", "dh/all_qna_view.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/adminView.do")
	public String adminView(Model model) {
		List<AdminDTO> alist = service.selectAdminView();
		model.addAttribute("alist", alist);
		model.addAttribute("page", "dh/all_admin_view.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/adminInsert.do")
	public ResponseEntity<Integer> adminInsert(AdminDTO adto) {
		System.out.println(adto);
		int result = service.adminInsert(adto);
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping("/adminDelete.do")
	public ResponseEntity<Integer> adminDelete(String adminId) {
		System.out.println(adminId);
		int result = service.adminDelete(adminId);
		return ResponseEntity.ok(result);
	}

	/*--------------------------------------------------------------------------------------------------*/

	/*---------------------------------------------박은수------------------------------------------------*/
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YY/MM/dd"); // 날짜 데이터 포멧 설정
	@RequestMapping("/reserveView.do")
	public String reserveView(Model model) {
		// 추가할것 : 지점별 영화가 몇개있는지 추가 ex 서울(4)
		//         연령별 이미지 추가
		
		// 현재 날짜 기본 설정값 초기화
		String sdate = LocalDate.now().format(formatter);
		System.out.println(sdate);
		// 영화 리스트 불러오는 부분
		List<MovieDTO> movielist = movieservice.selectAllMovieList();
		
		// 1번째 리스트 mcode -> html에 최초 화면 제공용
		String mcode = movielist.get(0).getMcode();
		
		// sdate 임시 재설정
		sdate = "22/07/02";
		// 해당 영화 상영 지점 출력
		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		
		model.addAttribute("movielist", movielist);
		model.addAttribute("screenlist", screenlist);
		model.addAttribute("title", "영화 예매");
		model.addAttribute("page", "es/reserveView.jsp");
		return "main_index";
	}
	
	@RequestMapping("/screenListView.do")
	public ResponseEntity<List<ScreenDTO>> screenListView(String mcode, Model model) {
		String sdate = LocalDate.now().format(formatter);
		
		// sdate 임시 재설정
		sdate = "22/07/02";
				
		System.out.println("screenListView, mcode : "+mcode);
		System.out.println("movieListView, sdate : "+sdate);
		
		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		
		return ResponseEntity.ok(screenlist);
	}
	
	@RequestMapping("/movieListView.do")
	public ResponseEntity<List<BookingDTO>> MovieListView(String screenCode, String sdate, String mcode, Model model) {
		
		System.out.println("movieListView, screenCode : "+screenCode);
		System.out.println("movieListView, sdate : "+sdate);
		System.out.println("movieListView, mcode : "+mcode);
		
		// sdate 임시 재설정
		sdate = "22/07/02";
				
		List<BookingDTO> movielist = bookingservice.selectMovieList(screenCode, sdate, mcode);
		model.addAttribute("movielist", movielist);
		return ResponseEntity.ok(movielist);
	}
	
	
	@RequestMapping("/seatCreate.do")
	public ResponseEntity<String> seatCreate(String screenCode, String timeCode, String mcode, Model model) {
		System.out.println("seatView.do, screenCode : " + screenCode);
		String seatType = bookingservice.selectSeatType(screenCode);
		String str = "";
		FileReader fr;
		try {
			fr = new FileReader(seatType + ".txt");
			BufferedReader br = new BufferedReader(fr);
			while(true) {
				String t = br.readLine();
				if(t == null) break;
				str += t;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(str);
		String tag = "<input type='hidden' name='screenCode' value='"+screenCode+"'>"
				+ "<input type='hidden' name='timeCode' value='"+timeCode+"'>"
				+ "<input type='hidden' name='mcode' value='"+mcode+"'>";
		str = str.replace("/", "<div class='empty'></div>");
		str = str.replace("^", "<br>");
		int seat = 1;
		while(str.contains("*")) {
			str = str.replaceFirst("\\*", "<input type='button' value='"+seat+"' class='seat'>");
			seat++;
		}
		tag += str;
		System.out.println(tag);
		return ResponseEntity.ok(tag);
	}
	
	@RequestMapping("/seatView.do")
	public String seatView(String tag, Model model) {
		model.addAttribute("tag", tag);
		model.addAttribute("title", "좌석 예매");
		model.addAttribute("page", "es/seatView.jsp");
		return "main_index";
	}
	
	
	@RequestMapping("/booking.do")
	public void booking(String[] seatList, String id) {
		String screenCode = seatList[0];
		String timeCode = seatList[1];
		String mcode = seatList[2];
		String data = "";
		
		// seat 데이터 확인부
		for(int i=3;i<seatList.length;i++) {
			data += seatList[i] + ", ";
		}
		System.out.println("booking.do, seatList : " + data);
		
		// 데이터 임시 설정
		id = "test"; 
		int totalPrice = 10000;
		
		bookingservice.insertReservation(screenCode, timeCode, mcode, seatList, id, totalPrice);
		
	}
	
	
	
	/*--------------------------------------------------------------------------------------------------*/
}