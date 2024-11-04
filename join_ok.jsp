<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 폼 데이터 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String gender = request.getParameter("gender");

    // 데이터베이스 연결 설정
    String url = "jdbc:oracle:thin:@localhost:1521:xe"; // DB URL 확인
    String uid = "system"; // 사용자 ID
    String upw = "pass"; // 사용자 비밀번호

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;

    String createTableSQL = "CREATE TABLE members ("
            + "id VARCHAR2(50) PRIMARY KEY, "
            + "password VARCHAR2(100) NOT NULL, "
            + "name VARCHAR2(50) NOT NULL, "
            + "phone1 VARCHAR2(3) NOT NULL, "
            + "phone2 VARCHAR2(4) NOT NULL, "
            + "phone3 VARCHAR2(4) NOT NULL, "
            + "gender CHAR(1) NOT NULL"
            + ")";
    
    String sql = "INSERT INTO members (id, password, name, phone1, phone2, phone3, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, uid, upw);
        stmt = conn.createStatement();

        // members 테이블이 없으면 생성
        try {
            stmt.execute(createTableSQL);
            out.println("테이블이 성공적으로 생성되었습니다.");
        } catch(SQLException e) {
            if (e.getErrorCode() == 955) { // ORA-00955: name is already used by an existing object
                out.println("테이블이 이미 존재합니다.");
            } else {
                throw e; // 다른 예외는 다시 던지기
            }
        }

        // SQL 쿼리 준비
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, phone1);
        pstmt.setString(5, phone2);
        pstmt.setString(6, phone3);
        pstmt.setString(7, gender);

        // 쿼리 실행 및 결과 확인
        int result = pstmt.executeUpdate();

        if(result == 1) { 
            // 성공 시 세션에 회원 정보 저장
            session.setAttribute("id", id);
            session.setAttribute("name", name);
            session.setAttribute("phone", phone1 + "-" + phone2 + "-" + phone3);
            session.setAttribute("gender", gender.equals("m") ? "남자" : "여자");

            // 회원가입 성공 페이지로 이동
            response.sendRedirect("join_success.jsp");
        } else {    
            // 실패 시 회원가입 실패 페이지로 이동
            response.sendRedirect("join_fail.jsp");
        }
    } catch(Exception e) {
        // 예외 발생 시 오류 메시지 출력
        e.printStackTrace();
        response.getWriter().println("예외 발생: " + e.getMessage());
        response.getWriter().println("회원가입에 실패했습니다. DB 연결 정보를 확인하세요.");
    } finally {
        // 자원 해제
        try {
            if(stmt != null) stmt.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("자원 해제 중 예외 발생: " + e.getMessage());
        }
    }
%>
