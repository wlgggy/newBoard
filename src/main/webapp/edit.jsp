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
String content = "";

try {
	// DB 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, password);
	String query = "SELECT title, content FROM board WHERE id = ?";
	pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, Integer.parseInt(id));
	rs = pstmt.executeQuery();

	if (rs.next()) {
		title = rs.getString("title");
		content = rs.getString("content");
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
<title>게시글 수정</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/write.css">
<body>
	<header>
		<h1>게시글 수정</h1>
	</header>
	<section>
		<form action="editAction.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>" class="title" /> 제목 <input
				type="text" name="title" value="<%=title%>" class="title" /><br>
			내용 <input name="content" value="<%=content%>" class="content"></input>
			<br> <input class="btn" type="submit" value="수정 완료" />
		</form>
	</section>
	<footer>
		<a href="list.jsp">목록으로</a>
	</footer>
</body>
</html>
