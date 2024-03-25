<%-- 
    Document   : ViewRequest
    Created on : 11 Mar, 2024, 12:59:04 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
    </head>
    <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("request") != null) {
           String updateQuery = "update tbl_request SET request_status='"+ ("1") +"' where request_id='" + request.getParameter("request") + "'";  
           con.executeCommand(updateQuery);
           response.sendRedirect("ViewRequest.jsp");
        }else if (request.getParameter("name")!=null) {
           String updateQuery = "update tbl_request SET request_status='"+ ("2") +"' where request_id='" + request.getParameter("name") + "'";
           con.executeCommand(updateQuery);
        }else{
    %>
    <body>
        <table border="1">
            <tr>
                <td><b>Sl No</b></td>
                <td><b>Request title</b></td>
                <td><b>Request Details</b></td>
                <td><b>Request File</b></td>
                <td><b>Date</b></td>
                <td><b>Action</b></td>
                <td><b>Update</b></td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_request where advocate_id='" + session.getAttribute("Aid") + "'";
                ResultSet rr = con.selectCommand(selQry);
                while (rr.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rr.getString("request_title")%></td>
                <td><%=rr.getString("request_details")%></td>
                <td><a href="../Assets/Files/<%=rr.getString("request_file")%>" download>Download</a></td>
                <td><%=rr.getString("request_date")%></td>
                <td><a href="ViewRequest.jsp?request=<%=rr.getString("request_id")%>">Accept</a>
                    <br><br>
                    <a href="ViewRequest.jsp?name=<%=rr.getString("request_id")%>">Reject</a>
                </td>
                <td>
                    <a href="Update.jsp?rid=<%=rr.getString("request_id")%>">Updates</a>
                </td>
            </tr>
            <%
                }
        }
            %>

        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
