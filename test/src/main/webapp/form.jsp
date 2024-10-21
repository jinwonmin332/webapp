<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./top.jsp" %>
<section>
	<div id=title>
	<br>
	<font size=5>홈쇼핑 회원 등록</font>
	<br><br>
	</div>
	<form action=form_ok.jsp method="GET">
	<table id=table1>
	<tr>
		<td>회원정보(자동발생)</td>
		<td><input type="text" name="custno" size=10 /></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" size=10 /></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" /></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" size=40 /></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" /></td>
		</tr>
		<tr>
			<td>고객등급</td>
			<td><input type="text" name="grade" size=3 /></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" size=3/></td>
		</tr>
		<tr>
			<td colspan=2 align="center"><input type="submit" value="등 록"/>&emsp;&emsp;
						<input type="button" value="조 회" /></td>
		</tr>
		
			
	</table>
	</form>
</section>
<%@ include file="./bottom.jsp"%>
