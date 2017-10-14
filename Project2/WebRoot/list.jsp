<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="Menu.Book" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
request.setCharacterEncoding("UTF-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>database system</title>
  </head>
  <body>
  <form action="author.action">
  <input type="text" name="authorname" style="width: 709px; height: 33px"><br><br>
  <input type="submit" value="go" style="width: 46px; height: 33px" onclick="window.location='author.jsp'">
  </form>
  <h1>book</h1>
  <%
   //ArrayList<Book>list=(ArrayList<Book>)  session.getAttribute("list");
   request.getAttribute("list");
   ArrayList<String>list1=(ArrayList<String>)  session.getAttribute("author_list");
   List<String> num=new ArrayList<String>();
   num.add("1");
   num.add("2");
     %>
 
  <table border="1">
  <tr>
  <th>ISBN</th>
			<th>Title</th>
			<th>AuthorID</th>
			<th>Publisher</th>
			<th>PublishDate</th>
			<th>Price</th>
			<th>Operation</th>
			<th>Update</th>
  </tr>

 <s:iterator value="#request.list" id="list">
 
  <form action="update.action" onSubmit="javascript:alert('success')" >  
  
  
  <tr>
  <td><input name="book.ISBN" readonly="readonly" value="<s:property value="ISBN" />" style="background:none; border:0" type="text"></td>
  <td><a href="find.jsp?id=<s:property value="Title" />"><s:property value="Title" /></a></td>
  <td><input name="book.AuthorID" value=<s:property value="AuthorID" /> style="background:none; border:0"></td>
  <td><input name="book.Publisher" value=<s:property value="Publisher" /> style="background:none; border:0"></td>
  <td><input name="book.PublishDate" value=<s:property value="PublishDate" /> style="background:none; border:0"></td>
  <td><input name="book.Price" value=<s:property value="Price" /> style="background:none; border:0"></td>
  <td><a href="delete.jsp?id=<s:property value="Price" />">delete</a></td>
  <td><input type="submit" class="btn btn-default" value="update" ></td>
  </tr>
 
   </form>
   </s:iterator>
 </table>
  <br>
  <h1>author</h1>
  <table border=1 style=width:100%>
  <tr>
  <th>AuthorID</th>
  <th>Name</th>
  <th>Age</th>
  <th>Country</th>
  </tr>
  <%!  int i=1; %>
  <% 
  for(i=0;i<list1.size();i++){ %>
  <tr>
  <td><%=(String)list1.get(i++)%></td>
  <td><%=(String)list1.get(i++)%></td>
  <td><%=(String)list1.get(i++)%></td>
  <td><%=(String)list1.get(i)%></td>
  </tr>
  <%
  }
   %>
  </table>
  <br>
  <button onclick="window.location='Main.jsp'">Back to Menu</button>
  </body>
</html>
