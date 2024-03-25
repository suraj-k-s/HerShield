<%-- 
    Document   : SearchAdvocate
    Created on : 9 Mar, 2024, 9:23:56 AM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>                     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Advocate</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form>
            <table border="1">
                <h2>Search Advocate</h2>
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
                    <td>Specialization</td>
                    <td><select name="selspecialization" id="selspecialization">
                            <option value="">--select--</option>
                            <%
                                String seleQry = "select * from tbl_specialization";
                                ResultSet rr = con.selectCommand(seleQry);
                                while (rr.next()) {
                            %>  
                            <option value="<%=rr.getString("specialization_id")%>">
                                <%=rr.getString("specialization_name")%>
                            </option>
                            <%
                                }
                            %>
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
            <td><b>Advocate Name</b></td>
            <td><b>Advocate Address</b></td>
            <td><b>Advocate Email</b></td>
            <td><b>Action</b></td>
           </tr>
           <%
                if(request.getParameter("btn_save")!=null){
                int i=0;
                String seQry="select * from tbl_advocate where place_id='"+ request.getParameter("selplace") +"'and specialization_id='"+request.getParameter("selspecialization")+"'";
                ResultSet sr=con.selectCommand(seQry);
                while(sr.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=sr.getString("advocate_name")%></td>
                       <td><%=sr.getString("advocate_address")%></td>
                       <td><%=sr.getString("advocate_email")%></td>
                       <td><a href="SendRequest.jsp?id=<%=sr.getString("advocate_id")%>">Send Request</a></td>
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