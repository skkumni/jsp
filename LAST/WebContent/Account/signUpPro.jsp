<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<jsp:useBean id="input" class="model.dto.AccountDTO"/>
	<jsp:setProperty property="*" name="input"/>
	
	<jsp:useBean id="dao" class="model.AccountDAO"/>
	<c:set var="row" value="${dao.insert(input) }"/>

	<script>
		var row = ${row };

		if (row) {
			alert('가입을 환영합니다~');
			location.href = '${cpath }/home.jsp';
		}
		else {
			alert('이미 사용중인 계정 입니다');
			history.go(-1);
		}
	</script>

</body>
</html>