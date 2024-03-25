<%-- 
    Document   : PoliceStation
    Created on : 22 Feb, 2024, 2:00:10 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Police Station</title>
    </head>
    <%@include file="Head.jsp" %>
    <% 
        if(request.getParameter("btn_save")!=null)
        {
            String Address=request.getParameter("txt_address");
            String Email=request.getParameter("txt_email");
            String Contact=request.getParameter("num_contact");
            String password=request.getParameter("txt_pass");
            String id=request.getParameter("selplace");
            String insQry="insert into tbl_police(police_address,police_email,police_contact,police_password,place_id)values('"+Address+"','"+Email+"','"+Contact+"','"+password+"','"+ id +"')";
            con.executeCommand(insQry);
        }
        if(request.getParameter("id")!=null)
        {
            String delQry="delete from tbl_police where police_id='"+request.getParameter("id")+"'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <h2>Police Registration</h2>
        <form method="POST">
            <table border="1">
                <tr>
                    <td>Address</td>
                    <td>
                        <input type="text" name="txt_address" id="txt_address" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" name="txt_email" id="txt_email"required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="number" name="num_contact" id="num_contact" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onChange="getPlace(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("district_id")%>">
                                <%=rs.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td> 
                    <td><select name="selplace" id="selplace" required="">
                            <option value="">--select--</option>
                        </select>
                    </td>           
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="passwrod" name="txt_pass" id="txt_pass" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="save"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(a) {
                                    $("#selplace").html(a);

                                }
                            });
                        }</script>
</html>
