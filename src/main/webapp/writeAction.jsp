<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // 제목과 내용이 빈 값인 경우 처리
    if (title == null || title.trim().isEmpty()) {
        out.println("<script>alert('제목을 입력하세요.'); history.back();</script>");
        return;
    }
    if (content == null || content.trim().isEmpty()) {
        out.println("<script>alert('내용을 입력하세요.'); history.back();</script>");
        return;
    }

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "hr";
    String password = "1234";

    try {
        // 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "insert into board (id, title, content) values (board_seq.nextval, ?, ?)";
            
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, title.trim());
                pstmt.setString(2, content.trim());

                // 쿼리 실행
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    response.sendRedirect("list.jsp");  // 삽입 성공 후 목록 페이지로 리다이렉트
                } else {
                    out.println("<script>alert('게시글 작성 실패'); history.back();</script>");
                }
            }
        }
    } catch (ClassNotFoundException e) {
        out.println("<script>alert('JDBC 드라이버 로드 실패'); history.back();</script>");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("<script>alert('데이터베이스 연결 실패'); history.back();</script>");
        e.printStackTrace();
    }
%>
