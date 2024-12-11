<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// 한글이 깨져서 
	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

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
        String query = "UPDATE board SET title = ?, content = ? WHERE id = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setInt(3, Integer.parseInt(id));
        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            response.sendRedirect("list.jsp");  // 수정 후 목록으로 리다이렉트
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
%>
