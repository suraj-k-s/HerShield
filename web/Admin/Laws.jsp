<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>

        <%@include file="Header.jsp" %>
    </head>

    <%
        if (request.getParameter("btn_save") != null) {
            String Lawname = request.getParameter("txt_name");
            String Lawsection = request.getParameter("txt_section");
            String Details = request.getParameter("txt_details");
            String Punishment = request.getParameter("txt_punishment");
            String insQry = "insert into tbl_laws(laws_name,laws_section,laws_details,laws_punishment)values('" + Lawname + "','" + Lawsection + "','" + Details + "','" + Punishment + "')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("id") != null) {
            String delQry = "delete from tbl_laws where laws_id='" + request.getParameter("id") + "'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Laws</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_district">Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_district" name="txt_name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">Section</label>
                                                    <input required="" type="text" class="form-control" id="txt_district" name="txt_section">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">Details</label>
                                                    <input required="" type="text" class="form-control" id="txt_district" name="txt_details">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">Punishment</label>
                                                    <input required="" type="text" class="form-control" id="txt_district" name="txt_punishment">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td>Law name</td>
                                                <td>Details</td>
                                                <td>Section</td>
                                                <td align="center" scope="col">Punishment</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String selQry = "select * from tbl_laws";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {
                                                    i++;
                                            %>
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=rs.getString("laws_name")%></td>
                                                <td><%=rs.getString("laws_details")%></td>
                                                <td><%=rs.getString("laws_section")%></td>
                                                <td><%=rs.getString("laws_punishment")%></td>
                                                <td><a href="Laws.jsp?id=<%=rs.getString("laws_id")%>" class="status_btn">Delete</a></td>
                                            </tr>
                                            <%
                                                }
                                           
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>











