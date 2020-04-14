package com.mk.web.dto;

import java.util.ArrayList;

public class JusoDTO {

	//개별부
	private ArrayList jusoArr = new ArrayList();
	
	// 입력값	
	private String confmKey;		// api 사용을 위한 key
	private String currentPage;		// 현재 페이지 번호
	private String countPerPage;	// 1페이지에 보여질 갯수
	private String keyword;			// 검색값
	private String resultType;		// 결과 타입(json,xml...)
	
	//출력값 공통
	private String errorMessage;
	//private String countPerPage;
	private String errorCode;
	private String totalCount;
	//private String currentPage;
	
	//출력값 개별
	private String roadAddr;
	private String roadAddrPart1;
	private String roadAddrPart2;
	private String jibunAddr;
	private String engAddr;
	private String zipNo;
	private String admCd;
	private String rnMgtSn;
	private String bdMgtSn;
	private String detBdNmList;
	private String bdNm;
	private String bdKdcd;
	private String siNm;
	private String sggNm;
	private String emdNm;
	private String liNm;
	private String rn;
	private String udrtYn;
	private String buldMnnm;
	private String buldSlno;
	private String mtYn;
	private String lnbrMnnm;
	private String lnbrSlno;
	private String emdNo;
	
	
	public ArrayList getJusoArr() {
		return jusoArr;
	}
	public void setJusoArr(ArrayList jusoArr) {
		this.jusoArr = jusoArr;
	}
	public String getConfmKey() {
		return confmKey;
	}
	public void setConfmKey(String confmKey) {
		this.confmKey = confmKey;
	}
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	public String getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(String countPerPage) {
		this.countPerPage = countPerPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getResultType() {
		return resultType;
	}
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getRoadAddrPart2() {
		return roadAddrPart2;
	}
	public void setRoadAddrPart2(String roadAddrPart2) {
		this.roadAddrPart2 = roadAddrPart2;
	}
	public String getJibunAddr() {
		return jibunAddr;
	}
	public void setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
	}
	public String getEngAddr() {
		return engAddr;
	}
	public void setEngAddr(String engAddr) {
		this.engAddr = engAddr;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getAdmCd() {
		return admCd;
	}
	public void setAdmCd(String admCd) {
		this.admCd = admCd;
	}
	public String getRnMgtSn() {
		return rnMgtSn;
	}
	public void setRnMgtSn(String rnMgtSn) {
		this.rnMgtSn = rnMgtSn;
	}
	public String getBdMgtSn() {
		return bdMgtSn;
	}
	public void setBdMgtSn(String bdMgtSn) {
		this.bdMgtSn = bdMgtSn;
	}
	public String getDetBdNmList() {
		return detBdNmList;
	}
	public void setDetBdNmList(String detBdNmList) {
		this.detBdNmList = detBdNmList;
	}
	public String getBdNm() {
		return bdNm;
	}
	public void setBdNm(String bdNm) {
		this.bdNm = bdNm;
	}
	public String getBdKdcd() {
		return bdKdcd;
	}
	public void setBdKdcd(String bdKdcd) {
		this.bdKdcd = bdKdcd;
	}
	public String getSiNm() {
		return siNm;
	}
	public void setSiNm(String siNm) {
		this.siNm = siNm;
	}
	public String getSggNm() {
		return sggNm;
	}
	public void setSggNm(String sggNm) {
		this.sggNm = sggNm;
	}
	public String getEmdNm() {
		return emdNm;
	}
	public void setEmdNm(String emdNm) {
		this.emdNm = emdNm;
	}
	public String getLiNm() {
		return liNm;
	}
	public void setLiNm(String liNm) {
		this.liNm = liNm;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getUdrtYn() {
		return udrtYn;
	}
	public void setUdrtYn(String udrtYn) {
		this.udrtYn = udrtYn;
	}
	public String getBuldMnnm() {
		return buldMnnm;
	}
	public void setBuldMnnm(String buldMnnm) {
		this.buldMnnm = buldMnnm;
	}
	public String getBuldSlno() {
		return buldSlno;
	}
	public void setBuldSlno(String buldSlno) {
		this.buldSlno = buldSlno;
	}
	public String getMtYn() {
		return mtYn;
	}
	public void setMtYn(String mtYn) {
		this.mtYn = mtYn;
	}
	public String getLnbrMnnm() {
		return lnbrMnnm;
	}
	public void setLnbrMnnm(String lnbrMnnm) {
		this.lnbrMnnm = lnbrMnnm;
	}
	public String getLnbrSlno() {
		return lnbrSlno;
	}
	public void setLnbrSlno(String lnbrSlno) {
		this.lnbrSlno = lnbrSlno;
	}
	public String getEmdNo() {
		return emdNo;
	}
	public void setEmdNo(String emdNo) {
		this.emdNo = emdNo;
	}
	
	
	
	
}
