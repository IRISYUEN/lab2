<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete.jsp' starting page</title>
    
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
  <h1>Are you sure you wanna delete this note?</h1>
<%String str = request.getParameter("id");   %>
   <form id="delete" action="delete.action" method="post" style="width: 100px; "  onSubmit="javascript:alert('success')">
   <input type ="hidden" name="id" value=<%=str%>>
    <input type="submit" value="Yes" style="width: 53px; ">   
   </form><button onclick="window.location='Main.jsp'" style="width: 79px; ">Back</button>
   
   </body>
</html>
