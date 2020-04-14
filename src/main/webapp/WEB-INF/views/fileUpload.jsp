<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<%@ include file="common/header.jsp" %>
<body>
	<form action="fileUpload.do" method="post" enctype="mutipart/form-data">
		이름 : <input type="text" name="m_name"><br>
		별명 : <input type="text" name="m_nickname"><br>
		사진 : <input type="file" name="m_file"><br>
		
		<input type="submit" value="전송">
	</form>
</body>
<%@ include file="common/footer.jsp" %>
</html>
