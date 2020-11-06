<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>homePage_book service</title>
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
	
	.recommand_book {
		position: relative;
		float : left;
		width : 860px;
		overflow: hidden;
	}
	
	.rec_bookCover {
		float : left;
		width : 50%;
		height : 600px;
		background-color : white;
		margin-left : 10px;
		margin-right : 10px;
	}
	.rec_bookDesc {
		float : left;
		width : 45%;
		height : 600px;
		background-color : #FFFFE0;
		
	}
	.go_category {
		position: relative;
	    z-index: 200;
	    float: right;
	    width: 20%;
	    height: 600px;
	    padding: 2px;
	    border: 1px solid #d1d1d1;
	    background: #fff;
	    margin-right : 10px;
	}
	
	.go_category li {
		margin : 15px 20px;
		padding : 10;
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
				    	<a href="<c:url value='/user/login/form'/>" style="padding-left : 80px;">로그인 </a>
				    <% } else { %>
				    	<a href="userInfoPage.jsp" style="padding-left : 50px;"><%= session.getAttribute("userId") %> 님  정보</a>
				    	<span> | </span>
				    	<a href="<c:url value='/user/logout'/>"> 로그아웃</a>
					<% } %>
				</div>
			</div>
		</header>
		<div id="container" class="main clearfix">
			<div class="main_content">
				<section class="section">
					<div class="recommand_book">
						<div class="rec_bookCover">
							<img src="./images/쏼라쏼라" alt="책 표지" class="coverImage">
						</div>
						<div class="rec_bookDesc">
							<p>책 소개 및 추천 
								<h1> 문어의 꿈</h1>
								<p>나는 문어 꿈을 꾸는 문어
								꿈속에서는 무엇이든지 될 수 있어
								나는 문어 잠을 자는 문어
								잠에 드는 순간 여행이 시작되는 거야
								높은 산에 올라가면 나는 초록색 문어
								장미 꽃밭 숨어들면 나는 빨간색 문어
								횡단보도 건너가면 나는 줄무늬 문어
								밤하늘을 날아가면 나는
								오색찬란한 문어가 되는 거
								야 아아아 아아 야 아아아 아아
								깊은 바닷속은 너무 외로워
								춥고 어둡고 차갑고 때로는 무섭기도
								해 애애애 애애 야 아아아 아아
								그래서 나는 매일 꿈을 꿔 이곳은 참 우울해</p>
							</p>
						</div>
					</div>
					<div class="go_category">
						<h3><b>&nbsp; *장르별 모아보기</b></h3>
						<!-- 리스트 내 장르별로 링크 걸어둘 예정 -->
						<ul style="list-style: none;">
							<li><a href=".">로맨스</a> </li>
							<li><a href="."> 판타지</a> </li>
							<li><a href="."> 액션</a> </li>
							<li><a href="."> 코믹 </a></li>
							<li><a href="."> 드라마</a> </li>
							<li><a href="."> 문학 </a></li>
							<li><a href="."> 스포츠 </a> </li>
							<li><a href="."> 공포</a> </li>
							<li><a href="."> 추리</a> </li>
							<li><a href="."> 아동</a> </li>
							<li><a href="."> 게임 </a></li>
							<li><a href="."> 무협</a> </li>
							<li><a href="."> 역사 </a></li>
							<li><a href="."> 라이트노벨 </a> </li>
						</ul>
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