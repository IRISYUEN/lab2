<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Add.jsp' starting page</title>
    
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
 
    <form action="add.action" method="post" name="addform"  onSubmit="javascript:alert('success')">
    <label style="width: 80px; display:inline-block;">ISBN  </label>
    <input  type="text" name="book.ISBN" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block;">Title</label>
    <input type="text" name="book.Title" style="width: 426px; "> <br><br>
    <label style="width: 80px; display:inline-block; ">AuthorID</label>
    <input type="text" name="book.AuthorID" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block; ">Publisher</label>
    <input type="text" name="book.Publisher" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block; ">PublishDate</label>
    <input type="text" name="book.PublishDate" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block; ">Price</label>
    <input type="text" name="book.Price" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block; ">Name</label>
    <input type="text" name="author.Name" id="name" style="width: 426px;"><br><br>
    <label style="width: 80px; display:inline-block; ">Age</label>
    <input  type="text" name="author.Age" style="width: 426px; "><br><br>
    <label style="width: 80px; display:inline-block; ">Country</label>
    <input type="text" name="author.Country" style="width: 426px; "><br><br>
    <input type="submit" value="Submit" style="width: 681px; ">
    </form>
 
    <button onclick="window.location='Main.jsp'" style="width: 681px; ">Back</button>
  </body>
</html>
