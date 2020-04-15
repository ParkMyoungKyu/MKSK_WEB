package com.mk.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@RequestMapping(value = "fileUpload")
	public String fileUpload(HttpServletRequest request ,Model model) {
		String fileTest = "/PMK";
		
		int size = 10*1024*1024;
		
		return "fileEnd";
	}
	
}
