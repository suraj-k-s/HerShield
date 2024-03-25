<%-- 
    Document   : Specialization
    Created on : 19 Mar, 2024, 2:50:49 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialization</title>
    </head>
    <%
        if(request.getParameter("btn_save")!=null)
        {
            String specialization=request.getParameter("txt_specializationname");
            String insQry="insert into tbl_specialization(specialization_name)values('"+specialization+"')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("id") != null) {
            String delQry = "delete from tbl_specialization where specialization_id='" + request.getParameter("id") + "'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Specialization Name</td>
                    <td>
                        <input type="text" name="txt_specializationname" id="txt_specializationname" required=""/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="save" name="btn_save"/>
                    </td>
                </tr>
            </table>
        </form>
        <br><br>
        <table border="1">
            <tr>
                <td>Sl No</td>
                <td>Specialization Name</td>
                <td>Action</td>
            </tr>
            <%
                int i=0;
                String selQry="select*from tbl_specialization";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("specialization_name")%></td>
                <td><a href="Specialization.jsp?id=<%=rs.getString("specialization_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
