<%-- 
    Document   : ChangePassword
    Created on : 22 Feb, 2024, 5:22:51 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            if (request.getParameter("btn_update") != null) 
            {
                String selqry = "select* from tbl_advocate where advocate_id='" + session.getAttribute("Aid") + "'";
                ResultSet rs = con.selectCommand(selqry);  
                if(rs.next())
                {
                    String dbpassword=rs.getString("advocate_password");
                    String currentpassword=request.getParameter("txt_password");
                    String newpassword=request.getParameter("txt_passw");
                    String repassword=request.getParameter("txt_pass");
                    if (dbpassword.equals(currentpassword))
                    {
                        if (repassword.equals(newpassword))
                        {
                            String updateQuery = "update tbl_advocate SET advocate_password='"+ request.getParameter("txt_passw") +"' where advocate_id='" + session.getAttribute("Aid") + "'";  
                            con.executeCommand(updateQuery);
                           response.sendRedirect("ChangePassword.jsp");
                        }
                        else
                        {
                            out.println("New Password Mismatched"); 
                        }
                    }
                    else
                    {
                        out.println("Database Password Mismatched");  
                    }
                }
            }
        %>
    </body>
    <form method="post">
        <h2>Change Password</h2>
        <table border="1">
            <tr>
                <td>Current Password</td>
                <td>
                    <input type="text" name="txt_password" id="txt_password"/>
                </td>
            </tr>
            <tr>
                <td>New Password</td>
                <td>
                    <input type="text" name="txt_passw" id="txt_passw"/>
                </td>
            </tr>
            <tr>
                <td>Re-Password</td>
                <td>
                    <input type="text" name="txt_pass" id="txt_pass"/>
                </td>
            </tr>
            <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="Update" name="btn_update"/>
                    </td>
                </tr>
        </table>
    </form>
    <%@include file="Foot.jsp" %>
</html>
