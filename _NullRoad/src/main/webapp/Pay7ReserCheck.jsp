<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
DAO dao = new DAO();
int resCheck = dao.PayReserCheck();
if (resCheck>=0){%>
<script type="text/javascript">
alert("예약이 만료되었습니다.")
</script>
<%} %>
</body>
</html>