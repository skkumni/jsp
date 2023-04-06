<%@page import="model.dto.AccountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITBANK</title>

<link href="${cpath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="info">
		<c:if test="${not empty user }">
		${user.nick }님 | 
			<a href="${cpath }/Account/myPage.jsp">내정보</a>
		</c:if>
	</div>
	
	<header>
		<h1>ITBANK</h1>
		
		<nav class="menu">
			<ul>
				<li><a href="${cpath }/home.jsp">Home</a></li>
				<li>
					<a href="${cpath }/Account/${empty user ? 'login.jsp' : 'logout.jsp' }">
						${empty user ? 'Login' : 'Logout' }
					</a>
				</li>
				<li><a href="${cpath }/Account/signUp.jsp">SignUp</a></li>
			</ul>
		</nav>
	</header>