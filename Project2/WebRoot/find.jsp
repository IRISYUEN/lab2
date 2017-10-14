<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'find.jsp' starting page</title>
    
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
    <h1>Are u sure to find?</h1>
    <%String str = request.getParameter("id");  
     %>
    
    <form action="find.action" method="post" style="width: 100px; ">
   <input type ="hidden" name="title" value=<%=str%>>
    <input type="submit" value="Yes" onclick="window.location='find1.jsp'" style="width: 650px; ">   
   </form><button onclick="window.location='Main.jsp'" style="width: 650px; ">Back</button>
    
  </body>
</html>
