<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 생성</title>
</head>
<body>
<%
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "system";
    String upw = "pass";

    Connection conn = null;
    Statement stmt = null;

    String createTableSQL = "CREATE TABLE members ("
            + "id VARCHAR2(50) PRIMARY KEY, "
            + "password VARCHAR2(100) NOT NULL, "
            + "name VARCHAR2(50) NOT NULL, "
            + "phone1 VARCHAR2(3) NOT NULL, "
            + "phone2 VARCHAR2(4) NOT NULL, "
            + "phone3 VARCHAR2(4) NOT NULL, "
            + "gender CHAR(1) NOT NULL"
            + ")";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, uid, upw);
        stmt = conn.createStatement();
        stmt.execute(createTableSQL);
        out.println("테이블이 성공적으로 생성되었습니다.");
    } catch(SQLException e) {
        // 테이블이 이미 존재할 경우 예외 처리
        if (e.getErrorCode() == 955) { // ORA-00955: name is already used by an existing object
            out.println("테이블이 이미 존재합니다.");
        } else {
            e.printStackTrace();
            out.println("테이블 생성에 실패했습니다.");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
</body>
</html>
