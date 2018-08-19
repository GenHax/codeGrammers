<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
        
  <table class="table table-striped">
  	<thead>
      <tr>
        <th>Hospital Name</th>
        <th>Phone Number</th>
      </tr>
    </thead>
    <tbody>
	<%
		String location = request.getParameter("location");
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
      Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    ResultSet rs1= null;

	     rs1 = st.executeQuery("select * from hospital where location = '"+location+"'");
      		while(rs1.next()){
      		out.println("<tr>");
      		out.println("<td>"+rs1.getString(1)+"</td>");
      		out.println("<td><a href = 'tel:"+rs1.getString(4)+"'>"+rs1.getString(4)+"</a></td>");
      		out.println("</tr>");
      	}

	}
	catch(Exception e){
		out.println("Error:"+e);
	} finally {}
	
%>
</tbody>
</table>
</div>

</body>
</html>
