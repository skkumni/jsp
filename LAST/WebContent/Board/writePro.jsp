<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<jsp:useBean id="input" class="model.dto.BoardDTO"/>
	<jsp:setProperty property="*" name="input"/>

	<jsp:useBean id="dao" class="model.BoardDAO"/>
	<c:set var="row" value="${dao.insert(input) }"/>

	<script>
		var row = ${row };

		if (row) {
			alert('작성이 완료 되었습니다~');
			location.href = '${cpath }/home.jsp';
		}
		else {
			alert('!!!작성 오류!!!');
			history.go(-1);
		}
	</script>

<%@ include file="../footer.jsp" %>