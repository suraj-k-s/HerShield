<%-- 
    Document   : SearchPolicestation
    Created on : 12 Mar, 2024, 6:38:29 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>                     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Search Policestation</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form>
            <table border="1">
                <h2>Search Policestation</h2>
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
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="search"/></td>
                </tr>
            </table>
            <br><br>
            <table border="1">
          <tr>
              <td><b>Sl No</b></td>
            <td><b>Police Address</b></td>
            <td><b>Police Email</b></td>
            <td><b>Police Contact</b></td>
            <td><b>Action</b></td>
           </tr>
           <%
                if(request.getParameter("btn_save")!=null){
                int i=0;
                String seQry="select * from tbl_police where place_id='"+ request.getParameter("selplace") +"'";
                ResultSet sr=con.selectCommand(seQry);
                while(sr.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=sr.getString("police_address")%></td>
                       <td><%=sr.getString("police_email")%></td>
                       <td><%=sr.getString("police_contact")%></td>
                       <td><a href="SubmitComplaint.jsp?id=<%=sr.getString("police_id")%>">Submit Complaint</a></td>
                  </tr>
        <%
                }
                }
        %>
            
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
