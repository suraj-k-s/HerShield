<%-- 
    Document   : EditProfile
    Created on : 22 Feb, 2024, 2:01:48 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditProfile</title>
    </head>
    <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("btn_update") != null) {
            String updateQuery = "update tbl_user SET user_name='" + request.getParameter("txt_name") + "',user_email='" + request.getParameter("txt_email") + "',user_address='" + request.getParameter("txt_address") + "' where user_id='" + session.getAttribute("Uid") + "'";
            con.executeCommand(updateQuery);
            response.sendRedirect("EditProfile.jsp");
        }
        String selqry = "select* from tbl_user where user_id='" + session.getAttribute("Uid") + "'";
        ResultSet rs = con.selectCommand(selqry);
        if (rs.next()) {
    %>
    <body>
        <form method="post">
            <h2>Edit Profile</h2>
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txt_name" value="<%=rs.getString("user_name")%>" id="txt_name"/>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" name="txt_email" value="<%=rs.getString("user_email")%>" id="txt_name"/>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <input type="text" name="txt_address"  value="<%=rs.getString("user_address")%>" id="txt_address"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="Update" name="btn_update"/>
                    </td>
                </tr>
                <%
                    }
                %>
            </table> 
        </form>
    </body>
<%@include file="Foot.jsp" %>
</html>
