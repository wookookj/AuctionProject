<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
	%>
	<head>
		<meta charset="UTF-8">
		<title>정보수정</title>
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
  				height : 1000px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  			}
			#section_id article div:first-child {
				padding-top : 50px;
				border-color : #A6A6A6;
				padding-bottom: 30px;
				width : 390px;
				margin : auto;
			}  
			#section_id article div:first-child font {
				color : #114DAD;
			}
			#section_id article div:nth-child(2) {
				margin-top : 30px;
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
			function signup(form) {	
				<% 
				ArrayList<Signup_DTO> arr = (ArrayList)request.getAttribute("arr"); 
				ArrayList<Signup_DTO> arr2 = (ArrayList)request.getAttribute("arr2");  	
				for(int i =0; i < arr2.size(); i ++) {%>
					if("<%= arr2.get(i).getSign_tell()%>" == ("0"+form.tel1.value+form.tel2.value+form.tel3.value)) {
						var tell_chk = true;
						if("<%= arr.get(0).getSign_tell()%>" == "<%= arr2.get(i).getSign_tell()%>") {
							tell_chk = false;
						}				
					}
					if("<%= arr2.get(i).getSign_email() %>" == (form.email.value+form.email2.value)) {
						var email_chk = true;
						if("<%= arr.get(0).getSign_email()%>" == "<%= arr2.get(i).getSign_email()%>") {
							email_chk = false;
						}
					}					
				<%}%>
				if("<%= arr.get(0).getSign_pw() %>" == (form.passwd.value)) {	
					var pw_chk = false;
				}
				else {
					pw_chk = true;
				}
				
				if(form.id.value == "") {
					alert("아이디는 필수입력값입니다");
					form.id.focus();
				}
				else if(!((form.id.value.length >=4) && (form.id.value.length <=10))){
					alert("아이디는 4자리 ~ 10자리 사용가능합니다");
					form.id.focus();
					form.id.select();
				}
				else if(pw_chk == true) {
					alert("비밀번호가 일치하지 않습니다");
					form.passwd.focus();
					form.passwd.select();
				}
				else if(form.name.value =="") {
					alert("이름은 필수입력값입니다");
					form.name.focus();
				}
				else if(form.tel2.value == "") {
					alert("전화번호는 필수입력값입니다");
					form.tel2.focus();
				}
				else if(!(form.tel2.value.length == 4)) {
					alert("전화번호는 4자리이여야합니다");
					form.tel2.focus();
					form.tel2.select();
				}
				else if(form.tel3.value == "") {
					alert("전화번호는 필수입력값입니다");
					form.tel3.focus();
				}
				else if(!(form.tel3.value.length == 4)) {
					alert("전화번호는 4자리이여야합니다");
					form.tel3.focus();
					form.tel3.select();
				}
				else if(tell_chk == true) {
					alert("이미등록되어있는 번호입니다");
					form.passwd.focus();
					form.tel3.select();
				}		
				else if(form.email.value == "") {
					alert("이메일은 필수입력값입니다");
					form.email.focus();
				}	
				else if(email_chk == true) {
					alert("이미등록되어있는 이메일입니다");
					form.email.focus();
					form.email.select();
				}
				else {			
					form.submit();
				}
			}
	</script>
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
		});
	</script>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="addr_close()" alt="닫기 버튼">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function addr_close() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function addr_search() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }
   
    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }

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
						out.println("<div><a href='signup.jsp'>회원가입</a></div>");
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
			<form method = "post" action ="update_mypage_db2.jsp">
			<article>
				<div>
					<table align="center">
						<tr>
							<td colspan="3" class="signup_text"><font>아이디</font></td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" class="filed2" name="id" maxlength="10" placeholder="4자리~10자리" value = "<%= arr.get(0).getId()%>" readonly="true"></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>현재 비밀번호</font></td>
						</tr>
						<tr>
							<td colspan="3"><input type="password" class="filed2" name="passwd" maxlength="15"></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>이름</font></td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" class="filed2" name="name" maxlength="10" placeholder="최대10자리" value = "<%= arr.get(0).getSign_name()%>"></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>전화번호</font></td>
						</tr>
						<tr>
							<td>
								<select name="tel1" class="signup_select">
								<script>
									<%for( int i =10; i <= 19; i ++) {
										if(arr.get(0).getSign_tell().substring(0,3).equals(String.valueOf("0"+i))) { %>
											document.write("<option value='"+<%=i%>+"' selected>" +"0"+<%=i%> + "</option>");
										<%} else { %>
											document.write("<option value='"+<%=i%>+"'>" +"0"+<%=i%> + "</option>");
										<%}
									}%>						
								</script>	
								</select>
							</td>
							<td><input type="text"  name="tel2" class="select_filed" onchange = "checkNumber()" size="13" maxlength="4" placeholder="4자리" value = "<%= arr.get(0).getSign_tell().substring(3,7) %>"></td>
							<td><input type="text"  name="tel3" class="select_filed"  onchange = "checkNumber()" size="13" maxlength="4" placeholder="4자리" value = "<%= arr.get(0).getSign_tell().substring(7) %>"></td>		
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>이메일</font></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="email" class="select_filed" size="32" maxlength="15" placeholder="최대15자리"  value = "<%= arr.get(0).getSign_email().substring(0,arr.get(0).getSign_email().lastIndexOf("@"))%>"></td>
							<td>
								<select name="email2" class="signup_select">
								<% if(arr.get(0).getSign_email().substring(arr.get(0).getSign_email().lastIndexOf("@")).equals("@naver.com")) {%>
									<option value="@naver.com" selected >@naver.com</option>
									<option value="@google.com">@google.com</option>
									<option value="@daum.net">@daum.net</option>
									<option value="@hanmail.com">@hanmail.com</option>
								<%}%>
								<% if(arr.get(0).getSign_email().substring(arr.get(0).getSign_email().lastIndexOf("@")).equals("@google.com")) { %>
									<option value="@naver.com">@naver.com</option>
									<option value="@google.com" selected>@google.com</option>
									<option value="@daum.net">@daum.net</option>
									<option value="@hanmail.com">@hanmail.com</option>
								<%} %>
								<% if(arr.get(0).getSign_email().substring(arr.get(0).getSign_email().lastIndexOf("@")).equals("@daum.net")) { %>
									<option value="@naver.com">@naver.com</option>
									<option value="@google.com">@google.com</option>
									<option value="@daum.net"selected>@daum.net</option>
									<option value="@hanmail.com">@hanmail.com</option>
								<%} %>
								<% if(arr.get(0).getSign_email().substring(arr.get(0).getSign_email().lastIndexOf("@")).equals("@hanmail.com")) { %>
									<option value="@naver.com">@naver.com</option>
									<option value="@google.com" >@google.com</option>
									<option value="@daum.net">@daum.net</option>
									<option value="@hanmail.com"selected>@hanmail.com</option>
								<%} %>
								

								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>주소</font></td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" id="addr1" class="addr_text" name="addr1" maxlength="10" placeholder="주소" value = "<%= arr.get(0).getSign_addr().substring(0,arr.get(0).getSign_addr().indexOf("/"))%>" >
							<input type="text" class="addr_text" id="addr2" name="addr2" maxlength="10" placeholder="참고항목" value = "<%= arr.get(0).getSign_addr().substring((arr.get(0).getSign_addr().indexOf("/"))+1,arr.get(0).getSign_addr().lastIndexOf("/"))%>" ></td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" id="addr3" class="filed_addr" name="addr3" maxlength="60" placeholder="상세주소" value = "<%= arr.get(0).getSign_addr().substring((arr.get(0).getSign_addr().lastIndexOf("/"))+1)%>"></td>
						</tr>
						<tr class="addr_button_right">
							<td colspan="3"><input type="button" class="addr_button" name="addr_button" onclick="addr_search()" value="검색" ></td>
						</tr>
						<tr>
							<td colspan="3" class="signup_text"><font>생년월일</font></td>
						</tr>
						<tr>
							<td>
								<select name="year" class="signup_select">
								<script>
									<%for( int i =1900; i <= 2020; i ++) {
										 if(arr.get(0).getSign_birth().substring(0,4).equals(String.valueOf(i))) { %>
										 document.write("<option value='"+<%=i%>+"' selected>" + <%=i%> + "</option>");
									<%} else {%>
										document.write("<option value='"+<%=i%>+"'>" + <%=i%> + "</option>");
										<%}
									}%>						
								</script>				           
								</select>
							</td>
							<td>
								<select name="birth" class="signup_select">
								<script>					
									<%for( int i =1; i <= 12; i ++) {	
										 String k ;
										 if(i < 10) {
											 k = ("0"+i).toString();
										 }
										 else {
											 k = String.valueOf(i);
										 }
										 if(arr.get(0).getSign_birth().substring(4,6).equals(k)) { %>
										 document.write("<option value='"+'<%=k%>'+"' selected>" + "<%=i%>" + "</option>");
									<%} else {%>
										document.write("<option value='"+'<%=k%>'+"'>" + "<%=i%>" + "</option>");
										<%}
									}%>	
								</script>
								</select>
							</td>
							<td>
								<select name="days" class="signup_select">
								<script>
								<%for( int i =1; i <= 31; i ++) {	
									String k ;
									 if(i < 10) {
										 k = ("0"+i).toString();
									 }
									 else {
										 k = String.valueOf(i);
									 }
									 if(arr.get(0).getSign_birth().substring(6,8).equals(k)) { %>
									 document.write("<option value='"+'<%=k%>'+"' selected>" + "<%=i%>" + "</option>");
								<%} else {%>
									document.write("<option value='"+'<%=k%>'+"'>" + "<%=i%>" + "</option>");
									<%}
								}%>	
								</script>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3"><p><input type="button" class="submit" value="수정하기" onclick="signup(this.form)"></p></td>
						</tr>
					</table>
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
		
	</body>
</html>