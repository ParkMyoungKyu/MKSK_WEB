package com.mk.web.dto;

public class WeatherDTO {
	//입력값(request)
	private String serviceKey;	// 인증키
	private String numOfRows;	// 한 페이지 결과수
	private String pageNo;		// 페이지 번호
	private String dataType;	// 응답자료형식
	private String base_date;	// 발표일자
	private String base_time;	// 발표시간
	private String nx;			// 예보지점 X 좌표
	private String ny;			// 예보지점 Y 좌표
	
	// 출력값(response)
	// private String numOfRows;   // 한페이지 결과수
	// private String pageNo;  	   // 페이지 번호
	private String totalCount;	   // 데이터 총 개수
	private String resultCode;     // 응답메시지 코드
	private String resultMsg;  	   // 응답메시지 내용
	//private String dataType;     // 데이터 타입
	private String baseDate;       // 발표일자
	private String baseTime;       // 발표시각
	private String fcstDate;       // 예보일자
	private String fcstTime;       // 예보시각
	private String category;       // 자료구분 문자
	private String fcstValue;      // 예보 값
	//private String nx;           // 예보지점 y 좌표
	//private String ny;           // 예보지점 X 좌표
	
	
	
	
	public String getServiceKey() {
		return serviceKey;
	}
	public void setServiceKey(String serviceKey) {
		this.serviceKey = serviceKey;
	}
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getBase_date() {
		return base_date;
	}
	public void setBase_date(String base_date) {
		this.base_date = base_date;
	}
	public String getBase_time() {
		return base_time;
	}
	public void setBase_time(String base_time) {
		this.base_time = base_time;
	}
	public String getNx() {
		return nx;
	}
	public void setNx(String nx) {
		this.nx = nx;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public String getBaseDate() {
		return baseDate;
	}
	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}
	public String getBaseTime() {
		return baseTime;
	}
	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}
	public String getFcstDate() {
		return fcstDate;
	}
	public void setFcstDate(String fcstDate) {
		this.fcstDate = fcstDate;
	}
	public String getFcstTime() {
		return fcstTime;
	}
	public void setFcstTime(String fcstTime) {
		this.fcstTime = fcstTime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFcstValue() {
		return fcstValue;
	}
	public void setFcstValue(String fcstValue) {
		this.fcstValue = fcstValue;
	}
	
	
	
	
	
	
	
	
}
