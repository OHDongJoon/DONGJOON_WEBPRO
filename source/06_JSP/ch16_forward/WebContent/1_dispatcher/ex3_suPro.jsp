<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
<%
  int su = Integer.parseInt(request.getParameter("su"));
  int sum =  0;
  for(int i=1 ; i <= su; i++){
	  sum += i;
  }// 여기 스크립트릿은 process
%> 
  <h2>1부터 <%=su %>까지 누적합은 <%=sum %>입니다</h2> <!-- view 단  -->
</body>
</html>