<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 검색</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function jusoSearch(){
		
		if(!checkSearchedWord(document.juso.keyword)){
			return;
		}
		 $.ajax({
			url : "jusoSearch.do",
			method : "post",
			dataType : "json",
			data : $("#juso").serialize(),
			success : function(jsonStr){
				var errCode = jsonStr.results.common.errorCode;
				var errDesc = jsonStr.results.common.errorMessage;
				var currentPage = jsonStr.results.common.currentPage;

				$("#tfoot").html(currentPage);
				
				if(errCode != "0"){
					alert(errCode+" = "+errDesc);
				}else if(jsonStr != null){
					
					var htmlStr = "";
					var jusoArr = jsonStr.results.juso;
					$.each(jusoArr,function(i, juso){
						htmlStr += "<tr>";
						htmlStr += "<td>"+juso.roadAddr+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.roadAddrPart1+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.roadAddrPart2+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.jibunAddr+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.engAddr+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.zipNo+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.admCd+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.rnMgtSn+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.bdMgtSn+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.detBdNmList +"</td>";
						htmlStr += "<td style='display: none;'>"+juso.bdNm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.bdKdcd+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.siNm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.sggNm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.emdNm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.liNm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.rn+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.udrtYn+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.buldMnnm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.buldSlno+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.mtYn+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.lnbrMnnm+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.lnbrSlno+"</td>";
						htmlStr += "<td style='display: none;'>"+juso.emdNo+"</td>";
						htmlStr += "<tr>";
					});
					$("#tbody").html(htmlStr);
				}
			},
			error : function(xhr,status, error){
				alert("에러 발생");
			}
		
		}); 
	}
	
	function checkSearchedWord(keyword){
		if(keyword.value.length >0 ){
			var expText = /[%=><]/;

			if(expText.test(keyword.value) == true){
				alert("특수문자를 입력 할수 없습니다.");
				keyword.value.split(expText).join("");
				return false;
			}

			var sqlArray = new Array(
					"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", 
					"EXEC", "UNION", "FETCH", "DECLARE", "TRUNCATE"
					);

			var regex;
			for(var i = 0; i<sqlArray.length; i++){

				regex = new RegExp(sqlArray[i],"gi");

				if(regex.test(keyword.value)){
					alert("\""+sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
					keyword.value = keyword.value.replace(regex,"");
					return false;
				}
			}
		}
		return true;
	}

	$("#keyword").keypress(function(e){
		if(e.keyCode ==13){
			jusoSearch();
		}
	});
	
</script>
</head>
<%-- <%@ include file="common/header.jsp" %> --%>
<body>

	<form name="juso" id="juso" action="" method="post">
		<input type="hidden" name="currentPage" id="currentPage" value="1"/>
		<input type="hidden" name="countPerPage" id="countPerPage" value="10"/>
		<input type="hidden" name="resultType" id="resultType" value="json"/>
		<input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE2MDUyMzE3MDgzNTEyNTA2"/>
		주소 검색 : <input type="text" name="keyword" id="keyword"/>
		<input type="button" value="검색" onclick="jusoSearch();">
	</form>
	<div>주소를 검색해주세요.</div>
	<table border="1">
		<caption>도로명 주소 API TEST</caption>
		<thead>
			<tr>
				<th>전체 도로명 주소</th>
				<th style="display: none;">도로명 주소(참고항목 제외)</th>
				<th style="display: none;">도로명 주소 참고항목</th>
				<th style="display: none;">지번 정보</th>
				<th style="display: none;">도로명주소(영문)</th>
				<th style="display: none;">우편번호</th>
				<th style="display: none;">행정구역코드</th>
				<th style="display: none;">도로명코드</th>
				<th style="display: none;">건물관리번호</th>
				<th style="display: none;">상세건물명</th>
				<th style="display: none;">건물명</th>
				<th style="display: none;">공동주택여부</th>
				<th style="display: none;">시도명</th>
				<th style="display: none;">시군구명</th>
				<th style="display: none;">읍면동명</th>
				<th style="display: none;">법정리명</th>
				<th style="display: none;">도로명</th>
				<th style="display: none;">지하여부</th>
				<th style="display: none;">건물본번</th>
				<th style="display: none;">건물본번(부번이 없는 경우 0)</th>
				<th style="display: none;">산여부(0:대지, 1:산)</th>
				<th style="display: none;">지번본번(번지)</th>
				<th style="display: none;">지번부번(호)(부번이 없는 경우 0)</th>
				<th style="display: none;">읍면동 일련번호</th>
			</tr>
		</thead>
		<tbody id="tbody">	
			
		</tbody>
		<tfoot id="tfoot">
		
		</tfoot>	
	
	
	</table>
	
</body>
<%@ include file="common/footer.jsp" %>
</html>