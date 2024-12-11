<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
int id = Integer.parseInt(request.getParameter("id"));

// DB 연결 정보
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "1234";

try (
	// DB 연결
	Connection conn = DriverManager.getConnection(url, user, password)) {
	String query = "select * from board where id = ?"; // ? 값에는 아이디 값이 들어감
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, id);
	ResultSet rs = pstmt.executeQuery(); // 쿼리 실행 결과 반환

	if (rs.next()) {
%>
<html>
<head>
<title>글 상세 보기</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/write.css">
<body>
	<header>
		<h1>글 상세 보기</h1>
	</header>
	<section>
		<p><%=rs.getString("title")%></p>
		<p><%=rs.getString("content")%></p>
		<p>
			작성일:
			<%=rs.getDate("created_date")%></p>
		<p>
			<a class="btn" href="edit.jsp?id=<%=id%>">수정</a> <a class="btn"
				href="delete.jsp?id=<%=id%>">삭제</a>
		</p>
	</section>
	<footer><a href="list.jsp">목록으로</a></footer>
</body>
</html>
<%
}
}
%>
