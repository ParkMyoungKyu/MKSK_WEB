package com.mk.web.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Model model) {
		return "main";
	}

	@RequestMapping(value = "menuMove")
	public String menuMove(HttpServletRequest request,Model model) {
		String command = request.getParameter("command");
		String move = "";
		
		logger.info("command ->>> " + command);
		
		if("01".equals(command))       move = "dialog";
		else if ("02".equals(command)) move = "juso";
		else if ("03".equals(command)) move = "jsonTest";
		else if ("04".equals(command)) move = "fileUpload";
		else if ("05".equals(command)) move = "weather";
		else if ("06".equals(command)) move = "jsonValGet";
		else if ("07".equals(command)) move = "cssPtc";
		
		return move;
	}
}
