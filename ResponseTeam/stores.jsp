
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html>
<html>
<head>
	<title>Medicine Store</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title></title>
    <!-- <div id="otEmbedContainer" style="width:800px; height:640px"></div> <script src="https://tokbox.com/embed/embed/ot-embed.js?embedId=5e13db39-ecf8-4b3c-b768-bf9d9601682c&room=DEFAULT_ROOM"></script> -->

</head>
<body>
<div class="container">
  <h2>NEAREST MEDICINE STORE</h2>
             
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Contact Details</th>
       
      </tr>
    </thead>
    <tbody>

	<%
	String location = request.getParameter("location");
	
		try{
	      	Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	      ResultSet rs = st.executeQuery("select * from medicine where location = '"+location+"'");
	      while(rs.next()){

	      	%>

	      	<tr>
		        <td><% out.println(rs.getString(1)); %></td>
		        
		        <td ><% out.println("<a href='tel:"+rs.getString(4)+"'>"+rs.getString(4)+"</a>"); %></td>
		    </tr>
		   <!--  <tr>
		    	<td><div id="otEmbedContainer" style="width:400px; height:240px"></div> <script src="https://tokbox.com/embed/embed/ot-embed.js?embedId=5e13db39-ecf8-4b3c-b768-bf9d9601682c&room=DEFAULT_ROOM"></script></td>
		    </tr> -->
	      


	      	<%
	  	  }
	  		}
	  	catch(Exception e){
	      out.println("Error:"+e);
	    } 
	    finally { }


	%>
	 </tbody>
  </table>
</div>

</body>
</html>