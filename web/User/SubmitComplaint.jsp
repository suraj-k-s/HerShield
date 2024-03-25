<%-- 
    Document   : SubmitComplaint
    Created on : 22 Feb, 2024, 2:02:23 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/ComplaintUploadAction.jsp">
            <table border="1">
                <h2>Submit Complaint</h2>
                <tr>
                    <td>Complaint Title</td>
                    <td>
                        <input type="text" name="txt_complaint" id="txt_complaint" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Complaint Details</td>
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
                        <input type="hidden" name="txt_Latitude" id="txt_Latitude" required=""/>
                        <input type="hidden" name="txt_Longitude" id="txt_Longitude" required=""/>
                        <input type="Submit" value="save" name="btn_save"/>
                    </td>
                </tr>

            </table>
            <br><br>
            <table border="1">
                <tr>
                    <td>Sl No</td>
                    <td>Complaint Title</td>
                    <td>Complaint Details</td>
                    <td>Complaint File</td>
                    <td>Date</td>
                    <td>Action</td>
                </tr>
                <%
                    int i = 0;
                    String selQry = "select * from tbl_complaint where user_id='" + session.getAttribute("Uid") + "'";
                    ResultSet sr = con.selectCommand(selQry);
                    while (sr.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=sr.getString("complaint_title")%></td>
                    <td><%=sr.getString("complaint_details")%></td>
                    <td><a href="../Assets/Files/<%=sr.getString("complaint_file")%>" download>Download</a></td>
                    <td><%=sr.getString("complaint_date")%></td>
                    <td><a href="SubmitComplaint.jsp?id=<%=sr.getString("complaint_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>

            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
    <script>
        $(document).ready(function() {

            var Longitude, Latitude;


            var Longitude, Latitude;

            function showPosition(position) {


                Latitude = position.coords.latitude;
                Longitude = position.coords.longitude;

                console.clear();

                console.log("Latitude = " + Latitude);
                console.log("Longitude = " + Longitude);

                document.getElementById("txt_Latitude").value = Latitude;
                document.getElementById("txt_Longitude").value = Longitude;


            }
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else {
                    alert("Geolocation is not supported by this browser.");
                }
            }
            getLocation();


        });


    </script>
</html>