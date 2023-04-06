<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<fieldset class="inputForm">
		<legend>가입 폼</legend>
	
		<form action="signUpPro.jsp" method="POST">
			<input name="userid" placeholder="ID" required>
			<input name="userpw" type="password" placeholder="PW" required>
			<input name="nick" placeholder="닉네임" required>
			<input name="email" type="email" placeholder="이메일" required>
			
			<button>join</button>
		</form>
	</fieldset>

<%@ include file="../footer.jsp" %>