package com.mk.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mk.web.dto.UserInfoDTO;
import com.mk.web.service.ILoginService;

@Controller
public class LoginController {

	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ILoginService iLoginService;
	
	@RequestMapping(value = "login")
	public String loginFrom(Model model	) {
		return "login/loginForm";
	}
	
	@RequestMapping(value = "loginCheck")
	public String loginCheck(UserInfoDTO userInfoDTO, Model model) {
		logger.debug("----------------");
		return "a";
	}
	
	@RequestMapping(value = "signUp")
	public String signUp(Model model) {
		logger.info("회원가입");
		return "login/signUp";
	}
	
	@RequestMapping(value = "signUpSubmit", method = RequestMethod.POST)
	public String signUpSubmit(UserInfoDTO userInfoDTO, Model model) {
		System.out.println("1 " + userInfoDTO.getU_id());		
		System.out.println("2 " + userInfoDTO.getU_pw());		
		System.out.println("3 " + userInfoDTO.getU_name());		
		System.out.println("4 " + userInfoDTO.getU_gender());		
		System.out.println("5 " + userInfoDTO.getU_num());		
		System.out.println("6 " + userInfoDTO.getU_tel_no());		
		System.out.println("7 " + userInfoDTO.getU_email());		
		iLoginService.signUpSubmit(userInfoDTO);
		return "login/loginForm";
	}
	
	@RequestMapping(value = "checkId")
	public String checkId(UserInfoDTO userInfoDTO, Model model) {
		System.out.println("id check");
		return "";
	}
}
