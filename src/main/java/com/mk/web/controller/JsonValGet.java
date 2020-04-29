package com.mk.web.controller;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONObject;

public class JsonValGet {
	public static void main(String[] args) {
		jsonTest();
	}
	
	private static String factorial(String json) {
		
		String firstText = json.substring(0,1);
		String lastText = json.substring(json.length()-1,json.length());
		
		if(firstText.equals("{") && lastText.equals("}")) {
			
			JSONObject obj = new JSONObject(json);
			
			//key 값 갖고옴
			Iterator key = obj.keys();
			
			ArrayList<String> keyList = new ArrayList<String>();
			
			while(key.hasNext()) {
				String keyVal = key.next().toString();
				keyList.add(keyVal);
			}
			
			String jsonVal = "";
			
			// key 값이 1개 이상일 경우 value 값 추출 로직으로 이동
			if(keyList.size() >= 1) {
				// key 값 갯수만큼 for문 이동 (i번째 key값으로 해당 val 값 추출)
				for(int i = 1; i<keyList.size(); i++) {
					
					System.out.println(keyList.get(i)); // key값 추출
					
					// value 값 추출
					// 01. value 타입을 가져온다??? { } / [ ] / " "
					
					jsonVal = obj.getJSONObject(keyList.get(i)).getString(jsonVal);
					
					// value 가 일반데이터일 경우 / 배열일 경우 / 리스트일 경우로 나뉜다
					
					if(1==1) {
						//리스트일 경우
					} else if(2==2) {
						//배열일 경우
					} else if(3==3) {
						// 일반데이터일 경우
					}
				}
			}
			return factorial(jsonVal);
		} else {
			return json;
		}
	}
	
	private static void jsonTest() {
		String json01 = "";

		ArrayList<String> jsonList = new ArrayList<String>();
		
		jsonList.add(json01);
		
		for(int i = 0; i<jsonList.size(); i++) {
			factorial(jsonList.get(i));
		}
				
	}
}
