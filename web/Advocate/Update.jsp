<%-- 
    Document   : Update
    Created on : 15 Mar, 2024, 2:18:56 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updates</title>
    </head>
     <%@include file="Head.jsp" %>
    <%
        if(request.getParameter("btn_save")!=null)
        {
            String title=request.getParameter("txt_title");
            String details=request.getParameter("txt_details");
            String insQry="insert into tbl_update(update_title,update_details,update_date,request_id)values('"+title+"','"+details+"',curdate(),'"+request.getParameter("rid")+"')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("id") != null) {
            String delQry = "delete from tbl_update where update_id='" + request.getParameter("id") + "'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form method="POST">
            <table border="1">
                <tr>
                    <td>Title</td>
                    <td>
                        <input type="text" name="txt_title" id="txt_title" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td>
                        <textarea name="txt_details" id="txt_details" required=""></textarea>
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
                <td>Title</td>
                <td>Details</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            <%
                int i=0;
                String selQry="select*from tbl_update";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("update_title")%></td>
                <td><%=rs.getString("update_details")%></td>
                <td><%=rs.getString("update_date")%></td>
                <td><a href="Update.jsp?id=<%=rs.getString("update_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
     <%@include file="Foot.jsp" %>
</html>
