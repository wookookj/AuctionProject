<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
	%>
	<head>
		<meta charset="UTF-8">
		<title>판매등록</title>
		<style>
			body {
				text-align : center;
				margin : 0;
				padding : 0;
			}
			a {
				text-decoration : none;
				color:gray;
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
			.header_div a {
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
  				height : 800px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
  				background: url("image/mainListbg.gif") no-repeat;
    			background-size: cover !important;
  				text-align : left;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  			}
  			#section_id article {
  				width : 1036px;
  				height : 600px;
  				margin : auto;
  				background-color : #eeeeee;
  				border-radius: 4px;
  			}
  			#section_id article > div {
  				float : left;
  				height : 480px;
  				width : 518px;
  				margin-top : 10px;
  			}
  			#section_id article > div:first-child {
  				margin-left : 10px;
  			}  			
  			#section_id article  div:nth-child(2) {
  				width : 508px;
  			}  					
  			#section_id article div img {
  				height : 480px;
  				width : 518px;
  			}
  			#section_id article div:nth-child(3) {
  				margin-top : 15px;
  				margin-left : 10px;
  				height : 25px;
  				width : 518px;
  			} 
  			#section_id article > div:last-child {
  				height : 25px;
  				width : 1026px;
  				margin : 30px 10px 0 10px;
  			}
  			#section_id article div:last-child div {
  				float: left;
  				height : 25px;
  				width : 490px;
  			} 
  			#section_id article div:last-child div:last-child {
  				text-align : right;
  			}   			  			  						
  			#section_id article div ul {
  				list-style-type: none;
  				margin : 0;
  				padding : 0;
  			}
  			#section_id article div ul li{
  				height : 80px;
  				margin-left :30px;
  				line-height : 80px;
  				text-align : center;
  			}	
  			#section_id article div ul li select{
  				width : 100px;
  				background-color : white;
  				border-color : white;		
  			}
  			#section_id article div ul li input{
  				width : 95px;
  				text-indent : 2%;
  				background-color : white;	
  				border-color : white;
  				border : 0;
  			}  		
  			.action_sell {
				background-color : #6799FF;
				color : white;
				border-width : 0;
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
       		$(".image_choice").change(function(){
       			alert(this.value);
       			//fake 경로만 보여줌
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
					<li><div><a href="mypage.jsp">마이페이지</a></div></li>
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
			<form>
				<div><h1>온라인 경매 > 판매등록</h1></div>
				<article>
					<div><img src ="http://placehold.it/518x480"></div>
					<div>
						<ul>
							<li>경매기간&nbsp;&nbsp;&nbsp;
									<select name="action_day">
										<option value="1">1시간</option>
										<option value="2">2시간</option>
										<option value="6">6시간</option>
										<option value="12">12시간</option>
										<option value="24">24시간</option>
										<option value="48">48시간</option>
										<option value="72">72시간</option>
									</select>
							</li>
							<li>시작가격&nbsp;&nbsp;&nbsp;
									<input type="text" name="search" maxlength="10">
							</li>
							<li>입찰단위&nbsp;&nbsp;&nbsp;
									<select name="action_startmoney">
										<option value="1000">1000</option>
										<option value="2000">2000</option>
										<option value="5000">5000</option>
										<option value="10000">10000</option>
										<option value="30000">30000</option>
										<option value="50000">50000</option>
										<option value="100000">100000</option>
									</select>
							</li>
							<li>물품종류&nbsp;&nbsp;&nbsp;
									<select name="action_startkind">
										<option value="도서">도서</option>
										<option value="미술품">미술품</option>
										<option value="중고생활용품">중고생활용품</option>
										<option value="기타">기타</option>
									</select>
							</li>
							<li>배송방법&nbsp;&nbsp;&nbsp;
									<select name="action_deliver">
										<option value="택배(착불)">택배(착불)</option>
										<option value="직거래">직거래</option>
									</select>
							</li>
							<li>연령제한&nbsp;&nbsp;&nbsp;
									<select name="action_age">
										<option value="전체">전체</option>
										<option value="19세이상">19세이상</option>						
									</select>
							</li>
						</ul>
					</div>
					<div>
						<input type="file" name="image_choice" class="image_choice" accept=".jpg,.jpeg,.png,.gif">
					</div>
					<div>
						<div>판매자 ID : <%= id %></div>
						<div><input type="submit" name="action_sell" class = "action_sell"value="판매등록"></div>
					</div>
				</article>
			</form>
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