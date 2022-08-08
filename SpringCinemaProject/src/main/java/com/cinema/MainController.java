package com.cinema;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dto.CinemaDTO;
import com.cinema.dto.TheaterDTO;
import com.cinema.service.CinemaService;
import com.cinema.service.TheaterService;

@Controller
public class MainController {
	private CinemaService cinemaService;
	private TheaterService theaterService;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YY/MM/dd"); // 날짜 데이터 포멧 설정
	
	public MainController(CinemaService boardService, TheaterService memberService) {
		this.cinemaService = boardService;
		this.theaterService = memberService;
	}
	
	@RequestMapping("/")
	public String main(Model model) {
		List<CinemaDTO> list = cinemaService.selectCinemaList();
		model.addAttribute("list", list);
		return "main";
	}
	
	@RequestMapping("/schedule.do")
	public String schedule(String cno, String sdate, Model model) {
		if(sdate == null)
			sdate = LocalDate.now().format(formatter);
		System.out.println(cno);
		System.out.println(sdate);
		List<TheaterDTO> slist = theaterService.selectMovieScheduleList(cno, sdate);
		System.out.println(slist.get(0).getSdate());
		
		// 날짜 시/분 가공부
		for(int i=0;i<slist.size();i++)
			slist.get(i).setSdate(slist.get(i).getSdate().substring(11,16));
		
		System.out.println(slist.get(0).getSdate());
		System.out.println(slist.get(0).getTname());
		
		model.addAttribute("slist", slist);
		return "schedule";
	}
	
	@RequestMapping("/seatView.do")
	public String seatView(String sno, Model model) {
		TheaterDTO dto = theaterService.selectSeat(sno);
		System.out.println(dto.getSeatx());
		System.out.println(dto.getSeaty());
		int seat = 1;
		String tag = "<table>";
		for(int j=0;j<dto.getSeaty();j++) {
			tag += "<tr>";
		for(int i=0;i<dto.getSeatx();i++) {
			tag += "<td><a href='reservation.do?seat="+seat+"&sno="+sno+"'>"+(char)(j+65)+(i+1)+"</td>";
			seat++;
		}
			tag += "</tr>";
		}
		tag += "</table>";
		System.out.println(tag);
		model.addAttribute("tag", tag);
		return "seatview";
	}
	
	@RequestMapping("/reservation.do")
	public String reservation(String seat, String id, String sno) {
		System.out.println(seat);
		id = "TEST"; 
		theaterService.insertReservation(seat, id, sno);
		
		return null;
	}
	
}