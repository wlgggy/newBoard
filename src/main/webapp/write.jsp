<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/write.css">
<title>게시글작성</title>
<header>
	<h1>게시글작성</h1>
</header>
<section>
	<form name="writeForm" action="writeAction.jsp" method="post"
		onsubmit="return validateForm()">
		제목
		<hr>
		<input type="text" name="title" class="title" placeholder="제목">
		<br> 내용
		<hr>
		<input type="text" name="content" class="content" placeholder="내용"></input>
		<br> <input class="btn" type="submit" value="작성">
	</form>
</section>
<script>
	function validateForm() {
		const title = document.writeForm.title.value.trim();
		const content = document.writeForm.content.value.trim();
		if (!title) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!content) {
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
</script>
