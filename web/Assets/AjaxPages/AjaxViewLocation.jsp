<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="org.json.JSONObject"%>
<%
    String latitude = "";
    String longitude = "";
    
    
    String selQry  = "select * from tbl_complaint where complaint_id='"+request.getParameter("id")+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(rs.next())
    {
         latitude = rs.getString("complaint_latitude");
         longitude = rs.getString("complaint_longitude");
    }
   

    JSONObject jo = new JSONObject();
    jo.put("latitude", latitude);
    jo.put("longitude", longitude);
    jo.write(response.getWriter());


%>