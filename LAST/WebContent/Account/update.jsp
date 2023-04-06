<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<jsp:useBean id="input" class="model.dto.AccountDTO"/>
	<jsp:setProperty property="*" name="input"/>

	<jsp:useBean id="dao" class="model.AccountDAO"/>
	<c:set var="row" value="${dao.update(input) }"/>

	<script>
		var row = ${row };
		
		if (row) {
			alert('변경이 완료되었습니다');
			location.href = 'logout.jsp';
		}
		else {
			alert('수정 실패. 부적절한 접근입니다');
			history.go(-1);
		}
	</script>

</body>
</html>