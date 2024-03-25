<%-- 
    Document   : ViewLaws
    Created on : 11 Mar, 2024, 1:25:47 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Laws</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <table border="1">
            <h2>Laws</h2>
          <tr>
            <td><b>Sl No</b></td>
            <td><b>Law Name</b></td>
            <td><b>Law Section</b></td>
            <td><b>Law Details</b></td>
            <td><b>Law Punishment</b></td>
           </tr>
            <%
                int i=0;
                String selQry="select * from tbl_laws";
                ResultSet rr=con.selectCommand(selQry);
                while(rr.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rr.getString("laws_name")%></td>
                       <td><%=rr.getString("laws_section")%></td>
                       <td><%=rr.getString("laws_details")%></td>
                       <td><%=rr.getString("laws_punishment")%></td>
                  </tr>
        <%
                }
        %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
