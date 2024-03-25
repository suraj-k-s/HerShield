<%-- 
    Document   : AdvocateList
    Created on : 11 Mar, 2024, 2:04:33 PM
    Author     : hp
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advocate List</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <section class="main_content dashboard_part">
            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <div class="QA_table mb_30">
                                    <iframe style="border: none; border-radius: 15px; width: 100%; height: 653px ;" src = "Advocate.jsp" ></iframe>
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

