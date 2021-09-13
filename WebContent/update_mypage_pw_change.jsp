<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<!doctype html>
<html>
	<head>
		<% String id = (String)session.getAttribute("id");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
		%>
		<meta charset="UTF-8">
		<title>비밀번호변경</title>
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
				/*background: #eeeeee; *//* change */
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
  				height : 650px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  			}
			#section_id > div {
				margin-top : 150px;
			}		
  			table td { 
				line-height : 280%;
			}
			table font {
				font-weight : bold;
				/*font-style : italic;*/ /*change*/
			}
			.text_smallsize {
				font-size : small;
			}
			.filed {
				height : 30px;
				text-indent : 1%;
				width : 97px;
			}
			.filed2 {
				height : 30px;
				text-indent : 1%;
				width : 382px;
			}
			.filed_addr{
				height : 50px;
				text-indent : 1%;
				width : 382px;
			}
			.submit {
				width : 393px;
				background-color : #6799FF;
				color : white;
				border-width : 0;
				height : 30px;
				border-radius: 4px;
			}
			.select_filed {
				text-indent : 2%;
				height : 24px;
			}
			.signup_text {
				text-align : left;
			}
			.signup_select {
				width : 126px;
				height : 30px;
				border-style : double;
			}
			.addr_button_right {
				text-align : right;
			}
			.addr_button {
				background-color : #6799FF;
				border-width : 0;
				margin-right: 3px;
				color : white;
				border-radius: 4px;
			}
			.addr_text{
				height : 30px;
				text-indent : 2%;
				width : 184px;
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
	function checkEnglish(){
		   var objEv = event.srcElement;
		   var numPattern = /([^a-z0-9])/;
		   var numPattern = objEv.value.match(numPattern);
		   if(numPattern != null){
		      alert("영어(소문자) 또는 숫자만 입력해 주세요");
		      objEv.value = "";
		      objEv.focus();
		      return false;
		   }
	}
		function pw_change(form) {
			if(form.passwd.value =="") {
				alert("비밀번호는 필수입력값입니다.");
				form.passwd.focus();
			}
			else if(!((form.passwd.value.length >=4) && (form.passwd.value.length <=15))) {
				alert("비밀번호는 4자리 ~ 15자리 사용가능합니다.");
				form.passwd.focus();
				form.passwd.select();
			}
			else if(form.passwd.value != form.passwdchk.value) {
				alert("비밀번호와 비밀번호재확인은 같아야합니다.");
				form.passwdchk.focus();
				form.passwdchk.select();
			}
			else {
				form.submit();
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
		});
	</script>

<script>

</script>
	<body>
		<header id="header_id">
			<div class="header_div">
				<%
					if(id != null) {
						out.println("<div><a href='logout.jsp'>로그아웃</a></div>");
						out.println("<div><a href='mypage.jsp'>내정보</a></div>");
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
			<div>
			<form action ="update_mypage_pw_change_db.jsp" method = "post">
					<table align="center">
						<tr>
							<td colspan="3"><input type="password" class="filed2" name="id" value = "<%=id%>" hidden></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>변경할 비밀번호</font></td>
						</tr>
						<tr>
							<td colspan="3"><input type="password" class="filed2" name="passwd" maxlength="15" placeholder="4자리~15자리" onchange = "checkEnglish()"></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>비밀번호재확인</font></td>
						</tr>
							<td colspan="3"><input type="password" class="filed2" name="passwdchk" maxlength="15" placeholder="4자리~15자리" onchange = "checkEnglish()"></td>
						</tr>
						<tr>
							<td colspan="3"><p><input type="button" class="submit" value="변경하기" onclick="pw_change(this.form)"></p></td>
						</tr>
					</table>
			</form>
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
		
	</body>
</html>