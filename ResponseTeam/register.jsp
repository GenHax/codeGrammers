<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<%
	String name = request.getParameter("name");
	
	String email = request.getParameter("email");
	String license_no = request.getParameter("licenseno");
	String mobile_no = request.getParameter("mobile_no");
	String type =request.getParameter("type");
	String location = request.getParameter("location");
	String city = request.getParameter("city");
	String state= request.getParameter("state");


	try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
		 	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			 if(type.equals("Medicine Shop")){
				int count = st.executeUpdate("insert into medicine values('"+name+"','"+email+"','"+license_no+"','"+mobile_no+"','"+location+"','"+city+"','"+state+"','medicine')");
				if(count>0){
				out.println("<center>");
				out.println("<h1>");	
				out.println("Successfully registered");
			out.println("</center>");
				out.println("</h1>");
			}
				}
			else if(type.equals("Hospital")){
				int count = st.executeUpdate("insert into hospital values('"+name+"','"+email+"','"+license_no+"','"+mobile_no+"','"+location+"','"+city+"','"+state+"','hospital')");
				if(count>0){
				out.println("<center>");
				out.println("<h1>");	
				out.println("Successfully registered");
			out.println("</center>");
				out.println("</h1>");
				
			}
				}
		

			
		con.close();
		}catch(Exception e){
			
			out.println("Error:"+e);
		}
%>