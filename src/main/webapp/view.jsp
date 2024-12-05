<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
int id = Integer.parseInt(request.getParameter("id"));

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "1234";

try (Connection conn = DriverManager.getConnection(url, user, password)) {
	String query = "SELECT * FROM board WHERE id = ?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, id);
	ResultSet rs = pstmt.executeQuery();

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
		<a class="btn" href="edit.jsp?id=<%=id%>">수정</a> <a class="btn"
			href="delete.jsp?id=<%=id%>">삭제</a>
	</section>
	<footer></footer>
</body>
</html>
<%
}
}
%>
