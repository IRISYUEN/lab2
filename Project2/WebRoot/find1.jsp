<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'find1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1>book</h1>
    <table border="1">
    <%ArrayList<String>find_list=(ArrayList<String>)  session.getAttribute("find_list"); %>
    <tr>
    <th>ISBN</th>
    <th>Title</th>
    <th>AuthorID</th>
    <th>Publisher</th>
    <th>PublishDate</th>
    <th>Price</th>
    </tr>
  <tr>
  <td><%=(String)find_list.get(0)%></td>
  <td><%=(String)find_list.get(1)%></td>
  <td><%=(String)find_list.get(2)%></td>
  <td><%=(String)find_list.get(3)%></td>
  <td><%=(String)find_list.get(4)%></td>
  <td><%=(String)find_list.get(5)%></td>
  </tr>
  
    </table>
    <h1>author</h1>
    <table border="1">
    <%ArrayList<String>find_list1=(ArrayList<String>)  session.getAttribute("find_list1"); %>
    <tr>
    <th>AuthorID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Country</th>
    </tr>
    
<tr>
  <td><%=(String)find_list1.get(0)%></td>
  <td><%=(String)find_list1.get(1)%></td>
  <td><%=(String)find_list1.get(2)%></td>
  <td><%=(String)find_list1.get(3)%></td>
  </tr>
    </table>
    <br>
    <button onclick="window.location='Main.jsp'">Back</button>
  </body>
</html>
