package com.cinema;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dto.BookingDTO;
import com.cinema.dto.MovieDTO;
import com.cinema.dto.ScreenDTO;
import com.cinema.service.BookingService;
import com.cinema.service.MovieService;
import com.cinema.service.ScreenService;


@Controller
public class MainController {
	private ScreenService screenService;
	private BookingService bookingService;
	private MovieService movieService;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YY/MM/dd"); // 날짜 데이터 포멧 설정
	
	public MainController(ScreenService screenService, BookingService bookingService, MovieService movieService) {
		super();
		this.screenService = screenService;
		this.bookingService = bookingService;
		this.movieService = movieService;
	}

	@RequestMapping("/")
	public String main(Model model) {
		// 추가할것 : 지점별 영화가 몇개있는지 추가 ex 서울(4)
		//         연령별 이미지 추가
		
		// 현재 날짜 기본 설정값 초기화
		String sdate = LocalDate.now().format(formatter);
		System.out.println(sdate);
		// 영화 리스트 불러오는 부분
		List<MovieDTO> movielist = movieService.selectAllMovieList();
		
		// 1번째 리스트 mcode -> html에 최초 화면 제공용
		String mcode = movielist.get(0).getMcode();
		
		// sdate 임시 재설정
		sdate = "22/07/02";
		// 해당 영화 상영 지점 출력
		List<ScreenDTO> screenlist = screenService.selectScreenList(mcode, sdate);
		
		model.addAttribute("movielist", movielist);
		model.addAttribute("screenlist", screenlist);
		return "index";
	}
	
	@RequestMapping("/screenListView.do")
	public ResponseEntity<List<ScreenDTO>> screenListView(String mcode, Model model) {
		String sdate = LocalDate.now().format(formatter);
		
		// sdate 임시 재설정
		sdate = "22/07/02";
				
		System.out.println("screenListView, mcode : "+mcode);
		System.out.println("movieListView, sdate : "+sdate);
		
		List<ScreenDTO> screenlist = screenService.selectScreenList(mcode, sdate);
		
		return ResponseEntity.ok(screenlist);
	}
	
	@RequestMapping("/movieListView.do")
	public ResponseEntity<List<BookingDTO>> MovieListView(String screenCode, String sdate, String mcode, Model model) {
		
		System.out.println("movieListView, screenCode : "+screenCode);
		System.out.println("movieListView, sdate : "+sdate);
		System.out.println("movieListView, mcode : "+mcode);
		
		// sdate 임시 재설정
		sdate = "22/07/02";
				
		List<BookingDTO> movielist = bookingService.selectMovieList(screenCode, sdate, mcode);
		model.addAttribute("movielist", movielist);
		return ResponseEntity.ok(movielist);
	}
	
	
	@RequestMapping("/seatCreate.do")
	public ResponseEntity<String> seatCreate(String screenCode, String timeCode, String mcode, Model model) {
		System.out.println("seatView.do, screenCode : " + screenCode);
		String seatType = bookingService.selectSeatType(screenCode);
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
		return "seatview";
	}
	
	
	@RequestMapping("/booking.do")
	public String booking(String[] seatList, String id) {
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
		
		bookingService.insertReservation(screenCode, timeCode, mcode, seatList, id, totalPrice);
		
		return null;
	}
	
	
	
}