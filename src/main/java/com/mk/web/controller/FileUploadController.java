package com.mk.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@RequestMapping(value = "fileUpload")
	public String fileUpload(HttpServletRequest request ,Model model) {
		String fileTest = "/PMK";
		
		int size = 10*1024*1024;
		
		try {
			com.oreilly.servlet.MultipartRequest multi = new com.oreilly.servlet.MultipartRequest(request, fileTest , size, "utf-8", new DefaultFileRenamePolicy());
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return "fileEnd";
	}
	
}
