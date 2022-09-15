package com.project;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.Service.movieService;
import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MovieDTO;
import com.project.dto.ScreenDTO;
import com.project.dto.ScreenMovieDTO;

@Controller
public class MainController {
	private movieService movieservice;

	public MainController(movieService movieservice) {
		this.movieservice = movieservice;
	}
	/*---------------------------------------------박홍희------------------------------------------------*/
	@RequestMapping("/admin-mainpage.do")
	public String admin_mainpage(Model model) {
		return "admin-mainpage";
	}
	
	@RequestMapping("/")
	public String index(Model model) {
		return "blank";
	}
	@RequestMapping("/blank.do")
	public String blank(Model model) {
		return "blank";
	}
	
	
	
	/*--------------------------------------------------------------------------------------------------*/

	/*---------------------------------------------이동희------------------------------------------------*/
	
	
	
	
	/*--------------------------------------------------------------------------------------------------*/

}