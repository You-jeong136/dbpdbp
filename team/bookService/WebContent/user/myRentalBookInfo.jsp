<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 판매 도서 : {rBook.bookname}</title>
<script type="text/javascript">

	function update() {
		var form = document.form;
		if ( form.rpoint.value == "" ) {
			alert("대여 도서의 포인트를 입력하십시오.");
			form.rpoint.focus();
			return false;
		} 
		if ( form.rexplain.value == "" ) {
			alert("대여도서의 소개글을 입력하십시오.");
			form.rexplain.focus();
			return false;
		}	
		form.submit();
	}
	
	function remove(targetUri) {
		var form = document.form;
		var answer;
		answer = confirm("해당 대여 도서를 삭제하시겠습니까?");
		if(answer == true){
			form.action = targetUri;
			form.submit();
		}
	}
	
</script>
<style>
	body, div, span, p, a, font, ul, li, fieldset, form, legend, table {
		margin : 0;
		padding : 0;
		border : 0;
		line-height : 130%;
	}
	div { display : block; }
	
	ul {
		margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	}
	
	.topBar_wrap {
		position : relative;
		width : 100%;
		border-bottom : 1px solid gray;
	}
	.topBar {
		height : 30px;
		z-index : 100;
		width : 1100px;
		margin : 0 auto;
	}
	.menu {
		float : right;
		margin-top : 8px;
		padding-right : 20px;
		font-size : 11px;
		display : inline-block;
	}
	
	.header_wrap {
		width : 1100px;
		margin : 0 auto;
		overflow : hidden;
		position : relative;
		background-color:#FFFFE0;
	}
	.main_searchForm {
		float: left;
	    margin-top: 25px;
	    margin-left: -20px;
	    margin-right : 5px;
	    height: 50px;
	}
	#container {
		postion : relative;
		width : 1100px;
		margin: 0 auto 0;
		padding-top : 25px;
		padding-bottom: 50px;
		min-height : 600px;
		background-color:#FFB6C1
	}
	.main {
		position: relative;
	    z-index: 5;
	    width: 100%;
	    padding-bottom: 0;
	}
	
	.clearfix{
		display : block;
	}
	
	.section {
		margin-bottom: 9px;
	    zoom: 1;
	    position: relative;
	    z-index: 2;
	    display : block;
	}
	
	***
	
	.list ul {
		list-style:none;
	    margin:0;
	    padding:0;
	    text-align:center
	    
	}
	.list li {
		list-style:none;
		margin: 0 0 5px 5px;
	    padding: 0 0 5px 5px;
	    border : 0;
	    float: left;
	}
	.list {
	    position: relative;
	    margin: 0 auto;
	    display: inline-block;
	    height: 40px;
	    margin-bottom: 16px;
	    padding: 15px 0 15px 0;
	    overflow: hidden;
	}
	.footer_area {
		text-align: center; 
	}
	
	
	.myinfo {
		float : right;
		padding-top : 50px;
		margin : 0 auto;
		width : 250px;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<header id="header">
			<!-- topBar : 로그인이랑 공지사항 같은데로 바로가기 등(?) 임의로 넣음.  -->
			<div class="topBar_wrap">
				<div class="topBar">
					<div class="menu">
						<a href=".1">공지사항</a>
						<span> | </span>
						<a href=".2">즐겨찾기</a>
					</div>
				</div>
			</div>
			<!--  로고랑 search 바 있는 곳. -->
			<div class="header_wrap">
				<div class="logo" style="margin-top : 25px; float : left; width : 300px">
					<h3><a href="homePage01.jsp">로고자리</a></h3>
				</div>
				<form name="main_search" class="main_searchForm">
				<!-- form에 action이랑 method 나중에 넣기 -->
					<fieldset>
						<legend>통합검색</legend>
						구분 : 
						<select id="stype" name="stype" title="상세검색" style="width:76px">
							<option value="all1" selected >전체</option>
							<option value="subject"  >제목</option>
							<option value="intro"  >작품소개</option>
							<option value="content"  >작품내용</option>
							<option  value="member" >작가</option>
						</select> &nbsp;
						장르 : 
						<select id="stype_g" name="stype_g" title="장르검색" style="width:76px">
							<option value="all2" selected >전체</option>
							<option value="action"  > 액션</option>
							<option value="fantasy"  > 판타지 </option>
							<option value="romance"  > 로맨스 </option>
							<option  value="comic" > 코믹 </option>
							<option value="etc" > 기타 등등 </option>
						</select>
						<input type="text" id="search_text" name="search_kw" title = "검색어 입력"
						size="20" class="inputText">
						<input type="button" value="검색">
					</fieldset>
				</form>
				<div class = "myinfo">
					<%if (session.getAttribute("userId") == null) { %>
				    	<a href="<c:url value='/user/login/form'/>" style="padding-left : 80px;">로그인 </a>
				    <% } else { %>
				    	<!-- 나중에 myPage?memberID 형태로 넘어가게 만들기 -->
				    	
				    	<a href="<c:url value='/user/myPage'/>" style="padding-left : 50px;"> ${userId} 님  정보</a>
				    	<span> | </span>
				    	<a href="<c:url value='/user/logout'/>"> 로그아웃</a>
					<% } %>
				</div>
			</div>
		</header>
		<div id="container" class="main clearfix">
			<div class="main_content">
				<section class="section">
					<div id ="myRBook">
						<%//필요한 정보, rentalBook(bookId) : rBook 얘랑 연계된 rentalInfo rInfo, rentalBook이랑 연계된 bookinfo : bInfo%>
						<p>* 해당 도서가 대여 중일 경우 포인트, 상태, 책 소개를 수정하실 수 없으며, 글을 내리실 수 없습니다.</p>
						<form name="form" method="POST" action="<c:url value='/user/rbook/update'/>">
							<input type="hidden" name = "bookid" value ="${rBook.bookID}">
							<input type="hidden" name = "sellerid" value = "${rBook.sellerID}">
							<input type="hidden" name = "bookinfoid" value = "${rBook.bookInfoID}">
							<input type="hidden" name = "image" value = "${rBook.image}">
							<input type="hidden" name = "state" value = "${rBook.state}">
							 제목 : <input type="text" name="bookname" value = "${rBook.bookname}" readonly> <br>
							 출판사 : <input type="text" value = "${bInfo.publisher}" readonly> <br>
							 작가 : <input type="text" value = " ${bInfo.writer} 저" readonly> <br>
							 장르 : <input type="text" value = "${bInfo.category}" readonly> <br>
							<c:if test="${rBook.state ==  1}"> <!-- 대여 중일 경우 -->
								대여 상태 : <input type="text" name = "rstate" value = "O "  readonly><br>
								포인트 : <input type="text" name = "rpoint" value = "${rBook.point}" readonly> <br>
								책 소개 : <input type="text" name = "rexplain" value = "${rBook.explain}" readonly> <br>
								책 상태 :
								 	<c:if test="${rBook.condition ==  0}">
										<input type="radio" name = "condition" value="0" checked disabled"> 상 
										<input type="radio" name = "condition" value="1" onClick="return(false);"> 중 
										<input type="radio" name = "condition" value="2" onClick="return(false);"> 하 
									</c:if>
									<c:if test="${rBook.condition ==  1}">
										<input type="radio" name = "condition" value="0" onClick="return(false);"> 상 
										<input type="radio" name = "condition" value="1" checked disabled"> 중 
										<input type="radio" name = "condition" value="2" onClick="return(false);"> 하 
									</c:if>
									<c:if test="${rBook.condition ==  2}">
										<input type="radio" name = "condition" value="0" onClick="return(false);"> 상 
										<input type="radio" name = "condition" value="1" onClick="return(false);"> 중 
										<input type="radio" name = "condition" value="2" checked disabled"> 하 
									</c:if> <br>
								*대여자 정보 : 
									대여자 아이디 : <input type="text" value="${rInfo.rentalerID }" readonly><br>
									대여일 : <input type="text" value="${rInfo.rentalDate }" readonly><br>
									반납일 :<input type="text" value="${rInfo.returnDate }" readonly><br>
								<input type="button" value = "확인" onClick="update()"> 
							</c:if>
							<c:if test="${rBook.state ==  0}"> <!-- 대여 중일 아닐 경우 -->
								대여 상태 : <input type="text" name = "rstate" value = "X " readonly> <br>
								포인트 : <input type="text" name = "rpoint" value = "${rBook.point}" > <br>
								책 소개 : <input type="text" name = "rexplain" value = "${rBook.explain}"> <br>
								책 상태 :
								 	<c:if test="${rBook.condition ==  0}">
										<input type="radio" name = "condition" value="0" checked> 상 
										<input type="radio" name = "condition" value="1" > 중 
										<input type="radio" name = "condition" value="2" > 하 
									</c:if>
									<c:if test="${rBook.condition ==  1}">
										<input type="radio" name = "condition" value="0" > 상 
										<input type="radio" name = "condition" value="1" checked > 중 
										<input type="radio" name = "condition" value="2" > 하 
									</c:if>
									<c:if test="${rBook.condition ==  2}">
										<input type="radio" name = "condition" value="0" > 상 
										<input type="radio" name = "condition" value="1"> 중 
										<input type="radio" name = "condition" value="2" checked> 하 
									</c:if> <br>
								<input type="button" value = "수정/확인" onClick="update()">
								<input type="button" value = "도서 내리기" onClick="remove('<c:url value='/user/rbook/remove' />')">  
							</c:if>
						</form>
					</div>
				</section>
			</div>
		</div>
		<footer id="footer">
			<div class="footer_area">
				<div class="list" >
					<ul style="width:100%" >
						<li> DBP 팀 프로젝트 </li>
						<li> 도서 관련 웹사이트 </li>
						<li> 목표 : 끝나고 다같이 맛있는 점심 사먹기 </li>
					</ul>
				</div>
			</div>
		</footer>
		
	</div>
</body>
</html>	