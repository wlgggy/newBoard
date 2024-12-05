<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "1234";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	// Oracle JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");

	conn = DriverManager.getConnection(url, user, password);
	String query = "SELECT * FROM board ORDER BY id DESC";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
<html>
<head>
<title>게시판 목록</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/list.css">
<body>
	<header>
		<h1>게시판</h1>
	</header>
	<section>
		<a href="write.jsp" class="write">게시글작성</a>
		<div>
			<hr>
			<div class="info">
				<div class="id">번호</div>
				<div class="title">제목</div>
				<div class="date">작성일</div>
			</div>
			<hr>
			<%
			while (rs.next()) {
			%>
			<div class="con">
				<div class="id"><%=rs.getInt("id")%></div>
				<div class="title">
					<a href="view.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a>
				</div>
				<div class="date"><%=rs.getDate("created_date")%></div>
			</div>
			<hr>
			<%
			}
			%>
		</div>
	</section>
	<footer></footer>
</body>
</html>
<%
} catch (Exception e) {
e.printStackTrace(); // 콘솔에 출력
out.println("<h3>오류가 발생했습니다. 관리자에게 문의하세요.</h3>");
out.println("<p>오류 메시지: " + e.getMessage() + "</p>"); // 예외 메시지 출력
} finally {
if (rs != null)
	try {
		rs.close();
	} catch (SQLException ignored) {
	}
if (pstmt != null)
	try {
		pstmt.close();
	} catch (SQLException ignored) {
	}
if (conn != null)
	try {
		conn.close();
	} catch (SQLException ignored) {
	}
}
%>
