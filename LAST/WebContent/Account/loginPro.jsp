<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<%-- 1. 사용자가 전달한 파라미터 받기 --%>
	<jsp:useBean id="input" class="model.dto.AccountDTO"/>
	<jsp:setProperty property="*" name="input"/>

	<%-- 2. DAO객체 생성 후 필요한 메서드 실행 --%>
	<jsp:useBean id="dao" class="model.AccountDAO"/>
	<c:set var="user" value="${dao.selectOne(input) }" scope="session"/>

	<%-- 로그인 성공 -> 1, 실패 -> 0 --%>
	<c:set var="success" value="${empty user ? 0 : 1 }"/>

	<script>
		var success = ${success };
		
		if (success) {
			alert('로그인을 환영합니다');
			location.href = '${cpath }/home.jsp';
		}
		else {
			alert('계정을 다시 확인해 주세요');
			history.go(-1);
		}
	</script>

</body>
</html>