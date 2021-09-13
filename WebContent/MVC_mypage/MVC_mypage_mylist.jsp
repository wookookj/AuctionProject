<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "vo.MypageBean"%>
<%@ page import = "vo.OnlineActionBean"%>
<%@ page import = "vo.OnlineActionBuyBean"%>
<%@ page import = "vo.OnlineActionNowBean"%>
<%@ page import = "java.util.*"%>
<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
		ArrayList<OnlineActionNowBean> articleMoneyList = (ArrayList<OnlineActionNowBean>)request.getAttribute("articleMoneyList");
		ArrayList<OnlineActionBean> articleList = (ArrayList<OnlineActionBean>)request.getAttribute("mypagelist");	
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
  				height :auto;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 30px auto;
  				text-align : left;
  			}
  			#section_id article {
  				width : 1036px;
  				height : auto;
  				margin : auto;
  				min-height: 600px;
  				padding-bottom : 100px;
  				/*background-color : white;*/
  			}	
  			article > div {				
  				width : 1036px;
  				height : 152px;
  				margin : 0 auto 10px auto;		
  			}
  			article input {
  				background-color : #40AA82;
				color : white;
				border-width : 0;
				height : 30px;
				width : 100px;
  			}
  			article > div > div {			
  				float : left;
  				width : 240px;	
  				height : 150px;			
  				background-color : white;
  				font-size : 15px;
  			}
  			article > div > div:first-child {			
  				line-height : 145px;
  			}
  			article > div > div:nth-child(2) {			
  				width : 796px;	
  			}
  			article > div > div:nth-child(2) > div { 				
  				margin-left : 30px;	
  				margin-top : 13px;
  				width : 350px;	
  				float : left;
  				height : 30px;
  				line-height : 30px;
  				text-align : left;
  			}
  			article > div > div:nth-child(2) > div:last-child { 				
				text-align : right;
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
  				width : 130px;
  				height : 40px;
  			}
  			.mymenu > div {
  				margin-left : 15px;
  				margin-right : 15px;
  				width : 350px;
  			}
  			.action_sell {
  				overflow:auto;
  				height : auto;
  				width : 1200px;
  				margin-bottom : 0;
  			}
  			.action_sell > div {				
  				height : 150px;
  				border-left : 0;
  				border-top : 1px solid;
  				border-right : 0;
  				border-color : #F6F6F6;
  			}
  			.action_sell > div:first-child{
  				border-top : 0;
  			}
  			.action_sell > div:nth-child(2){
  				border-top : 0;
  			}
  			.action_sell > div:nth-child(3){
  				border-top : 0;
  			}
  			.action_sell img {
  				max-height : 100%;
  				max-width : 100%;
  				vertical-align:middle;
  			}
  			.action_sell_first {
  				height : 150px;
				width : 240px;
				line-height : 145px;
				/*border-right : 1px solid;*/
  			}
  			.action_sell_last {
  				width : 796px;
  			}
  			.action_buy_last {
  				width : 796px;
  			}
  			.action_sell_last b {
  				color : #114DA5;
  			}
  			.action_buy_last b {
  				color : #114DA5;
  			}
  			.action_buy_last u {
  				text-decoration: none;
  				color : #F361DC;
  				font-weight : bold;
  			}
  			.action_sell_no_first {
  				width : 240px;
  				opacity: 0;
  				border : 0;
  			}
  			.action_sell_no_last {
  				width : 796px;
  				opacity: 0;
  				border : 0;
  			}
  			.action_sell_last > div:first-child {
  				width : 100%;
  				margin-left : 0;
  			}
  			.action_buy_last > div:first-child {
  				width : 100%;
  				margin-left : 0;
  			}  			
  			.action_sell > div:last-child {
  				margin-bottom : 50px;			
  			}
  			.action_sell_last > div  div {
  				float : left;
  				width : 248px;
  				height : 150px;
  				line-height : 150px;
  			}
  			.action_buy_last > div  div {
  				float : left;
  				width : 150px;
  				height : 150px;
  				line-height : 150px;
  			}
  			.action_sell_last > div > div:first-child {
  				width : 150px;
  			}
  			.action_sell_last > div > div:nth-child(2){
  				width : 150px;
  			}
  			.action_buy_last > div > div:nth-child(2){
  				width : 80px;
  				text-align : left;
  			}
  			.action_buy_last > div > div:nth-child(3){
  				width : 195px;
  			}
  			.action_buy_last > div > div:nth-child(4){
  				width : 210px;
  			}
  			.action_buy_last > div > div:last-child {
  				width : 160px;
  			}
  			.text_left {
  				text-align : left;
  				height : 30px;
  				font-size : 24px;
  				margin-bottom : 30px;
  			}
  			.text_left img {
  				height : 20px;
  			}
  			.text_left b {
  				color : #114DA5;
  			}
  			.action_buy {
  				width : 1036px;
  				text-align : left;
  				font-size : 24px;
  				height : 30px;
  				margin-bottom : 30px;
  				margin-top : 100px;
  			}
  			.action_buy img {
  				height : 20px;
  			}
  			.action_buy b {
				color : #114DA5;
  			}
  			#imageView {
				max-height : 150px;
  				max-width : 240px;
  				vertical-align:middle;
			}
			.mylist_no {
				width : 1036px;
				height : 550px;
			}
			.mylist_no > div {
				height : 200px;
				width : 1036px;
				padding-top : 150px;
				padding-bottom : 150px;
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
			.slideup {
				position : fixed;
				bottom : 100px;
				left : 96%;
				width : 50px;
				height : 50px;
				background-color : #5D5D5D;
				line-height : 50px;
				color : white;
				margin-bottom : 0;
			}
			.slidedown {
				position : fixed;
				bottom : 50px;
				left : 96%;
				width : 50px;
				height : 50px;
				background-color : #eeeeee;
				line-height : 50px;
				margin-bottom : 0;
			}
		</style>	
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script> 
		window.onload = function(){ 
			// ajaxTime();
			// ajaxMoney();	
			// var ajaxtime = setInterval("ajaxTime()", 1000); 
			// var ajaxmoney = setInterval("ajaxMoney()", 1000); 	
		  timecolor();
		  setInterval("timecolor()",2000);
		  setTimeout("goReLoad()",60000);
		} 
		function goReLoad(){ 
			document.location.reload(); 
		} 
		function timecolor_pink() {
			$(".time_out b").css("color","red");
		}
		function timecolor_black() {
			$(".time_out b").css("color","black");
		}
		function timecolor() {
			timecolor_pink();
			setTimeout("timecolor_black()",1000);
		}
	</script> 
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
		function mylist() {
			location.href = "mypage_mylist_view.jung?id=<%=id%>";
		}
		$(function (){
			$(".navbox").hide();
			$(".navbox2").hide();
			$(".navbox3").hide();

			$('.slideup').click(function(){
				$('html,body').animate( {scrollTop : 0},400);
				return false;
			});
			$('.slidedown').click(function(){
				var scrollHeight = $(document).height();
				$('html,body').animate( {scrollTop : scrollHeight},400);
				return false;
			});
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
				<div><a href="mypage.jung?id=<%=id%>">내정보</a></div>
			</div>
			<div class ="clear_both">
				<a href="index.jsp"><img src= "image/logo.png" /></a>
			</div>
		</header>
		
		<nav id ="nav_id">
			<div class ="nav_div">
				<ul>
					<li><div><a href="homepage_introduce.jsp">경매가이드</a></div></li>
					<li><div><a href="online_action_list.wookook">온라인경매</a></div></li>
					<li><div><a href="boardList.bo">커뮤니티</a></div></li> 
					<li><div><a href="customer.jsp">고객센터</a></div></li>
					<li><div><a href="mypage.jung?id=<%=id%>">마이페이지</a></div></li>
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
			<div><h1>마이페이지 > 관심물품</h1></div>
			<article>
				<% if( articleList.size() == 0) {%>
					<div class ="mylist_no">
						<div><h1>관심물품으로 등록한 물품이 없습니다</h1></div>
					</div>
				<% } %>
				<% for(int i = 0; i < articleList.size(); i++) {%>
					<script>
								var money = 0;
								<% if(articleMoneyList == null) { %>
									money = <%= articleList.get(i).getAction_start_money()%>;
								<% } else {%>
									<% for(int k =0; k <articleMoneyList.size(); k ++) { 
										if(articleList.get(i).getAction_num() == articleMoneyList.get(k).getAction_num()) { %>
											money = <%= articleMoneyList.get(k).getAction_end_money()%>;
										<% break;} else {%>
											money = <%= articleList.get(i).getAction_start_money()%>;
										<% } %>
									<% } %>
								<% } %>
					</script>
				<% 
					String path = "onlineactionfileupload/" + articleList.get(i).getAction_file(); 
				%>	
					<div class ="mypage">
						<div><a href="online_action_click.wookook?action_num=<%= articleList.get(i).getAction_num() %>"><img src="<%= path %>" id ="imageView"></a></div>
						<div>
							<div>물품번호 : <%= articleList.get(i).getAction_num() %></div>
							<div>물품명 : <%= articleList.get(i).getAction_name() %></div>
							<div>입찰수 : <%= articleList.get(i).getAction_buy() %></div>
							<div>현재가 : <b><script>var replacemoney = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								document.write(replacemoney);</script>원</b></div>
							<div class = "time_out">남은시간 : <b id ="time_exit"><%= articleList.get(i).getAction_time() %></b></div>
							<div><input type="button" value="삭제" onclick = "location.href='mypage_mylist_delete.jung?action_num=<%=articleList.get(i).getAction_num()%>&id=<%=id%>'"></div>
						</div>
					</div>
				<% } %>
			</article>
		</section>
		<div class ="slideup">▲</div>
		<div class ="slidedown">▼</div>

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