<%@ page language = "java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.OnlineActionBean"%>
<%@ page import = "vo.OnlineActionNowBean"%>
<%@ page import = "vo.PageInfo"%>
<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
	   String birth = (String)session.getAttribute("birth");
	   String birth_chk = null;
		if(id == null || birth == null) {
			birth = "0000";
			out.print("<script>location.href='nologin.jsp';</script>");
		}
		if(birth != null) {
			birth_chk = birth.substring(0,4);
		}
		
		ArrayList<OnlineActionBean> articleList = (ArrayList<OnlineActionBean>)request.getAttribute("articleList");
		ArrayList<OnlineActionNowBean> articleMoneyList = (ArrayList<OnlineActionNowBean>)request.getAttribute("articleMoneyList");
	    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); 
	    
		int listCount=pageInfo.getListCount();
		int nowPage=pageInfo.getPage();
		int maxPage=pageInfo.getMaxPage();
		int startPage=pageInfo.getStartPage();
		int endPage=pageInfo.getEndPage();
	%>
	<head>
		<meta charset="UTF-8">
		<title>온라인경매</title>
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
  				height : 1500px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  			}
  			#container {
  				width : 1080px;
  				margin : 50px auto;
  				height : 1400px;
  			}
  			#container > div {
  				text-align: left;
  				margin : 0 0 0 22px;
  			}

			#container .item {
				width : 240px; 
				margin : 10px 0 0 22px;
				height: auto;
				text-align: center;
				float : left;
				background-color : white;
			}
			.item > div:first-child {
				height : 240px;
				width : 240px;
				line-height : 235px;
				background-color : #F6F6F6;
				/*border-bottom : 1px solid;
				border-color : #F6F6F6;*/
			}
			.item > div:nth-child(2) {
				height : 50px;
				line-height : 50px;
				font-size : small;
			}
			.item > div:nth-child(3) {
				background-color: #eeeeee;
				height : 25px;
				line-height : 25px;
			}
			.item div:nth-child(4) > div {
				font-size : small;
				float : left;
				width : 120px;
				text-align : left;
				line-height : 25px;
				border-color : #BCBCBC;
			}	
			.item div:nth-child(4) > div > div{
				width : 60px;
				text-indent : 5%;
				float : left;
			}
			.item div:nth-child(4) > div > div:last-child{
				text-align : left;
				text-indent : 20%;
			}
			.item div:nth-child(5) {
				clear : both;
				text-align : left;
				font-size : small;
				text-indent : 1%;
				height : 20px;
				line-height : 25px;
			}
			.item > div:last-child {
				text-align : left;
				font-size : small;
				text-indent : 1%;
				height : 20px;
				margin-top : 6px;
				background-color: white;
			}
			.section_header_select{
				margin : 0 0 0 22px;
			}
			#seaction_header {
				text-align : left;
			}
			.section_footer { 
				clear : both;
				margin-top : 50px;
			}
			.section_header_div {
				width: 500px; float:left; text-align : left; margin-top : 10px;
			}
			.section_header_div2 {
				width: 548px; float:left; text-align : right; margin-top : 10px; height : 25px;
			}
			.section_header_div2 .button_search{
				color : white; font-size : 11px; background:black; border-color : black;
			}
			#imageView {
				max-height : 240px;
  				max-width : 240px;
  				vertical-align:middle;
			}
			.button_regist {
				background-color : #114DA5;
				color : white;
				border-width : 0;
				width : 100px;
				height : 30px;
				font-weight: bold;
			}
			.section_footer_div {
				width:558px;
				height:70px; 
				line-height : 110px; 
				float:left; 
				text-align : right;
				margin-top : 30px;
			}
			.section_footer_div2 {
				width:490px; 
				height:70px; 
				line-height : 40px; 
				float:left; 
				text-align : right; 
				padding : 0 22px 0 0;
				margin-top : 30px;
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
		function sell(form) {
       		location.href="online_action_sell.wookook";
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
		});
	</script>
	<script> 
		window.onload = function(){ 
		  timecolor();
		  setInterval("timecolor()",2000);
		  setTimeout("goReLoad()",60000);
		} 
		function goReLoad(){ 
			document.location.reload(); 
		} 
		function timecolor_red() {
			$(".time_out b").css("color","red");
		}
		function timecolor_black() {
			$(".time_out b").css("color","black");
		}
		function timecolor() {
			timecolor_red();
			setTimeout("timecolor_black()",1000);
		}
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
			<div id="container">
				<div><h1>온라인 경매 > 인기경매</h1></div>
				<header id ="section_header">
					<div class = "section_header_div">
					</div>
					<div class = "section_header_div2">
					</div>
				</header>
				<article>
					<% if(articleList != null && listCount > 0){ %>
						<% 
							for(int i=0;i<articleList.size();i++){	
						%>	
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
							<div class="item">
							<% 
								String path = "onlineactionfileupload/" + articleList.get(i).getAction_file(); 
							%>				
							<%if(articleList.get(i).getAction_adult().equals("19세이상")) {
								if(Integer.parseInt(birth_chk)>2001) { %>
									<div><a href="javascript:alert('미성년자는 불가합니다');"><img src="image/19.jpg" id ="imageView"></a></div>
							<% } else {%>	
								<div><a href="online_action_click.wookook?
								action_num=<%= articleList.get(i).getAction_num() %>
								&page=<%=nowPage%>"><img src="<%= path %>" id ="imageView"></a></div>	
							<% } } else {%>
								<div><a href="online_action_click.wookook?action_num=<%= articleList.get(i).getAction_num() %>&page=<%=nowPage%>"><img src="<%= path %>" id ="imageView"></a></div>	
							<% } %>						
								<div><%= articleList.get(i).getAction_name() %></div>
								<div class ="ajax_money"><b><script>var replacemoney = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								document.write(replacemoney);</script>원</b></div>
								<div>
									<div>
										<div> 입찰 </div>
										<div> <%= articleList.get(i).getAction_buy() %> </div>
									</div>
									<div>
										<div> 조회 </div>
										<div> <%= articleList.get(i).getAction_hit() %> </div>
									</div>
								</div>
								<div>판매자ID : <%= articleList.get(i).getAction_sellid() %> </div>
								<div class = "time_out">남은시간 : <b id ="time_exit"><%= articleList.get(i).getAction_time() %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;물품번호 : <%= articleList.get(i).getAction_num() %></div>
							</div>
						<% } %> 
					<% } %>	
				</article>				
				<footer class = "section_footer">
					<div class="section_footer_div">	
							<%if(nowPage<=1){ %><&nbsp;&nbsp;&nbsp;
							<%}else{ %>
							<a href="online_action_list.wookook?page=<%=nowPage-1 %>"><</a>&nbsp;&nbsp;&nbsp;
							<%} %>
					
							<%if(nowPage>=maxPage){ %>
								>
							<%}else{ %>
							<a href="online_action_list.wookook?page=<%=nowPage+1 %>">></a>
							<%} %>
					</div>
					<div class="section_footer_div2" >
						<input type="button" name="button_regist" class = "button_regist" value="판매등록" onclick="sell(this.form)">
					</div>
				</footer>
            </div> 
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