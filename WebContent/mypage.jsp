<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
	%>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<style>
			body {
				text-align : center;
				margin : 0;
				padding : 0;
			}
			a {
				text-decoration : none;
				color : gray;
			}
			.clear_both {
				clear: both;
			}
			/* header */
			#header_id {
				width : 1080px;
				height : 85px;
				margin : 10px auto 0 auto; 
			}
			.header_div div {
				float : right; 
				font-size : small; 
				width : 70px; 
				text-align:right; 
			}
			.header_div div a {
				text-decoration : none;
				color:black;
			}
			.header_div div > a:hover {
				color : blue;
			}
			/* nav */
			#nav_id {
				width : 100%;
				height : 50px;
				font-weight: bold;
			}			
			.nav_div {
				width : 1080px;
				height : 50px;
				margin : auto;
				padding-top : 15px;
			}
			.nav_div ul {
				margin : 0;
				padding : 0;
			}
			.nav_div li{
				float : left;
				list-style-type: none;
			}
			.nav_div > ul > li > div {
				width : 216px;
			}
			.navbox { 
				width:100%; 
				height:50px; 
				background:gray; 
	  			position:absolute; 
	  			left:0; top:145px;
	  			font-size: small;
  			}
  			.navbox > div {
				width : 1080px;
				height : 50px;
				margin : auto;
				line-height: 50px;
  			}
  			.navbox > div > div {
				margin : auto;				
				width : 600px;
				height : 50px;
  			}
  			.navbox > div > div > div {
  				width : 150px;
  				float : left;
  			}
  			.navbox div a {
				color:white;
			}
			.navbox div a:hover {
				color:black;
			}
  			.navbox2 { 
				width:100%; 
				height:50px; 
				background:gray; 
	  			position:absolute; 
	  			left:0; top:145px;
	  			font-size: small;
  			}
  			.navbox2 > div {
				width : 1080px;
				height : 50px;
				margin : auto;
				line-height: 50px;
  			}
  			.navbox2 > div > div {
				margin : auto;				
				width : 300px;
				height : 50px;
  			}
  			.navbox2 > div > div > div {
  				width : 150px;
  				float : left;
  			}
  			.navbox2 div a {
				color:white;
			}
  			.navbox2 div a:hover {
				color:black;
			}
  			.navbox3 { 
				width:100%; 
				height:50px; 
				background:gray; 
	  			position:absolute; 
	  			left:0; top:145px;
	  			font-size: small;
  			}
  			.navbox3 > div {
				width : 1080px;
				height : 50px;
				margin : auto;
				line-height: 50px;
  			}
  			.navbox3 > div > div {
				margin : auto;				
				width : 300px;
				height : 50px;
  			}
  			.navbox3 > div > div > div {
  				width : 150px;
  				float : left;
  			} 
  			.navbox3 div a {
				color:white;
			}
			.navbox3 div a:hover {
				color:black;
			}  
  			/* section */
  			#section_id { 
  				height : 1400px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
  				background: url("image/mainListbg.gif") no-repeat;
    			background-size: cover !important;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  				text-align : left;
  			}
  			#section_id article {
  				width : 1036px;
  				height : 1200px;
  				margin : auto;
  				/*background-color : white;*/
  			}	
  			article > div {				
  				width : 1300px;
  				height : 152px;
  				margin : auto;		
  			}
  			article input {
  				background-color : #40AA82;
				color : white;
				border-width : 0;
  			}
  			article > div > div {			
  				float : left;
  				width : 250px;	
  				height : 150px;
  				line-height : 70px;
  				border : 1px solid;
  				border-color : #E0E0E0;
  				background-color : white;
  			}
  			article > div > div:nth-child(2n+1) {
  				width : 391px;	
  				background-color : #D5D5D5;
  			}
  			article > div > div:first-child {
  				border-right : 0px;	
  			}
  			article > div > div:first-child > div {	
  				width : 250px;
  				margin-left : 0px;
  			}
  			article > div > div:first-child > div:first-child {
  				width : 100px;
  				margin-left : 10px;
  				height : 140px;
  			}  	
  			article > div > div:last-child {
  				border-left : 0px;	
  			}  			
  			article > div > div > div {
  				float : left;	
  				margin-left : 10px;
  			}
  			.emoney > div {
  				margin-left : 0px;
  				width : 125px;
  			}
  			.emoney input {
  				width : 100px;
  				margin-top : 15px;
  				height : 30px;
  			}
  			.emoney font {
  				color : #114DAD;
  			}
  			.mymenu input {
  				width : 100px;
  				height : 30px;
  			}
  			.mymenu > div {
  				margin-left : 15px;
  				margin-right : 15px;
  				width : 350px;
  			}
			/* footer */
  			#footer_id {
  				background-color : #8C8C8C;
  				height : 200px; 
  				text-align : left;
  			}
			#footer_id .footer_div { 
				width : 1080px; 
				margin : auto; 
				color : #BDBDBD; 
				font-size : small;
			}
			.footer_div div:first-child {  
				height : 70px; 
				line-height : 80px; 
				color:black;
			}
			.footer_div div:nth-child(5) {  
				height : 50px; 
				line-height : 85px; 
			}		
		</style>	
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		function update(form) {
			location.href = "update_mypage_db.jsp";
		}
		function delete_page(form) {
			location.href = "delete_mypage.jsp";
		}
		function update_pw(form) {
			location.href = "update_mypage_pw_change.jsp";
		}
		$(function (){
			$(".navbox").hide();
			$(".navbox2").hide();
			$(".navbox3").hide();

			$(".nav_div > ul > li:nth-child(2) > div > a").mouseenter(function(){
				$(".navbox2").fadeOut(100);
		        $(".navbox3").fadeOut(100);
		        $(".navbox").fadeIn(100);
	       	});
			$(".nav_div > ul > li:nth-child(3) > div > a").mouseenter(function(){
				$(".navbox").fadeOut(100);
				$(".navbox3").fadeOut(100);
		        $(".navbox2").fadeIn(100);
	       	});
	       	$(".nav_div > ul > li:nth-child(4) > div > a").mouseenter(function(){
	       		$(".navbox").fadeOut(100);
	       		$(".navbox2").fadeOut(100);
		        $(".navbox3").fadeIn(100);
	       	});		       		
			$(".navbox").mouseleave(function(){
	            $(".navbox").fadeOut(100);
       		});
			$(".navbox2").mouseleave(function(){
	            $(".navbox2").fadeOut(100);
       		});
       		$(".navbox3").mouseleave(function(){
	            $(".navbox3").fadeOut(100);
       		});      
	        $(".action").click(function(){
	        	window.open("https://terms.naver.com/entry.naver?docId=566457&cid=46625&categoryId=46625", "action","width = 800, height = 650, left = 300, top = 150");
	        });     		
		});
	</script>

	<body>
	<form>
		<header id="header_id">
			<div class="header_div">
				<div><a href='logout.jsp'>로그아웃</a></div>
				<div><a href='mypage.jsp'>내정보</a></div>
			</div>
			<div class ="clear_both">
				<a href="index.jsp"><img src= "image/logo.png" /></a>
			</div>
		</header>
		
		<nav id ="nav_id">
			<div class ="nav_div">
				<ul>
					<li><div><a href="homepage_introduce.jsp">경매가이드</a></div></li>
					<li><div><a href='online_action.jsp'>온라인경매</a></div></li>
					<li><div><a href="community.jsp">커뮤니티</a></div></li>
					<li><div><a href="customer.jsp">고객센터</a></div></li>
					<li><div><a href='mypage.jsp'>마이페이지</a></div></li>	
				</ul>	
			</div>
			<div class ="navbox">
				<div>
					<div>
						<div><a href="#">전체보기</a></div>
						<div><a href="#">추천경매</a></div>
						<div><a href="#">인기경매</a></div>
						<div><a href="#">오늘마감</a></div>
					</div>
				</div>
			</div> 
			<div class ="navbox2">
				<div>
					<div>
						<div><a href="community_adminboard.jsp">공지사항</a></div>
						<div><a href="community_freeboard.jsp">자유게시판</a></div>
					</div>
				</div>
			</div>
			<div class ="navbox3">
				<div>
					<div>
						<div><a href="#">자주묻는 질문</a></div>
						<div><a href="#">1:1문의</a></div>
					</div>
				</div>
			</div>
		</nav>

		<section id ="section_id">
			<div><h1>마이페이지</h1></div>
			<article>
				<div>
					<div>
						<div>
							<b><% out.println(name + "님"); %></b><br>
							<a href= "#">[쪽지 0건]</a>
						</div>
						<div>
							구매등급 : NORMAL<br>
							판매등급 : NORMAL
						</div>
					</div>
					<div class="emoney">
						<div><b>이머니</b></div>
						<div><b><font>0원</font></b></div>
						<div><input type = "button" value = "충전"></div>
						<div><input type = "button" value = "출금"></div>
					</div>
					<div class="mymenu">
						<div>
							<input type = "button" value = "정보수정"  onclick = "update(this.form)">&nbsp;&nbsp;
							<input type = "button" value = "비밀번호변경" onclick = "update_pw(this.form)">&nbsp;&nbsp;
							<input type = "button" value = "회원탈퇴"  onclick = "delete_page(this.form)">
						</div>
						<div>
							<input type = "button" value = "나의 신용도">&nbsp;&nbsp;
							<input type = "button" value = "나의 쪽지함">&nbsp;&nbsp;
							<input type = "button" value = "관심물품">
						</div>
					</div>
				</div>

			</article>
		</section>

    <footer id = "footer_id">
        <div class = "footer_div"> 
            <div>경매가이드 | 서비스이용약관 | 고객문의 | 사이트맵 </div>
            <div>상호명 : (주)코베이옥션 / 대표이사: 김민재 / 주소: 서울특별시 종로구 삼일대로 457 601-607호</div>
            <div>Tel: 02-738-1268 (정확한 상담을 위해 통화내용이 저장됩니다. ) Fax : 02-738-1269 메일 : master@kobay.co.kr</div>
            <div>사업자등록번호 : 101-81-52101 통신판매업 신고번호 : 제01 – 2225호</div>
            <div>코베이옥션에서 등록된 오픈마켓 상품은 개별판매자가 시스템을 이용하여 등록한 것으로서 코베이는 등록된 상품과 그 내용에 대하여 일체의 책임을 지지 않습니다</div>
            <div>Copyright(c) 1999, kobayauction,lnc All rights reserved.</div>
        </div>
    </footer>
		
	</form>
	</body>
</html>