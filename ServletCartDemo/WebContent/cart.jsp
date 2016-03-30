<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entity.Cart" %>
<%@ page import="entity.Items" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style1.css" />
    <script language="javascript">
	    function delcfm() {
	        if (!confirm("Are you sure?")) {
	            window.event.returnValue = false;
	        }
	    }
   </script>
</head>
<body>
<h1>My Cart</h1>
   <a href="index.jsp">Home Page</a> >> <a href="index.jsp">Items List</a>
   <hr> 
   <div id="shopping">
   <form action="" method="">		
			<table>
				<tr>
					<th>Item</th>
					<th>Price</th>
					<th>Total</th>
					<th>Amount</th>
					<th>Operation</th>
				</tr>
				<% 
				   //to see whether cart obj exists in session
				   if(request.getSession().getAttribute("cart")!=null)
				   {
				%>
				<!-- loop start -->
				     <% 
				         Cart cart = (Cart)request.getSession().getAttribute("cart");
				         HashMap<Items,Integer> goods = cart.getGoods();
				         Set<Items> items = goods.keySet();
				         Iterator<Items> it = items.iterator();
				         
				         while(it.hasNext())
				         {
				            Items i = it.next();
				     %> 
				<tr name="products" id="product_id_1">
					<td class="thumb"><img src="images/<%=i.getPicture()%>" /><a href=""><%=i.getName()%></a></td>
					<td class="number"><%=i.getPrice() %></td>
					<td class="price" id="price_id_1">
						<span><%=i.getPrice()*goods.get(i) %></span>
						<input type="hidden" value="" />
					</td>
					<td class="number">
                     	<%=goods.get(i)%>					
					</td>                        
                    <td class="delete">
					  <a href="servlet/CartServlet?action=delete&id=<%=i.getId()%>" onclick="delcfm();">delete</a>					                  
					</td>
				</tr>
				     <% 
				         }
				     %>
				<!--end of loop-->
				
			</table>
			 <div class="total"><span id="total">total: <%=cart.getTotalPrice() %>$</span></div>
			  <% 
			    }
			 %>
			<div class="button"><input type="submit" value="" /></div>
		</form>
	</div>
</body>
</html>