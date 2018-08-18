<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<%
	String name = request.getParameter("name");
	
	String email = request.getParameter("email");
	String license_no = request.getParameter("license_no");
	String mobile_no = request.getParameter("mobile_no")
	String type =request.getParameter("type");
	String location = request.getParameter("location");
	String city = request.getParameter("city");
	String state= request.getParameter("state");


	try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			Statement st = con.createStatement();

			 if(type.equals("medicine")){
				int count = st.executeUpdate("insert into medicine values('"+name+"','"+email+"','"+license_no+"','"+mobile_no+"','"+location+"','"+city+"','"+state+"','medicine',)");
			if(count>0){
				res.sendRedirect("login_stores.html");
				
			}
		}
		else if(type.equals("hospital")){
				int count = st.executeUpdate("insert into hospital values('"+name+"','"+email+"','"+license_no+"','"+mobile_no+"','"+location+"','"+city+"','"+state+"','hospital',)");
			if(count>0){
				res.sendRedirect("login_stores.html");
				
			}
		}

			
		con.close();
		}catch(Exception e){
			
				pw.println("<html><center><h1>Already registered</h1></center></html>");
			
			//pw.println("Error:"+e);
		}
%>