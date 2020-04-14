package com.mk.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mk.web.dto.JusoDTO;

@Controller
public class JusoController {
	
	private static final Logger logger = LoggerFactory.getLogger(JusoController.class);
	
	@RequestMapping(value = "jusoSearch")
	public void jusoSearch(HttpServletRequest request, HttpServletResponse response, JusoDTO jusoDTO, Model model) throws Exception {
		logger.info("------- JusoController --------");
		String currentPage  = request.getParameter("currentPage");
		String countPerPage = request.getParameter("countPerPage"); 
		String resultType   = request.getParameter("resultType");
		String confmKey     = request.getParameter("confmKey");
		String keyword      = request.getParameter("keyword");
		
		String apiURL = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey+"&resultType="+resultType;
		
		URL url = new URL(apiURL);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		StringBuffer sb = new StringBuffer();
		String tempStr = null;
		
		while(true) {
			tempStr = br.readLine();
			if(tempStr == null) {
				break;
			}
			sb.append(tempStr);
		}
		br.close();
		logger.info(sb.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());
		
		
		
		
//		String jsonResult  = sb.toString();
//		
//		JSONObject obj = new JSONObject(jsonResult);
//		//공통부 출력
//		JSONObject common = obj.getJSONObject("results").getJSONObject("common");
//		
//		JusoDTO jusoDto = new JusoDTO();
//		
//		jusoDto.setErrorMessage(common.getString("errorMessage"));
//		jusoDto.setCountPerPage(common.getString("countPerPage"));
//		jusoDto.setErrorCode(common.getString("errorCode"));
//		jusoDto.setTotalCount(common.getString("totalCount"));
//		jusoDto.setCurrentPage(common.getString("currentPage"));
//		
//		JSONArray juso = obj.getJSONObject("results").getJSONArray("juso");

//		model.addAttribute("jusoList",sb.toString());
	
		
	}		
}

