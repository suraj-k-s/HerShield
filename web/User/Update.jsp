<%-- 
    Document   : Update
    Created on : 19 Mar, 2024, 1:53:37 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advocate Updates</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <table border="1">
            <tr>
                <td>Sl No</td>
                <td>Title</td>
                <td>Details</td>
                <td>Date</td>
            </tr>
            <%
                int i=0;
                String selQry="select*from tbl_update where request_id='"+request.getParameter("rid")+"'";
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
            </tr>
            <%
                }
            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
