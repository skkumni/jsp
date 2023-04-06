<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<hr>

	<form action="update.jsp" method="POST">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<th>회원번호</th>
				<td>${user.idx }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${user.userid }</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input name="userpw" type="password" required></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${user.nick }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input 	name="email" 
							type="email" 
							value="${user.email }" 
							required>
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${user.join_date }</td>
			</tr>
		</table>
		
		<input name="idx" type="hidden" value="${user.idx }">
	
		<br>
		<button>수정</button>
		
		<a href="delete.jsp?idx=${user.idx }">
			<button type="button">탈퇴</button>
		</a>
	</form>

</body>
</html>