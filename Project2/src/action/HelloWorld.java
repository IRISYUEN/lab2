package action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;

import Menu.Book;
import Menu.User;
import Menu.Author;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorld extends ActionSupport{
	private static ResultSet rs;
	private static ResultSet rs1;
	private static Connection conn;
	private static Statement stmt;
	private String authorname;
	private String id;
	private User user;
	private Book book;
	private Author author;
	private List<Book> list=new ArrayList<Book>();
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
	public List<String> getAuthor_list() {
		return author_list;
	}
	public void setAuthor_list(List<String> author_list) {
		this.author_list = author_list;
	}
	private List<String> author_list=new ArrayList<String>();
	private List<String> author_name=new ArrayList<String>();
	private List<String> find_list=new ArrayList<String>();
	private List<String> find_list1=new ArrayList<String>();
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	private String title;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String ConnectDatabase(){
		String dbName="new_schema";
		String userName=user.getUsername();
		String userPasswd=user.getPassword();
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;  
		List<Book> list2=new ArrayList<Book>();
		List<String> list3=new ArrayList<String>();
		try{ 
		Class.forName(driver);   
		 conn=(Connection)DriverManager.getConnection(url);   
		 stmt = conn.createStatement();   
		 String sql = "select * from book"; 
		 String sql1="select * from author";
		 rs=stmt.executeQuery(sql);
		 
		 while(rs.next()){
			 Book book1=new Book();
			  book1.setISBN(rs.getString(1));
			  book1.setTitle(rs.getString(2));
			  book1.setAuthorID(rs.getString(3));
			  book1.setPublisher(rs.getString(4));
			  book1.setPublishDate(rs.getString(5));
			  book1.setPrice(rs.getString(6));
			  list2.add(book1);
		 }
		//ActionContext.getContext().put("list2", new BookDAO().getBookList());
		 rs1=stmt.executeQuery(sql1);
		 while(rs1.next()){
			  list3.add(rs1.getString(1));
			  list3.add(rs1.getString(2));
			  list3.add(rs1.getString(3));
			  list3.add(rs1.getString(4));
		 }
		}
		catch (SQLException e) {
	        e.printStackTrace();
	        conn=null;
	    }catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        conn=null;
	    }
		this.list=list2;
		this.author_list=list3;
		ServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("list",list);
		HttpServletRequest req=(HttpServletRequest) request;
		HttpSession session=req.getSession();
		//session.setAttribute("list",list);
		session.setAttribute("author_list",author_list);
		return SUCCESS;
	}
	public String Delete(){
		String sql="delete from book where Price = "+id;
		try{
		 int flag= stmt.executeUpdate(sql);  
		 /*if(flag > 0)  
		   {  
		       System.out.println("success");  
		     
		   }  
		   else  
		   {  
		       System.out.println("error");  
		   }  */
		   stmt.close(); 
		}catch (SQLException e) {
	        e.printStackTrace();
	        conn=null;
	    }
		return SUCCESS;
	}
	public String Find(){
		String Author_ID=null;
		String sql="select * from book where Title = "+"'"+title+"'";
		try{
		 rs=stmt.executeQuery(sql);
		 List<String> find_list=new ArrayList<String>();
		 while(rs.next()){
			 find_list.add(rs.getString(1));
			 find_list.add(rs.getString(2));
			 find_list.add(rs.getString(3));
			 Author_ID=rs.getString(3);
			 find_list.add(rs.getString(4));
			 find_list.add(rs.getString(5));
			 find_list.add(rs.getString(6));
		 }
		// System.out.print(Author_ID);
		 String sql1="select * from author where AuthorID = "+Author_ID;
		 this.find_list=find_list;
		 rs1=stmt.executeQuery(sql1);
		 List<String> find_list1=new ArrayList<String>();
		 while(rs1.next()){
			 find_list1.add(rs1.getString(1));
			 find_list1.add(rs1.getString(2));
			 find_list1.add(rs1.getString(3));
			 find_list1.add(rs1.getString(4));
		 }
		 this.find_list1=find_list1;
		 ServletRequest request=ServletActionContext.getRequest();
		 HttpServletRequest req=(HttpServletRequest) request;
		 HttpSession session=req.getSession();
		 session.setAttribute("find_list",find_list);
		 session.setAttribute("find_list1",find_list1);
		}catch (SQLException e) {
	        e.printStackTrace();
	        conn=null;
	    }
		return SUCCESS;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String Author(){
		String sql="select * from author where Name = "+"'"+authorname+"'";
		try{
			rs=stmt.executeQuery(sql);
			String author_id=null;
			List<String>author_name=new ArrayList<String>();
			while(rs.next()){
			author_id=rs.getString(1);
			}
			//System.out.print(author_id);
			String sql1="select * from book where AuthorID = "+"'"+author_id+"'";
			rs1=stmt.executeQuery(sql1);
			while(rs1.next()){
				author_name.add(rs1.getString(2));
				//System.out.print(rs1.getString(2));
			}
			this.author_name=author_name;
			ServletRequest request=ServletActionContext.getRequest();
			HttpServletRequest req=(HttpServletRequest) request;
			HttpSession session=req.getSession();
			session.setAttribute("author_name",author_name);
		}catch(SQLException e){
			e.printStackTrace();
			conn=null;
		}
		return SUCCESS;
	}
	public String Add(){
		String ISBN="'"+book.getISBN()+"'";
		String Title="'"+book.getTitle()+"'";
		String AuthorID="'"+book.getAuthorID()+"'";
		String Publisher="'"+book.getPublisher()+"'";
		System.out.print(Publisher);
		String PublishDate="'"+book.getPublishDate()+"'";
		String Price="'"+book.getPrice()+"'";
		String Name="'"+author.getName()+"'";
		String Country="'"+author.getCountry()+"'";
		String Age="'"+author.getAge()+"'";
		//System.out.print(Age);
		String sql="select * from author where AuthorID ="+AuthorID;
		try{
			rs= stmt.executeQuery(sql); 
			if (!rs.next()){
				
				String sql1="INSERT INTO new_schema.author (AuthorID, Name, Age, Country) VALUES ("+AuthorID+","+ Name+","+ Age+","+ Country+")";
				int flag1=stmt.executeUpdate(sql1);
				/*if (flag1>0){
					System.out.print("author success!");
				}		*/
			}
			String sql2="INSERT INTO new_schema.book (ISBN, Title, AuthorID, Publisher,PublishDate,Price) "
					+ "VALUES ("+ISBN+","+ Title+","+ AuthorID+","+ Publisher+","+PublishDate+","+Price+")";
			int flag2=stmt.executeUpdate(sql2);
			/*if (flag2>0){
				System.out.print("book success!");
			}	*/
			}catch(SQLException e){
			e.printStackTrace();
			conn=null;
		}
		
		return SUCCESS;
		
	}
	public String update(){
		String ISBN="'"+book.getISBN()+"'";
		String AuthorID="'"+book.getAuthorID()+"'";
		String Publisher="'"+book.getPublisher()+"'";
		String PublishDate="'"+book.getPublishDate()+"'";
		String Price="'"+book.getPrice()+"'";
		String sql="UPDATE new_schema.book SET AuthorID="+AuthorID+",Publisher="+Publisher+",PublishDate="+
		PublishDate+",Price="+Price+" WHERE ISBN="+ISBN;
		try{
			int flag=stmt.executeUpdate(sql);
			if(flag>0){
				System.out.print("success");
			}

		}catch(SQLException e){
			e.printStackTrace();
			conn=null;
		}

		return SUCCESS;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	
}
