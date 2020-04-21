package com.mk.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mk.web.dto.WeatherDTO;

@RestController
public class WeatherController {
		
	final Logger logger = LoggerFactory.getLogger(getClass());
	@ResponseBody
	@RequestMapping(value = "weatherSearch")
	public String weatherSearch(WeatherDTO weatherDto, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
	      SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
	      SimpleDateFormat format2 = new SimpleDateFormat("HH");
	      
	      Date time = new Date();
	      weatherDto.setBase_date(format1.format(time));
	      int nowTime = Integer.parseInt(format2.format(time));
	      if(2 <= nowTime  && nowTime < 5)    weatherDto.setBase_time("0200");
	      if(5 <= nowTime  && nowTime < 8)    weatherDto.setBase_time("0500");
	      if(8 <= nowTime  && nowTime < 11)   weatherDto.setBase_time("0800");
	      if(11 <= nowTime &&  nowTime < 14)  weatherDto.setBase_time("1100");
	      if(14 <= nowTime &&  nowTime < 17)  weatherDto.setBase_time("1400");
	      if(17 <= nowTime &&  nowTime < 20)  weatherDto.setBase_time("1700");
	      if(20 <= nowTime &&  nowTime < 23)  weatherDto.setBase_time("2000");
	      if(23 <= nowTime &&  nowTime < 2 || nowTime == 0)   {
	    	  weatherDto.setBase_date(format1.format(time));
	    	  weatherDto.setBase_time("2300");
	      }
	      
	      String serviceKey = "w7%2Fp3SnRp8NhmFmt1jm4Q8x1aKjZsP2k%2BnrLjesD3Ptag7iKvo2pDt8d4spRu%2Bm29XKt3mM1hfmUcKYqbi2F%2Fw%3D%3D";
	      String numOfRows  = "300";
	      String pageNo   = "1";
	      String dataType   = "JSON";
	      String base_date = weatherDto.getBase_date();
	      String base_time = weatherDto.getBase_time(); // -- > 위에서 조건절로 설정예정   
	      String nx   = "59";
	      String ny   = "125";
	      String URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey="+serviceKey+"&numOfRows="+numOfRows+"&pageNo="+pageNo+"&dataType="+dataType+"&base_date="+base_date+"&base_time="+base_time+"&nx="+nx+"&ny="+ny;
	      
	      java.net.URL url = new java.net.URL(URL);
	      
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

	      String output = sb.toString();
	      
	      JSONObject obj = new JSONObject(output);
	      JSONArray arr = obj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
	      String rstMsg = obj.getJSONObject("response").getJSONObject("header").getString("resultMsg");
	      System.out.println("resultMsg -> " + rstMsg);
	      System.out.println(obj);
	      System.out.println(arr);
         
	      for(int i = 0; i<arr.length(); i++) {
	         String category = arr.getJSONObject(i).getString("category");
            if("POP".equals(category)) {
               System.out.println("======================================");
               System.out.println(" 예보 날짜 " + arr.getJSONObject(i).getString("fcstDate"));
               System.out.println(" 예보 시간 " + arr.getJSONObject(i).getString("fcstTime"));
               System.out.println(" 강수확률 -> " + arr.getJSONObject(i).getString("fcstValue") +"%");
            }else if("PTY".equals(category)) {
               System.out.println(" 강수형태 -> " + arr.getJSONObject(i).getString("fcstValue"));
            }else if("REH".equals(category)) {
               System.out.println(" 습도 -> " + arr.getJSONObject(i).getString("fcstValue")+"%");
            }else if("SKY".equals(category)) {
               if("1".equals(arr.getJSONObject(i).getString("fcstValue"))) {
                  System.out.println(" 날씨 (" + arr.getJSONObject(i).getString("fcstValue") + ") >>> 맑음");
               }else if("2".equals(arr.getJSONObject(i).getString("fcstValue"))) {
                  System.out.println(" 날씨 (" + arr.getJSONObject(i).getString("fcstValue") + ") >>> 구름조금");
               }else if("3".equals(arr.getJSONObject(i).getString("fcstValue"))) {
                  System.out.println(" 날씨 (" + arr.getJSONObject(i).getString("fcstValue") + ") >>> 구름많음");
               }else if("4".equals(arr.getJSONObject(i).getString("fcstValue"))) {
                  System.out.println(" 날씨 (" + arr.getJSONObject(i).getString("fcstValue") + ") >>> 흐림");
               }
            }else if("T3H".equals(category)) {
               System.out.println(" 기온 -> " + arr.getJSONObject(i).getString("fcstValue") +"°C");
            }else if("TMN".equals(category)) {
               System.out.println(" 아침 최저기온 -> " + arr.getJSONObject(i).getString("fcstValue"));
            }else if("VEC".equals(category)) {
               System.out.println(" 풍향 -> " + arr.getJSONObject(i).getString("fcstValue"));
               int b = Integer.parseInt(arr.getJSONObject(i).getString("fcstValue"));
               String a = Integer.toString((int) ((b+11.25)/22.5));
               if("0".equals(a)) System.out.println(" 북풍");
               else if("1".equals(a)) System.out.println(" 북북동풍");
               else if("2".equals(a)) System.out.println(" 북동풍");
               else if("3".equals(a)) System.out.println(" 동북동풍");
               else if("4".equals(a)) System.out.println(" 동풍");
               else if("5".equals(a)) System.out.println(" 동남동풍");
               else if("6".equals(a)) System.out.println(" 남동풍");
               else if("7".equals(a)) System.out.println(" 남남동풍");
               else if("8".equals(a)) System.out.println(" 남풍");
               else if("9".equals(a)) System.out.println(" 남남서풍");
               else if("10".equals(a)) System.out.println(" 남서풍");
               else if("11".equals(a)) System.out.println(" 서남서풍");
               else if("12".equals(a)) System.out.println(" 서풍");
               else if("13".equals(a)) System.out.println(" 서북서풍");
               else if("14".equals(a)) System.out.println(" 북서풍");
               else if("15".equals(a)) System.out.println(" 북북서풍");
               else if("16".equals(a)) System.out.println(" 북풍");
               
            }else if("WSD".equals(category)) {
               System.out.println(" 풍속 -> " + arr.getJSONObject(i).getString("fcstValue") + "m/s");
            }
        }
	      return output;
	}
}
