<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서버페이지</title>
</head>
<body>
<%
try {
String driver="oracle.jdbc.driver.OracleDriver";  //대소문자 기억!
Class.forName(driver);  //클래스명을 집어넣어주면 자동으로 객체를 만들어주는 함수.
String url="jdbc:oracle:thin:@172.30.1.20:1521:xe";  //sql의 포트번호와 SID적기
String userName="hr";  
String passWord="hr"; 
Connection conn = DriverManager.getConnection(url , userName , passWord);
PreparedStatement psmt = null;
Statement st = conn.createStatement();
//아이디와 충전금액 받아오기
String m_id = request.getParameter("name");
int money = Integer.parseInt(request.getParameter("money"));
int cash = 0;
int com = 0;
int cnt = 0;

//DB에 데이터 넣기
String sql1="select m_point from t_member where m_id = ?"; //명령문 추가할 때 마다 변수명을 달리해줘야한다!
psmt = conn.prepareStatement(sql1);
psmt.setString(1, m_id);
ResultSet rs = psmt.executeQuery();
while(rs.next()){
    cash = rs.getInt(1);
	System.out.println("보유금액 : "+cash);
}

String sql2 = "UPDATE t_member set m_point = ? where m_id = ? ";
psmt = conn.prepareStatement(sql2);
com = cash + money ;
psmt.setInt(1, com);
psmt.setString(2, m_id);
cnt = psmt.executeUpdate();
if (cnt > 0) {
	System.out.println("변화금액 : " + com);
}else{
	System.out.println("충전실패");
}
conn.close();
st.close();

} catch (Exception e) {
          System.out.println(e);
}
%>

</body>
</html>





