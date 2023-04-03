<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
    <script src="/resources/js/jquery-3.6.0.js"></script>
	<!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!--font Notosans // 폰트 본고딕 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--font Black Dongle // 타이틀 폰트-->
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">

    <!--jquery ui .js-->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <!--jquery modal-->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
    <!--모달 and 알럿-->
    <script src="/resources/js/modal-alert.js"></script>
    <!-- 디폴트 커스텀 CSS -->
    <link rel="stylesheet" href="/resources/css/common/default.css" />
    <!--헤더 css-->
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    
</head>
<body>
	<div class="header-wrap">
        <div class="header-content">
        
            <div class="header-top">
            	<div class="top-menu">
            		<c:choose>
            			<c:when test="${empty sessionScope.m}">
            				<a href="/noticeList.do?reqPage=1">공지사항</a><span>|</span>
		                    <a href="#">회원가입</a><span>|</span>
		                    <a href="/loginFrm.do">로그인</a>
	                	</c:when>
	                	<c:when test="${sessionScope.m.memberStatus eq 1}">
	                		<a class="helloMsg">${sessionScope.m.memberName }님 환영합니다!</a>
	                		<a href="/noticeList.do?reqPage=1">공지사항</a><span>|</span>
		                    <a href="#">마이페이지</a><span>|</span>
		                    <a href="/logout.do">로그아웃</a>
	                	</c:when>
	               		<c:when test="${sessionScope.m.memberStatus eq 0}">
	               			<a href="/noticeList.do?reqPage=1">공지사항</a><span>|</span>
		                    <a class="staffMsg">관리자 버전으로 접속중입니다.</a>
		                    <a href="/logout.do">로그아웃</a>
	                	</c:when>
                	</c:choose>
           		</div><!-- top-menu -->
			</div><!-- header-top -->
			
            <div class="header-middle">
            	<div class="middle-left">
	                <a href="/" class="title">뭉쳐야산다</a>
                </div>
                <div class="middle-center">
	                <div class="mainSearch">
	                	<input type="text" class="mainSearch-input" placeholder="검색어를 입력하세요">
	                	<span class="material-symbols-outlined">search</span>
		            </div>
	            </div>
                <div class="middle-right">
	                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">notifications</span></a>
	                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">favorite</span></a>
	                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">shopping_cart</span></a>
            	</div>
            </div>

            <div class="header-bottom">
                <div class="menu-category">
	                <a href="#">
                	<span class="material-symbols-outlined">reorder</span>
                	카테고리
	                </a>
					 <!-- dropdown메뉴 -->
					 <div class="category-dropdown">
					 	<div>
					      	<ul>
					      		<li>대분류</li>
					      		<li><a href="#">소분류</a></li>
					      		<li><a href="#">소분류</a></li>
					      	</ul>
					      	<ul>
					      		<li>대분류</li>
					      		<li><a href="#">소분류</a></li>
					      		<li><a href="#">소분류</a></li>
					      	</ul>
					      	<ul>
					      		<li>대분류</li>
					      		<li><a href="#">소분류</a></li>
					      		<li><a href="#">소분류</a></li>
					      	</ul>
					      	<ul>
					      		<li>대분류</li>
					      		<li><a href="#">소분류</a></li>
					      		<li><a href="#">소분류</a></li>
					      	</ul>
					      	<ul>
					      		<li>대분류</li>
					      		<li><a href="#">소분류</a></li>
					      		<li><a href="#">소분류</a></li>
					      	</ul>
				      	</div>
			    	</div><!-- dropdown메뉴 -->
                </div>
                
                <div><a href="#">오늘의상품</a></div>
                <div><a href="#">타임딜</a></div>
                <div><a href="#">인기상품</a></div>
                <div class="together">
                	<a href="/boardList.do">
               		 여기여기붙어라
               		 <span class="material-symbols-outlined recommend">recommend</span>
               		</a>
                </div>
            </div>
            
        </div><!--header-content-->
    </div><!--header-wrap-->

    <script>
    	$(".menu-category").hover(function(){
    		$(".category-dropdown").slideToggle();
    		$(".category-dropdown").css("display","flex");
    	})
    		
    </script>
</body>
</html>