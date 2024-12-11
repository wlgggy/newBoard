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
ResultSet rs = null;

String title = "";

try {
	// DB 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, password);
	String query = "select title from board where id = ?"; // 일단 데이터베이스 갖고와
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
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (conn != null) conn.close();	
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

