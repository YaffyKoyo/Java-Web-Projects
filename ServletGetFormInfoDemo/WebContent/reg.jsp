<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>My JSp 'reg.jsp' page</title>

<script type="text/javascript" src = "js/Calendar3.js"></script>

</head>
<body>
	<h1>User Register</h1>
	<hr>
	<form name="regForm" action="servlet/RegServlet" method="post">
		<table border="0" width="800" cellspacing="0" cellpadding="0">
			<tr>
			    	<td class="lalel">User Name: </td>
			    	<td class="controler"><input type="text" name="username" /></td>
			    </tr>
			    <tr>
			    	<td class="label">Password: </td>
			    	<td class="controler"><input type="password" name="mypassword" ></td>
			    	
			    </tr>
			    <tr>
			    	<td class="label">Confirm: </td>
			    	<td class="controler"><input type="password" name="confirmpass" ></td>
			    	
			    </tr>
			    <tr>
			    	<td class="label">Email:</td>
			    	<td class="controler"><input type="text" name="email" ></td>
			    	
			    </tr>
			    <tr>
			    	<td class="label">Gender: </td>
			    	<td class="controler"><input type="radio" name="gender" checked="checked" value="Male">male<input type="radio" name="gender" value="Female">female</td>
			    	
			    </tr>
			   
			    <tr>
			    	<td class="label">Birth Date: </td>
			    	<td class="controler">
			    	  <input name="birthday" type="text" id="control_date" size="10"
                      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" />
			    	</td>
			    </tr>
			    <tr>
			    	<td class="label">Hobby: </td>
			    	<td class="controler">
			    	<input type="checkbox" name="hobby" value="nba"> NBA &nbsp;
			    	  <input type="checkbox" name="hobby" value="music"> Music &nbsp;
			    	  <input type="checkbox" name="hobby" value="movie"> Movie &nbsp;
			    	  <input type="checkbox" name="hobby" value="internet"> Internet &nbsp;
			    	</td>
			    </tr>
			    <tr>
			    	<td class="label">Self Description：</td>
			    	<td class="controler">
			    		<textarea name="introduce" rows="10" cols="40"></textarea>
			    	</td>
			    </tr>
			    <tr>
			    	<td class="label">Policy Agreed：</td>
			    	<td class="controler">
			    		<input type="checkbox" name="isAccept" value="true">accept bully items
			    	</td>
			    </tr>
			    <tr>
			    	<td colspan="2" align="center">
			    		<input type="submit" value="submit"/>&nbsp;&nbsp;
			    	    <input type="reset" value="cancel"/>&nbsp;&nbsp;
			    	</td>
			    </tr>
		</table>
	</form>
</body>
</html>