<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = (String) session.getAttribute("user_id");

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "system";
    String upw = "pass";

    Connection conn = null;
    PreparedStatement pstmt = null;

    String sql = "DELETE FROM members WHERE id = ?";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, uid, upw);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);

        int result = pstmt.executeUpdate();

        if(result == 1) {
            session.invalidate();
            response.sendRedirect("delete_success.jsp");
        } else {
            response.sendRedirect("delete_fail.jsp");
        }
    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("delete_fail.jsp");
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
