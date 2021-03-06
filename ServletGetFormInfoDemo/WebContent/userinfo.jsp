<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
	 .title{
		 width: 30%;	
		 background-color: #CCC;
		 font-weight: bold;
	 }
	 .content{
	     width:70%;
	     background-color: #CBCFE5;
	 }
	 
   </style>  
  </head>
  
  <body>
    <h1>User information</h1>
    <hr>
    <center>
     <jsp:useBean  id="regUser" class="entity.Users" scope="session"/>   
     <table width="600" cellpadding="0" cellspacing="0" border="1">
        <tr>
          <td class="title">User Name：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="username"/></td>
        </tr>
        <tr>
          <td class="title">Password：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="mypassword"/></td>
        </tr>
        <tr>
          <td class="title">Gender：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="gender"/></td>
        </tr>
        <tr>
          <td class="title">E-mail：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="email"/></td>
        </tr>
        <tr>
          <td class="title">Birth Date：</td>
          <td class="content">&nbsp;
            <% 
               SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
               String date = sdf.format(regUser.getBirthday());
               
            %>
             <%=date%>
          </td>
        </tr>
        <tr>
          <td class="title">Hobby：</td>
          <td class="content">&nbsp;
            <% 
               String[] favorites = regUser.getFavorites();
               for(String f:favorites)
               {
            %>
                <%=f%> &nbsp;&nbsp;
            <% 
               }
            %>
          </td>
        </tr>
        <tr>
          <td class="title">Self Description：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="introduce"/></td>
        </tr>
        <tr>
          <td class="title">Whether introduced agreement：</td>
          <td class="content">&nbsp;<jsp:getProperty name="regUser" property="flag"/></td>
        </tr>
     </table>
    </center>
  </body>
</html>
