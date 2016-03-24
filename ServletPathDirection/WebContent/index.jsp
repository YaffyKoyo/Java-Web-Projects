<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Servlet direction forward</h1>
<hr>
<!-- relative direction for helloservlet -->
<a href="servlet/HelloServlet">access helloServlet</a>
<!-- final direction for helloservlet, use path variable --><br>
<a href = "<%=path %>/servlet/HelloServlet">access HelloServlet using final dir</a><br>
<a href = "servlet/TestServlet">access TestServlet to test.jsp</a>
</body>
</html>