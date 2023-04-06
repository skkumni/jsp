<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<jsp:useBean id="dao" class="model.BoardDAO"/>
	<c:set var="row" value="${dao.selectOne(param.idx) }"/>

	<article class="bContents">
		<table>
			<tr>
				<td colspan="6">${row.idx }. ${row.title }</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td>${row.writer }</td>
				<th>조회수</th>
				<td>${row.view_count }</td>
				<th>작성일</th>
				<td>${row.write_date }</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<pre>${row.contents }</pre>
				</td>
			</tr>
		</table>
		<br>
		
		<button>수정</button>
		<button>삭제</button>
		
	</article>

<%@ include file="../footer.jsp" %>