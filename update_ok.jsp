<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String gender = request.getParameter("gender");

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "system";
    String upw = "pass";

    Connection conn = null;
    PreparedStatement pstmt = null;

    String sql = "UPDATE members SET password = ?, name = ?, phone1 = ?, phone2 = ?, phone3 = ?, gender = ? WHERE id = ?";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, uid, upw);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pw);
        pstmt.setString(2, name);
        pstmt.setString(3, phone1);
        pstmt.setString(4, phone2);
        pstmt.setString(5, phone3);
        pstmt.setString(6, gender);
        pstmt.setString(7, id);

        int result = pstmt.executeUpdate();

        if(result == 1) {
            response.sendRedirect("update_success.jsp");
        } else {
            response.sendRedirect("update_fail.jsp");
        }
    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("update_fail.jsp");
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
