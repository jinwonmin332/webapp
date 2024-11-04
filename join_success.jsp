<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>

<h2>회원가입을 축하합니다!</h2>
<p>성공적으로 회원가입이 완료되었습니다. 아래는 회원님의 정보입니다:</p>

<p>아이디: <%= session.getAttribute("id") %></p>
<p>이름: <%= session.getAttribute("name") %></p>
<p>전화번호: <%= session.getAttribute("phone") %></p>
<p>성별: <%= session.getAttribute("gender") %></p>

<a href="login.jsp">로그인하기</a>

<%
    session.removeAttribute("id");
    session.removeAttribute("name");
    session.removeAttribute("phone");
    session.removeAttribute("gender");
%>

</body>
</html>
