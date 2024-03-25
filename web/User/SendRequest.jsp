<%-- 
    Document   : SendRequest
    Created on : 11 Mar, 2024, 11:59:15 AM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/RequestUploadAction.jsp">
            <table border="1">
                <tr>
                    <td>Request Title</td>
                    <td>
                        <input type="text" name="txt_title" id="txt_title"/>
                        <input type="text" name="txt_id" id="txt_id" value="<%=request.getParameter("id")%>"/>
                        
                    </td>
                </tr>
                <tr>
                    <td>Request Details</td>
                    <td>
                        <textarea name="txt_details" id="txt_details" required=""></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Complaint File</td>
                    <td>
                        <input type="file" name="filecomplaint" id="filecomplaint" required=""/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="send" name="btn_save"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
