<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<fieldset class="inputForm">
		<legend>로그인 폼</legend>
	
		<form action="loginPro.jsp" method="POST">
			<input name="userid" placeholder="ID" required>
			<input name="userpw" type="password" placeholder="PW" required>
			
			<button>Login</button>
		</form>
	</fieldset>

<%@ include file="../footer.jsp" %>