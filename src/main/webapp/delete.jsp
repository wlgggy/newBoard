<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "1234";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String title = "";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, password);
	String query = "SELECT title FROM board WHERE id = ?";
	pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, Integer.parseInt(id));
	rs = pstmt.executeQuery();

	if (rs.next()) {
		title = rs.getString("title");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
	} catch (SQLException ignored) {
	}
	try {
		if (pstmt != null)
	pstmt.close();
	} catch (SQLException ignored) {
	}
	try {
		if (conn != null)
	conn.close();
	} catch (SQLException ignored) {
	}
}
%>

<html>
<head>
<title>게시글 삭제</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/write.css">
<body>
	<header>
		<h1>게시글 삭제</h1>
	</header>
	<section>
		<div>정말로 게시글을 삭제하시겠습니까?</div>
		<br> <br>
		<form action="deleteAction.jsp" method="post">
			<input type="hidden" name="id"
				value="<%=request.getParameter("id")%>" /> <input class="btn"
				type="submit" value="삭제" />
		</form>
	</section>
	<footer>
		<a href="list.jsp">목록으로</a>
	</footer>

</body>
</html>

