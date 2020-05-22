package com.mk.web.controller;

import java.util.List;

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

	@Autowired
	private ILoginService iLoginService;
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
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
		iLoginService.signUpSubmit(userInfoDTO);
		return "login/signUp";
	}
	
}
