<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 책 개인 페이지 _ 상품 상세 등. -->
<title> bookinfo 객체에서 name 나오게 변환 예정.</title>
<style>
	body, div, span, p, a, font, ul, li, fieldset, form, legend, table {
		margin : 0;
		padding : 0;
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
	.main_searchForm fieldset {
		border : 0;
	}
	#container {
		width : 1100px;
		margin: 0 auto 0;
		padding-top : 25px;
		padding-bottom: 50px;
		min-height : 600px;
		background-color:#FFB6C1
	}
	.main {
	    z-index: 5;
	    width: 100%;
	    padding-bottom: 0;
	}
	
	.clearfix{
		display : block;
	}
	
	section {
		margin-bottom: 9px;
	    zoom: 1;
	    z-index: 2;
	    display : block;
	    position: relative;
	    float : left;
	}
	
	.bookInfo {
		width : 1000px;
		margin: 0 auto;
		padding-top : 25px;
		padding-bottom: 25px;
		margin-left : 40px;
		min-height : 250px;
		background-color:#FFFFFF;
	}
	
	.bookInfo .bookCover {
		position: relative;
	    float : left;
	    margin-top : 5px;
	    margin-bottom : 5px;
	    margin-left : 10px;
	    background-color:#FFFFE0;
	    min-height : 240px;
	    min-width : 200px;
	}
	
	.bookInfo .bookInfoDesc {
	    float : left;
		padding-bottom : 2px;
		margin-left : 60px;
		padding-left : 30px;
		word-wrap: break-word;
		text-align : justify;
		word-break: break-all;
		overflow: auto;
		white-space:normal;
	}
	
	.rentalItem {
		width : 970px;
		margin: 0 auto;
		margin-top : 15px;
		padding-top : 5px;
		padding-bottom: 5px;
		margin-left : 40px;
		min-height : 160px;
		background-color:#FFB6C1;
	}
	
	.rentalForm {
		margin : 0 auto;
		background-color:#FFFFFF;
		margin-left : 20px;
		
	}
	
	.rentalFor fieldset{
		 border: 1px solid #d1d1d1;
	}
	.rentalItem .bookCover {
		position: relative;
	    float : left;
	    margin-top : 5px;
	    margin-bottom : 5px;
	    margin-left : 10px;
	    background-color:#FFFFE0;
	    min-height : 120px;
	    min-width : 100px;
	}
	
	.rentalItem .rentalInfoDesc {
		position: relative;
	    float : left;
		padding-bottom : 2px;
		margin-left : 60px;
		padding-left : 30px;
		text-align : justify;
		word-break: break-all;
		display : block;
	}
	
	.rentalItem .rButton {
		min-height : 80px;
	    min-width : 60px;
	    float : right;
	    margin-top : 50px;
	    margin-right : 30px;
	    
	}

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
						<input tpye="text" id="search_text" name="search_kw" title = "검색어 입력"
						size="20" class="inputText">
						<input type="button" value="검색">
					</fieldset>
				</form>
				<div class = "myinfo">
					<%if (session.getAttribute("userId") == null) { %>
				    	<a href="loginForm.jsp" style="padding-left : 80px;">로그인 </a>
				    <% } else { %>
				    	<a href="userInfoPage.jsp" style="padding-left : 50px;"><%= session.getAttribute("userId") %> 님  정보</a>
				    	<span> | </span>
				    	<a href="logoutAction.jsp"> 로그아웃</a>
					<% } %>
				</div>
			</div>
		</header>
		<div id="container" class="main clearfix">
			<div class="main_content">
				<section id = "section">
					<div class="bookInfo">
						<div class="bookCover">
							<img src="./images/쏼라쏼라" alt="책 표지" class="coverImage">
						</div>
						<div class="bookInfoDesc">
							<div style="width:100%; word-break:break-all;word-wrap:break-word;">
								<p> 제목 : 과거를 쫒는 탐정들 : 과학은 어떻게 고고학의 수수께기를 풀었을까?
								<p> 로라 스캔디피오 저 / 류지이 역
								<p> 창비
								<p> 2020/11/06
								<p> 수학/과학
								<p> 상식이 뒤집히는 결정적 순간, 고고학 발굴의 현장 속으로!
								<!-- 글이 문장에 길어질 경우 텍스트 박스 칸을 벗어남. 고정시킬 필요있음. -->
							</div>
						</div>
					</div>
					<div class ="rentalBookList">
						<!-- 아래 틀을 jstl의 반복문을 사용해서 반복해서 보여주기. ~ 리스트 목록 / 10개 이상 존재 시 다음 페이지. -->
						<div class="rentalItem">
							<form class = "rentalForm" name = "rForm">
								<fieldset>
									<div class="bookCover">
										<img src="./images/쏼라쏼라" alt="책 표지" class="coverImage">
									</div>
									<div class="rentalInfoDesc">
											<p> 아이디 : zai0630
											<p> 상태 : 상
											<p> 포인트 : 500
											<p> 어쩌구 저쩌구 저는 재밌게 봤습니다. (rentalbook explain)
									</div>
									<div class="rButton">
										<input type = "button" value="대여하기"> <!-- 대여 시 원할 경우 팝업창 띄우기 -->
									</div>
								</fieldset>
							</form>
						</div>
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