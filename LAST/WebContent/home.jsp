<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<jsp:useBean id="dao" class="model.BoardDAO"/>
	<c:set var="reqPage" value="${empty param.reqPage ? 1 : param.reqPage }"/>
	<c:set var="map" value="${dao.selectAll(reqPage) }"/>
	<c:set var="list" value="${map['list'] }"/>
	<c:set var="pg" value="${map['pg'] }"/>
	
	
	<main>
		<article>
			<img src="${cpath }/img/back.png" width="100%">
		</article>
		
		<article class="board">
			<table>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				
				<c:forEach var="row" items="${list }">
				<tr>
					<td>${row.idx }</td>
					<td class="title">
						<a href="${cpath }/Board/view.jsp?idx=${row.idx }">
							${row.title }
						</a>
					</td>
					<td>${row.writer }</td>
					<td>${row.view_count }</td>
					<td>${row.write_date }</td>
				</tr>
				</c:forEach>
			</table>
			
			<a href="${cpath }/Board/write.jsp">
				<button>글작성</button>
			</a>
			
			<nav class="page">
				<ul>
					<c:if test="${pg.prev }">
					<li>
						<a href="${cpath }/home.jsp?reqPage=${pg.begin - 1}">이전</a>
					</li>
					</c:if>
				
					<c:forEach var="i" begin="${pg.begin }" end="${pg.end }">
					<li><a href="${cpath }/home.jsp?reqPage=${i }">${i }</a></li>
					</c:forEach>
					
					<c:if test="${pg.next }">
					<li>
						<a href="${cpath }/home.jsp?reqPage=${pg.end + 1}">다음</a>
					</li>
					</c:if>
				</ul>
			</nav>
			
			<div class="search">
				<form>
					<select name="type">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="contents">내용</option>
					</select>
					
					<input name="search">
					
					<button>검색</button>
				</form>
			</div>
		</article>
	</main>
	
<%@ include file="footer.jsp" %>