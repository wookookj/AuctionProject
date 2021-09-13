<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>경매홈페이지</title>
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
  				height : 905px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
  			}
			#mainbanner_sub {
				width : 80px; 
				margin : auto;
			}
			#mainbanner_sub div {
				float : left;
			}
			#mainbanner_sub img {
				width : 20px; 
				height : 20px; 
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
		$(function (){
			$(".navbox").hide();
			$(".navbox2").hide();
			$(".navbox3").hide();
			$(".mainbanner_sub_1 > img").attr('src',"image/jum2.png");
        	var count = 1;
        	var k = setInterval(autochange, 5000);

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

	       	$(".mainbanner_sub_1 > img").click(function(){ 
	            clearInterval(k); 
	            $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	            $(this).attr('src',"image/jum2.png");                      
	            $('#mainbanner img').attr('src',"image/1.jpg"); 
	            $('#mainbanner img').hide().fadeIn();        
	        });

	        $(".mainbanner_sub_2 > img").click(function(){ 
	            clearInterval(k);     
	            $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	            $(this).attr('src',"image/jum2.png"); 
	            $('#mainbanner img').attr('src',"image/2.jpg"); 
	            $('#mainbanner img').hide().fadeIn();
	        });

	        $(".mainbanner_sub_3 > img").click(function(){
	            clearInterval(k);      
	            $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	            $(this).attr('src',"image/jum2.png"); 
	            $('#mainbanner img').attr('src',"image/3.jpg");
	            $('#mainbanner img').hide().fadeIn();
	        });

	        $(".mainbanner_sub_4 > img").click(function(){
	            clearInterval(k);         
	            $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	            $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	            $(this).attr('src',"image/jum2.png");   
	            $('#mainbanner img').attr('src',"image/4.jpg"); 
	            $('#mainbanner img').hide().fadeIn();
	        });     

	        function autochange() {
	            if(count == 1) {
	                $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_1 > img").attr('src',"image/jum2.png");            
	                $('#mainbanner img').attr('src',"image/1.jpg"); 
	               // $('#mainbanner img').hide().fadeIn();        
	                count++;
	            }  
	            else if(count == 2) {
	                $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_2 > img").attr('src',"image/jum2.png");  
	                $('#mainbanner img').attr('src',"image/2.jpg"); 
	                //$('#mainbanner img').hide().fadeIn();
	                count++;
	            } 
	            else if(count == 3) {
	                $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_4 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_3 > img").attr('src',"image/jum2.png"); 
	                $('#mainbanner img').attr('src',"image/3.jpg");
	                //$('#mainbanner img').hide().fadeIn();
	                count++;
	            }
	            else {  
	                $(".mainbanner_sub_1 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_2 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_3 > img").attr('src',"image/jum.png");
	                $(".mainbanner_sub_4 > img").attr('src',"image/jum2.png"); 
	                $('#mainbanner img').attr('src',"image/4.jpg"); 
	                //$('#mainbanner img').hide().fadeIn();    
	                count = 1;
	            }
	        }     		
		});
	</script>

	<body>
	<form>
		<header id="header_id">
			<div class="header_div">
				<%
					String id = (String)session.getAttribute("id");
					if(id != null) {
						out.println("<div><a href='logout.jsp'>로그아웃</a></div>");
						out.println("<div><a href='mypage.jung?id="+id+"'>내정보</a></div>");					
					}
					else {
						out.println("<div><a href='signup_chk.jsp'>회원가입</a></div>");
						out.println("<div><a href='login.jsp'>로그인</a></div>");
					}
				%>
			</div>
			<div class ="clear_both">
				<a href="index.jsp"><img src= "image/logo.png" /></a>
			</div>
		</header>
		
		<nav id ="nav_id">
			<div class ="nav_div">
				<ul>
					<li><div><a href="homepage_introduce.jsp">경매가이드</a></div></li>
					<li><div><a href="online_action_list.wookook">온라인경매</a></div></li> <!-- MVC 구조 온라인 경매 -->
					<li><div><a href="boardList.bo">커뮤니티</a></div></li> <!-- MVC 구조 게시판 -->
					<li><div><a href="customer.jsp">고객센터</a></div></li>
					<li><div><a href="mypage.jung?id=<%=id%>">마이페이지</a></div></li> <!-- MVC 구조 마이페이지 -->			
				</ul>	
			</div>
			<div class ="navbox">
				<div>
					<div>
						<div><a href="online_action_list.wookook">전체보기</a></div>
						<div><a href="online_action_list(random).wookook">추천경매</a></div>
						<div><a href="online_action_list(hot).wookook">인기경매</a></div>
						<div><a href="online_action_list(today).wookook">오늘마감</a></div>
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
			<article>
				<div id="mainbanner">
       				<a href="#"><img src = "image/1.jpg" /></a>
   				</div>
			    <div id="mainbanner_sub">
			        <div class="mainbanner_sub_1"><img src = "image/jum.png"></div>
			        <div class="mainbanner_sub_2"><img src = "image/jum.png"></div>
			        <div class="mainbanner_sub_3"><img src = "image/jum.png"></div>
			        <div class="mainbanner_sub_4"><img src = "image/jum.png"></div>
			    </div>
			    <div class="clear_both">
			    	<img src = "image/footBannerbg.jpg" />
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