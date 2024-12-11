<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
	// DB 연결 정보
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "hr";
    String password = "1234";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
    	// DB 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, user, password);
        String query = "delete from board where id = ?"; // ?값의 아이디 컬럼에 담긴 데이터를 삭제
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(id));
        int rowsDeleted = pstmt.executeUpdate();

        if (rowsDeleted > 0) {
            response.sendRedirect("list.jsp");  // 삭제 후 목록으로 리다이렉트
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
%>
