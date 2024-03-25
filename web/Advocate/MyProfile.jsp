<%-- 
    Document   : MyProfile
    Created on : 22 Feb, 2024, 5:23:31 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile</title>
    </head>
    <%@include file="Head.jsp" %>
    <%
           String name=request.getParameter("txt_name");
           String email=request.getParameter("txt_email"); 
           String address=request.getParameter("txt_address");
           String selqry="select* from tbl_advocate where advocate_id='"+session.getAttribute("Aid")+"'";
           ResultSet rs=con.selectCommand(selqry);
           if (rs.next())
           {
               
           }
    %>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>
                        <img src="../Assets/Files/<%=rs.getString("advocate_photo")%>"width="25px"height="25px"
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("advocate_name")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("advocate_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("advocate_address")%></td>
                </tr>
            </table> 
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
