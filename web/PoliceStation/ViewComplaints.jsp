<%-- 
    Document   : ViewComplaints
    Created on : 1 Mar, 2024, 2:12:49 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaints</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <table border="1">
            <tr>
                <td><b>Sl No</b></td>
                <td><b>Complaint Title</b></td>
                <td><b>Complaint Details</b></td>
                <td><b>Complaint File</b></td>
                <td><b>Date</b></td>
                <td><b>Action</b></td>
            </tr>
            <%
                int i = 0;
                String sQry = "select * from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id inner join tbl_police p on p.place_id=u.place_id where police_id='"+session.getAttribute("Pid")+"'";
                ResultSet rr = con.selectCommand(sQry);
                while (rr.next()) {
                    i++;
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rr.getString("complaint_title")%></td>
                <td><%=rr.getString("complaint_details")%></td>
                <td><a href="../Assets/Files/<%=rr.getString("complaint_file")%>" download>Download</a></td>
                <td><%=rr.getString("complaint_date")%></td>
                <td>
                    <a href="Updates.jsp?cid=<%=rr.getString("complaint_id")%>">Updates</a>
                    |
                    <a href="ViewLocation.jsp?cid=<%=rr.getString("complaint_id")%>">Location</a>
                </td>
            </tr>
            <%
                }
            %>

        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
