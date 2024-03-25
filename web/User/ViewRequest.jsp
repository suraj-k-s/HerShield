<%-- 
    Document   : ViewRequest
    Created on : 19 Mar, 2024, 11:12:11 AM
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

    <body>
        <table border="1">
            <tr>
                <td><b>Sl No</b></td>
                <td><b>Request Title</b></td>
                <td><b>Request Details</b></td>
                <td><b>Request File</b></td>
                <td><b>Date</b></td>
                <td><b>Request Status</b></td>
                <td><b>Action</b></td>
            </tr>
            <%
                int i = 0;
                String sQry = "select * from tbl_request where user_id='" + session.getAttribute("Uid") + "'";
                ResultSet rr = con.selectCommand(sQry);
                while (rr.next()) {
                    i++;
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rr.getString("request_title")%></td>
                <td><%=rr.getString("request_details")%></td>
                <td><a href="../Assets/Files/<%=rr.getString("request_file")%>" download>Download</a></td>
                <td><%=rr.getString("request_date")%></td>
                <td>  <%
                    if (rr.getString("request_status").equals("0")) {
                        out.println("Pending");
                    } else if (rr.getString("request_status").equals("1")) {
                        out.println("Accepted");
                    } else if (rr.getString("request_status").equals("2")) {
                        out.println("Rejected");
                    } 
                    %></td>
                <td>
                     <%
                    if (rr.getString("request_status").equals("0")) {
                        out.println("Pending");
                    } else if (rr.getString("request_status").equals("1")){
                    %>
                                        <a href="Update.jsp?rid=<%=rr.getString("request_id")%>">Updates</a>

                    <%
                    }else if (rr.getString("request_status").equals("2")) {
                        out.println("Rejected");
                    } 
                    %>
                </td>
            </tr>
            <%
                    }
                
            %>

        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
