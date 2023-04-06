<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<c:if test="${empty user }">
		<c:redirect url="/Account/login.jsp"/>
	</c:if>

	<article class="bContents">
		<form action="writePro.jsp" method="POST">
			<table>
				<tr>
					<td>
						<input name="title" placeholder="제목" required>
					</td>
				</tr>
				
				<tr>
					<td>
						<textarea name="contents" placeholder="내용을 입력하세요" required></textarea>
					</td>
				</tr>
			</table>
			<br>
			
			<input name="writer" type="hidden" value="${user.nick }">
			
			<button>작성</button>
		</form>
	</article>

<%@ include file="../footer.jsp" %>