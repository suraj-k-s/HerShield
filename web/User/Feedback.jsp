<%-- 
    Document   : Feedback
    Created on : 2 Mar, 2024, 10:24:20 AM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <%@include file="Head.jsp" %>
    <% 
        if(request.getParameter("btn_save")!=null)
        {
            String feedbackcontent=request.getParameter("txt_feedbackcontent");
            String feedbackdetails=request.getParameter("txt_feedbackdetails");
            String insQry="insert into tbl_feedback(feedback_content,feedback_details,user_id)values('"+feedbackcontent+"','"+feedbackdetails+"','"+session.getAttribute("Uid")+"')";
            con.executeCommand(insQry);
        }
        if(request.getParameter("id")!=null)
        {
            String delQry="delete from tbl_feedback where feedback_id='"+request.getParameter("id")+"'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form method="POST">
            <h2>Feedback</h2>
            <table border="1">
                <tr>
                    <td>Content</td>
                    <td>
                        <input type="text" name="txt_feedbackcontent" id="txt_feedbackcontent" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td>
                        <textarea name="txt_feedbackdetails" id="txt_feedbackdetails" required=""></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="save" name="btn_save"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
