<%-- 
    Document   : ViewFeedback
    Created on : 2 Mar, 2024, 5:56:25 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
    </head>
    <body>
        <table border="1">
          <tr>
              <td><b>Sl No</b></td>
              <td><b>Feedback Content</b></td>
              <td><b>Feedback Details</b></td>
           </tr>
            <%
                int i=0;
                String selQry="select * from tbl_feedback";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("feedback_content")%></td>
                       <td><%=rs.getString("feedback_details")%></td>
                  </tr>
        <%
                }
        %>
            
        </table>  
    </body>
</html>
