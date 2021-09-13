<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
  				height : 1400px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  				text-align : left;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  			}
  			#section_id article {
  				width : 1036px;
  				height : 1100px;
  				margin : auto;
  				background-color : white;
  				border-radius: 4px;
  			}
  			#section_id article > div {
  				float : left;
  			}
  			#section_id article > div:first-child {
  				margin-left : 30px;
  			}  			
  			#section_id article > div:nth-child(2) {
  				width : 450px;
  				margin-top : 30px;
  			}  				
  			#section_id article div img {
  				max-height : 100%;
  				max-width : 100%;	
  				vertical-align:middle;
  			}
  			#section_id article div:nth-child(3) {
  				clear : both;
  				margin-top : 15px;
  				margin-left : 30px;
  				height : 25px;
  				width : 518px;
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
  				height : auto;
  				margin-left :30px;
  				line-height : 60px;
  				text-align : center;
  			}	
  			#section_id article div ul li:last-child div{
  				float :left;
  				margin-left:45px;			
  			}
  			#section_id article div ul li:last-child div:last-child{
  				width : 420px;
  				height : 100px;
  				line-height : 72px;
  				margin-left : 0;
  			}
  			#section_id article div ul li select{
  				width : 304px;
  				background-color : #D5D5D5;	
  				border : 0;	
  				text-indent : 2%;
  				height : 30px;
  			}
  			#section_id article div ul li textarea{
  				width : 298px;
  				background-color : white;
  				border-color : white;	
  				resize : none;
  				outline: none;
  				height : 306px;	
  				margin : 30px 0 30px 0;
  			}
  			#image_container {
			    margin-top: 30px;
			    border: 1px solid;
			    border-color: #F6F6F6;
			    height : 480px;
  				width : 520px;
  				text-align : center;
  				line-height : 475px;
  			}
  			
			.action_start_money {
  				width : 300px;
  				text-indent : 2%;
  				background-color : #D5D5D5;	
  				border : 0;
  				height : 28px;
  				outline: none;
			}  		
  			.action_name {
  				width : 300px;
  				text-indent : 2%;
  				background-color : #F6F6F6;		
  				border : 0;
  				height : 28px;
  				outline: none;
  			}
  			.action_sell {
				background-color : #114DA5;
				color : white;
				border-width : 0;
				width : 150px;
				height : 50px;
				font-weight: bold;
			}	
			.action_sell_back {
				background-color : #FFB2F5;
				color : white;
				font-weight : bold;
				border-width : 0;
				width : 150px;
				height : 50px;
			}
			#imformation_container {	
  				margin-top : 50px;
  				width : 992px;
  				margin-left : 10px;
  				margin-bottom : 30px;
  			}
  			#imformation_container > div {
  				margin-left :20px;
  			}
  			#imformation_container > div:first-child {
  				width : 100px;
  				text-align : center;
  				border-top : 1px solid;
  				border-left : 1px solid;
  				border-right : 1px solid;
  				border-color : #114DA5;
  				color : #114DA5;
  				line-height : 40px;
  			}
  			#imformation_container > div:last-child {
  				width : 967px;
  				height : auto;
  				margin-left : 20px;
  			}
  			#imformation_container > div:last-child textarea{
  				width : 100%;	
  				height : 350px;
  				background-color : white;	
  				resize : none;
  				outline: none;
  				border : 1px solid;
  				border-color : #8C8C8C;
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
	function checkNumber(){
		   var objEv = event.srcElement;
		   var numPattern = /([^0-9])/;
		   var numPattern = objEv.value.match(numPattern);
		   if(numPattern != null){
		      alert("숫자만 입력해 주세요");
		      objEv.value = "";
		      objEv.focus();
		      return false;
		   }
	} 
	function checkBrNan(){
		   var objEv = event.srcElement;
		   var numPattern = /([^ㄱ-힣a-zA-Z0-9\s])/gi;
		   var numPattern = objEv.value.match(numPattern);
		   
		   var passPattern = /^\s+|\s+$/g;
		   var passPattern = objEv.value.match(passPattern);
		   
		   if(numPattern != null){
			  alert("물품이름은 (한글,영어,숫자) 중 입력하세요");
			  objEv.value = "";
		      objEv.focus();
		      return false;
		   }
		   else if(passPattern != null ){
				alert("공백만 사용 불가합니다");
				objEv.value = "";
			 	objEv.focus();
			 	return false;
		   }
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
       		$(".image_choice").change(function(){
       			var reader = new FileReader(); 
       			
       			reader.onload = function(event) { 	
       				var img = document.createElement("img"); 
       				img.setAttribute("src", event.target.result); 
       				if(document.querySelector("div#image_container img") == null ) {
       					document.querySelector("div#image_container").appendChild(img); 
       				}
       				else {
       					document.querySelector("div#image_container img").src 
       					= event.target.result;
       				}	
       			};  		
       			
       			reader.readAsDataURL(event.target.files[0]);
       		});     		
		});
		
		function sell(form) {
			var chk = parseInt(form.action_start_money.value);
			if(form.action_name.value == "") {
				alert("물품이름 입력은 필수입니다");
				form.action_name.focus();
				form.action_name.select();
			}
			else if(chk % 1000 != 0 || chk < 1000) {
				alert("시작가격은 1000원(단위) 이상이어야 합니다");
				form.action_start_money.focus();
				form.action_start_money.select();
			}
			else if(form.action_file.value == "") {
				alert("파일(이미지) 선택은 필수입니다");
				$('#action_file').click();
			}
			else {
				form.submit();
			}
		}
	</script>

	<body>
	<form action = "online_action_sell_pro.wookook" 
	enctype="multipart/form-data" method = "post">
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
				<div><h1>온라인 경매 > 판매등록</h1></div>
				<article>
					<div id="image_container"></div>
					<div>
						<ul>
							<li>물품이름&nbsp;&nbsp;&nbsp;
									<input type="text" class = "action_start_money" name="action_name" maxlength="18" onchange = "checkBrNan()" required="required">
							</li>
							<li>경매기간&nbsp;&nbsp;&nbsp;
									<select name="action_date">
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
									<input type="text" name="action_start_money" class="action_start_money" maxlength="9" required="required" onchange ="checkNumber()">
							</li>
							<li>물품종류&nbsp;&nbsp;&nbsp;
									<select name="action_kind">
										<option value="도서">도서</option>
										<option value="미술품">미술품</option>
										<option value="중고생활용품">중고생활용품</option>
										<option value="기타">기타</option>
									</select>
							</li>
							<li>배송방법&nbsp;&nbsp;&nbsp;
									<select name="action_quick">
										<option value="택배(착불)">택배(착불)</option>
										<option value="직거래">직거래</option>
									</select>
							</li>
							<li>연령제한&nbsp;&nbsp;&nbsp;
									<select name="action_adult">
										<% 	if(Integer.parseInt(birth_chk)>2001) { %>
											<option value="전체">전체</option>
										<% } else {%>
										<option value="전체">전체</option>
										<option value="19세이상">19세이상</option>		
										<% } %>				
									</select>
							</li>
							<li>판매자ID&nbsp;&nbsp;&nbsp;
									<input type="text" class = "action_name" value="<%=id%>" readonly = "true">
							</li>
							<li><div><input type="button" class = "action_sell" value="판매등록" onclick="sell(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="button" class = "action_sell_back" value="뒤로" onclick = "location.href = document.referrer;"></div>
							</li>
						</ul>
					</div>
					<div>
						<input type="file" id = "action_file" name="action_file" class="image_choice" accept=".jpg,.jpeg,.png,.gif">
					</div>
					<div id="imformation_container">	
						<div>물품설명</div>
						<div><textarea name="action_content"></textarea></div>
					</div>
				</article>
				<input type = "hidden" name = "action_sellid" value = "<%=id %>" >
		</section>
	</form>

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
		
	</body>
</html>