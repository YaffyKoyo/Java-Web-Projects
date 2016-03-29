<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="entity.Items"%>
<%@ page import="dao.ItemsDAO"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<base href="<%=basePath%>">
<title>Insert title here</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
function selflog_show(id){
	var num = document.getElementById("number").value;
	J.dialog.get({id:'haoyue_creat',titile:'buying successed',width:600,height:400,link:'<%=path%>/servlet/CartServlet?id=' + id + '&num=' + num+ '&action=add',cover : true});
	}
	function add() {
		var num = parseInt(document.getElementById("number").value);
		if (num < 100) {
			document.getElementById("number").value = ++num;
		}
	}
	function sub() {
		var num = parseInt(document.getElementById("number").value);
		if (num > 1) {
			document.getElementById("number").value = --num;
		}
	}
</script>

<style type="text/css">
hr {
	border-color: FF7FF00;
}

img.buttons{
	max-height: 50px;

}

div {
	float: left;
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
}

div dd {
	margin: 0px;
	font-size: 10pt;
}

div dd.dd_name {
	color: blue;
}

div dd.dd_city {
	color: #000;
}
</style>

</head>
<body>
	<h1>Item Details</h1>
	<hr>
	<center>
		<table width="750" height="60" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<!-- Item details -->
				<%
					ItemsDAO itemDao = new ItemsDAO();
					Items item = itemDao.getItemsById(Integer.parseInt(request.getParameter("id")));
					if (item != null) {
				%>
				<td width="70%" valign="top">
					<table>
						<tr>
							<td rowspan="4"><img src="images/<%=item.getPicture()%>"
								width="200" height="160" /></td>
						</tr>
						<tr>
							<td><B><%=item.getName()%></B></td>
						</tr>
						<tr>
							<td>City: <%=item.getCity()%></td>
						</tr>
						<tr>
							<td>Price: <%=item.getPrice()%>$
							</td>
						</tr>
						<tr>
						<td>number:<span id="sub" onclick="sub();">-</span>
						<input type="text" id="number" name = "number" value="1" size="2"/>
						<span id="add" onclick="add();">+</span></td>
						</tr>
					</table>
					<div id="cart">
						<img class = "buttons" src="images/buy_now.png">
						<a href="javascript:selflog_show(<%=item.getId()%>)"><img class = "buttons" src="images/add_to_cart.png"></a>
						<a href="servlet/CartServlet?action=show"><img class = "buttons" src="images/view_cart.jpg"></a>						
					</div>
				</td>
				<%
					}
				%>
				<%
					String list = "";
					//get cookies' set from client
					Cookie[] cookies = request.getCookies();
					//go throught the cookies' set
					if (cookies != null && cookies.length > 0) {
						for (Cookie c : cookies) {
							if (c.getName().equals("ListViewCookie")) {
								list = c.getValue();
							}
						}
					}

					list += request.getParameter("id") + ",";
					//set to zero if up to 1000
					String[] arr = list.split(",");
					if (arr != null && arr.length > 0) {
						if (arr.length >= 1000) {
							list = "";
						}
					}
					Cookie cookie = new Cookie("ListViewCookie", list);
					response.addCookie(cookie);
				%>
				<!-- recently viewed -->
				<%-- <td width="30%" bgcolor="#EEE" align="center"><br> <b>recently
						viewed</b><br> <!-- start loop --> <%
 	ArrayList<Items> itemlist = itemDao.getViewList(list);
 	if (itemlist != null && itemlist.size() > 0) {
 		System.out.println("itemlist.size=" + itemlist.size());
 		for (Items i : itemlist) {
 %>
					<div>
						<dl>
							<dt>
								<a href="details.jsp?id=<%=i.getId()%>"><img
									src="images/<%=i.getPicture()%>" width="120" height="90"
									border="1" /></a>
							</dt>
							<dd class="dd_name"><%=i.getName()%></dd>
							<dd class="dd_city">
								City:<%=i.getCity()%>&nbsp;&nbsp;Price:<%=i.getPrice()%>
								$
							</dd>
						</dl>
					</div> <%
 	}
 	}
 %> <!-- end of loop --></td> --%>
			</tr>
		</table>
	</center>
</body>
</html>