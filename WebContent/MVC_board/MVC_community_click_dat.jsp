<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.net.*"%>
<%@ page import="vo.BoardBean"%>
<%@ page import = "java.util.*"%>
<%@ page import="vo.BoardDatBean"%>

<!doctype html>
<html>
<% String id = (String)session.getAttribute("id");
BoardBean dto = (BoardBean)request.getAttribute("article");
ArrayList<BoardDatBean> dat_dto = (ArrayList<BoardDatBean>)request.getAttribute("dat_article");
String nowPage = (String)request.getAttribute("page");
String dat_board_num= (String)request.getAttribute("dat_num");
String dat_id = (String)request.getAttribute("dat_id");
%>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티</title>
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
  				height : auto;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
    			padding-bottom : 150px;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  				text-align : left;
  			}
  			#section_id article {
  				width : 1036px;
  				height : auto;
  				padding-bottom : 1px;
  				margin : auto;
  				background-color : white;
  			}	
  			.article_firstdiv {
  				width : 750px;
				margin : auto;
  			}
  			#section_id > article > div:first-child {
  				width : 750px;
				margin : auto;
  			}
  			#section_id > article > div:last-child { 
  				width : 750px;
  				margin : 15px auto 80px auto;
  				text-align : right;
  			}
  			table tr:first-child{
				height : 50px;
  			}
  			table tr td:last-child {
  				background-color : white;
  			}  			
  			table tr:first-child td:first-child{
				width : 100px;
  			}
  			table tr td{
  				height : 40px;
  				border : 1px solid;
  				border-color : #D5D5D5;
  				background-color : #eeeeee;
  			}
  			table tr:nth-child(3) > td:last-child {
  				height : 300px;
  				padding-bottom : 30px;
  				padding-top : 30px;
  			}
  			table tr:nth-child(4) > td:last-child {
				text-align : left;
				padding-left : 28px;
			}  			
			table a{
				color : black;
			}
			table tr > td:last-child {
				width : 650px;
			}
			table tr > td:nth-child(2) {
				text-align : left;
				padding-left : 28px;
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
  			#section_id article > div table {
				width : 816px;
				margin : auto;
  			}	
  			.button {
				 background-color: #40AA82;
   				 color: white;
   				 border-width: 0;
			}
			.wrap {
		       	 width : 610px;
		       	 text-align:left;
		    }
		    .wrap textarea {
		      	 width: 100%;
		      	 resize: none;
		      	 overflow-y: hidden; 
		       	 border : 0;
		       	 outline: none;
		       	 margin-top : 23px;
     		}
     		.article_footer {
     		  	width : 750px;
  				margin : 15px auto 50px auto;
  				text-align : right;
     		}
     		.board_dat_write {
     		    width : 750px;
     			margin : 30px auto 80px auto;
     			height : 130px;
     		}
     		.board_dat_write > div {
     			float : left;
     			width : 50px;
     			height : 130px;
     			text-align : left;
     		}
     		.board_dat_write > div:first-child {
     			width : 700px;
     			text-align : left;
     		}
     		.board_dat_write > div:first-child > textarea {
     			width : 700px;
     			height : 125px;
     			resize : none;
     		}
     		.board_dat_write > div:last-child {
     			line-height : 240px;
     			text-align : right;
     		}
     		.board_dat_read {
     			width : 750px;
     			margin : auto;
     			height : auto;
     			overflow : hidden;
     		}
     		.board_dat_read_dat {
     			width : 750px;
     			margin : auto;
     			height : auto;
     			overflow : hidden;
     		}
     		.board_dat_update {
     		    width : 750px;
     			margin : auto;
     			height : auto;
     			overflow : hidden;
     			text-align : left;
     			border-top : 1px solid;
     			padding-top : 10px;
     			border-color : #eeeeee;
     		}
     		.board_dat_update textarea {
     		    resize : none;
     			width : 650px;
     			height : 130px;
     		}
     		.board_dat_update > div:first-child {
     			margin-bottom : 10px;
     			margin-top : 30px;
     		}
     		.board_dat_update > div:nth-child(2) {
     			float:left;
     			height : 130px;
     			margin-bottom : 50px;
     		}
     		.board_dat_update > div:nth-child(3) {
     			float:left;
     			height : auto;
     			padding-top : 115px;
     			margin-left : 5px;
     		}
     		.board_dat_read > div {
     			height : auto;
     			float : left;
     			width : 700px;	
     			border-top : 1px solid;
     			padding-top : 10px;
     			border-color : #eeeeee;
     		}
     		.board_dat_read_dat > div {
     			height : auto;
     			float : left;
     			width : 650px;	
     			border-top : 1px solid;
     			padding-top : 10px;
     			border-color : #eeeeee;
     		}
     		.board_dat_read > div:first-child {
     			width : 50px;
     			height : auto;
     		}
     		.board_dat_read_dat > div:first-child {
     			width : 50px;
     			height : auto;
     			margin-left : 50px;
     		}
     		.float_left > div {
     			float : left;
     			width : auto;
     			text-align : left;
     			height : 35px;
     			padding-left : 10px;
     		}
     		.float_left > div:first-child {
     			width : auto;
     			padding-left : 10px;
     			font-size : 18px;
     		}
     		.float_left > div:nth-child(2) {
     			font-size : 12px;
     			line-height : 28px;
     		}
     		.text_left_clear_both {
     			text-align : left;
     			clear : both;
     			padding-left : 10px;
     			height : auto;
     		}   		
     		.text_left_clear_both textarea {
     			resize : none;
     			width : 100%;
     			border : 0;
     			outline: none;
     		}
     		.board_dat_start {
     			width : 750px;
     			margin : 0 auto 30px auto;
     			text-align : left;
     		}
     		.board_dat_start b {
				font-size : 18px;
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
    $(document).ready(function() {
        $('.wrap').on( 'keyup', 'textarea', function (e){
          $(this).css('height', 'auto' );
          $(this).height( this.scrollHeight );
        });
        $('.wrap').find( 'textarea' ).keyup();
        
        $('.text_left_clear_both').on( 'keyup', 'textarea', function (e){
            $(this).css('height', 'auto' );
            $(this).height( this.scrollHeight );
          });
          $('.text_left_clear_both').find( 'textarea' ).keyup();
      });
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
       		
		});
		function board_update(form) {
			location.href = "boardModifyForm.bo?board_num="+ form.num.value + "&page=" + <%=nowPage%>;		
		}
		function board_delete(form) {
			if(confirm("정말 삭제 하시겠습니까?")){
				location.href = "boardDeletePro.bo?board_num=" + form.num.value + "&page=" + <%= nowPage %>;
			}
		}	
		function board_re_insert(form) {
			location.href = "boardReplyForm.bo?board_num=" + form.num.value + "&page=" + <%=nowPage%>;
		}
		function board_dat_write(form) {
			<%if(id == null) {
				out.print("location.href='nologin.jsp';");
			} else {%>
			if (form.write.value == "") {
				alert("내용을 입력하세요.");
				form.write.focus();
			}
			else {
				form.submit();
			}
			<%}%>
		}
		function board_dat_update(form) {
			if(form.dat_update_content.value == "") {
				alert("내용을 입력하세요.");
				form.dat_update_content.focus();
			}
			else {
				location.href = "boarddatreplypro.bo?board_num=" + form.num.value +"&board_re_ref="+ form.BOARD_RE_REF.value +"&board_re_lev="+ form.BOARD_RE_LEV.value +"&board_re_seq="+ form.BOARD_RE_SEQ.value +"&board_content=" + encodeURIComponent(form.dat_update_content.value) + "&id=" + '<%=id%>' + "&page=" + <%= nowPage %> + "&dat_id=" + '<%= dat_id %>'	
			}
		}

	</script>

	<body>
		<header id="header_id">
			<div class="header_div">
				<%
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
			<div><h1>커뮤니티</h1></div>
			<article>
			<br><br><br><br>
		<form action="boarddatwritePro.bo" method="post">		
			<div class ="article_firstdiv">
				<table border = "0" cellspacing = "0">
					<tr>
						<td>번호</td>
						<td><%= dto.getBOARD_NUM()%></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><%= dto.getBOARD_TITLE() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td id = "content_size">
						<% if(dto.getBOARD_FILE() == null)  {
							} else if(dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".jpg") || dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".png") || dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".gif") || dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".PNG") || dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".GIF") || dto.getBOARD_FILE().substring(dto.getBOARD_FILE().length()-4,dto.getBOARD_FILE().length()).equals(".JPG")) { 	
						       String path = "boardfileupload/" + dto.getBOARD_FILE(); 
							%>							
								<img src="<%= path %>" id ="imageView">
									<script>
										if(document.getElementById("imageView").height > 400) {
											document.getElementById("imageView").height = "400";
										}
										if(document.getElementById("imageView").width > 614) {
											document.getElementById("imageView").width = "614";
										}
									</script>
							<% } %>
							 <div class="wrap"><textarea readonly="true"><%= dto.getBOARD_CONTENT() %></textarea></div>
						</td>
					</tr>
					<tr>			
						<% if(dto.getBOARD_FILE() == null) { %>		
						<% } else { %>
							<td>파일</td>
							<td><a href = "MVC_board/file_down.jsp?downFile=<%=dto.getBOARD_FILE()%>"><%= dto.getBOARD_FILE()%></a></td>
						<% } %>			
					</tr>
					<tr>
						<td>작성자</td>
						<td><%= dto.getBOARD_ID() %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><%= dto.getBOARD_READCOUNT() %></td>
					</tr>																																											
				</table>
			</div>
			<input type = "hidden" name = "num" value ="<%= dto.getBOARD_NUM() %>" >
			<input type = "hidden" name = "id" value = "<%= id %>">
			<input type = "hidden" name = "page" value = "<%= nowPage %>">
			<div class ="article_footer"> <br>
				<input type="button" value = "목록" onclick = "location.href = 'boardList.bo'" class = "button">		
				&nbsp;&nbsp;<input type="button" value = "답글" onclick = "board_re_insert(this.form)" class = "button">				
				<% if (dto.getBOARD_ID().equals(id))  {%>
					&nbsp;&nbsp;<input type="button" value = "수정" onclick = "board_update(this.form)" class="button">&nbsp;&nbsp;
					<input type="button" value = "삭제" onclick = "board_delete(this.form)" class = "button">
				<% } else if("admin".equals(id)){%>
					&nbsp;&nbsp;<input type="button" value = "삭제" onclick = "board_delete(this.form)" class = "button">
				<% } %>
			</div>
			<div class = "board_dat_start"><b>댓글</b> (<%= dat_dto.size() %>개)</div>
			<% if(dat_dto != null){ %>
				<% 
					for(int i=0;i<dat_dto.size();i++) {	
				%>	
					<% if(String.valueOf(dat_dto.get(i).getDat_num()).equals(dat_board_num) ) {%>
					<% if(dat_dto.get(i).getDat_re_lev() > 0 ) {%> 
					<input type = "hidden" name = "dat_update_num" value ="<%= dat_dto.get(i).getDat_num() %>" >
					<div class = "board_dat_read_dat">
						<div>
							<img src = "image/dat.png" >
						</div>
						<div>
							<div class = "float_left">
								<div><%= dat_dto.get(i).getDat_id() %></div>
								<div><%= dat_dto.get(i).getDat_date() %> &nbsp;<a href = "boarddatreplyform.bo?board_num=<%= dto.getBOARD_NUM()%>&dat_board_num=<%= dat_dto.get(i).getDat_num()%>&page=<%=nowPage%>"></a>
									<% if (dat_dto.get(i).getDat_id().equals(id)) { %>
									&nbsp;&nbsp;<input type = "button"  value="수정" class="button" onclick ="location.href = 'boarddatupdateForm.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%= String.valueOf(dto.getBOARD_NUM())%> +'&page=' + <%= nowPage %>">
									&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
									<% } else if("admin".equals(id)) {%>
										&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
									<% } %>
								</div>
							</div>
							<div class = "text_left_clear_both"><textarea readonly = "true"><%= dat_dto.get(i).getDat_content() %></textarea></div>
						</div>
					</div>
						<div class = "board_dat_update">
								<div></div>
								<div><textarea name ="dat_update_content" placeholder="<%=dat_dto.get(i).getDat_id() %>님께 답글쓰기"></textarea></div>
								<div><input type = "button" value="취소" class="button" onclick="location.href = 'boardDetail.bo?board_num=' + <%= dto.getBOARD_NUM() %> + '&page=' + <%= nowPage%>"> <input type = "button" value="작성" class="button" onclick="board_dat_update(this.form)"></div>
						</div>
						<input type="hidden" name="BOARD_RE_REF" value="<%=dat_dto.get(i).getDat_re_ref() %>">
						<input type="hidden" name="BOARD_RE_LEV" value="<%=dat_dto.get(i).getDat_re_lev() %>"> 
						<input type="hidden" name="BOARD_RE_SEQ" value="<%=dat_dto.get(i).getDat_re_seq() %>">
						<% } else { %>
					<input type = "hidden" name = "dat_update_num" value ="<%= dat_dto.get(i).getDat_num() %>" >
					<div class = "board_dat_read">
						<div>
							<img src = "image/dat.png" >
						</div>
						<div>
							<div class = "float_left">
								<div><%= dat_dto.get(i).getDat_id() %></div>
								<div><%= dat_dto.get(i).getDat_date() %> &nbsp;<a href = "boarddatreplyform.bo?board_num=<%= dto.getBOARD_NUM()%>&dat_board_num=<%= dat_dto.get(i).getDat_num()%>&page=<%=nowPage%>"></a>
									<% if (dat_dto.get(i).getDat_id().equals(id)) { %>
									&nbsp;&nbsp;<input type = "button"  value="수정" class="button" onclick ="location.href = 'boarddatupdateForm.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%= String.valueOf(dto.getBOARD_NUM())%> +'&page=' + <%= nowPage %>">
									&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
									<% } else if("admin".equals(id)) {%>
										&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
									<% } %>
								</div>
							</div>
							<div class = "text_left_clear_both"><textarea readonly = "true"><%= dat_dto.get(i).getDat_content() %></textarea></div>
						</div>
					</div>
						<div class = "board_dat_update">
								<div></div>
								<div><textarea name ="dat_update_content" placeholder="<%=dat_dto.get(i).getDat_id() %>님께 답글쓰기"></textarea></div>
								<div><input type = "button" value="취소" class="button" onclick="location.href = 'boardDetail.bo?board_num=' + <%= dto.getBOARD_NUM() %> + '&page=' + <%= nowPage%>"> <input type = "button" value="작성" class="button" onclick="board_dat_update(this.form)"></div>
						</div>
						<input type="hidden" name="BOARD_RE_REF" value="<%=dat_dto.get(i).getDat_re_ref() %>">
						<input type="hidden" name="BOARD_RE_LEV" value="<%=dat_dto.get(i).getDat_re_lev() %>"> 
						<input type="hidden" name="BOARD_RE_SEQ" value="<%=dat_dto.get(i).getDat_re_seq() %>">
						<% } %>
					<% } else {%>
						<% if(dat_dto.get(i).getDat_re_lev() > 0 ) {%> 	
						<div class = "board_dat_read_dat">						
							<div>
								<img src = "image/dat.png" >
							</div>	
							<div>
								<div class = "float_left">
									<div><%= dat_dto.get(i).getDat_id() %></div>
									<div><%= dat_dto.get(i).getDat_date() %> &nbsp;	<%if(id == null) { } else {%><a href = "boarddatreplyform.bo?board_num=<%= dto.getBOARD_NUM()%>&dat_board_num=<%= dat_dto.get(i).getDat_num()%>&page=<%=nowPage%>&id=<%=dat_dto.get(i).getDat_id()%>">답글쓰기</a><%} %>
										<% if (dat_dto.get(i).getDat_id().equals(id)) { %>
										&nbsp;&nbsp;<input type = "button"  value="수정" class="button" onclick ="location.href = 'boarddatupdateForm.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%= String.valueOf(dto.getBOARD_NUM())%> +'&page=' + <%= nowPage %>">
										&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
										<% } else if("admin".equals(id)) {%>
											&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
										<% } %>
									</div>
								</div>
								<div class = "text_left_clear_both"><textarea readonly = "true"><%= dat_dto.get(i).getDat_content() %></textarea></div>
							</div>	
						</div>
					<% } else {%>
						<div class = "board_dat_read">	
							<div>
								<img src = "image/dat.png" >
							</div>
							<div>
								<div class = "float_left">
									<div><%= dat_dto.get(i).getDat_id() %></div>
									<div><%= dat_dto.get(i).getDat_date() %> &nbsp;	<%if(id == null) { } else {%><a href = "boarddatreplyform.bo?board_num=<%= dto.getBOARD_NUM()%>&dat_board_num=<%= dat_dto.get(i).getDat_num()%>&page=<%=nowPage%>&id=<%=dat_dto.get(i).getDat_id()%>">답글쓰기</a><%} %>
										<% if (dat_dto.get(i).getDat_id().equals(id)) { %>
										&nbsp;&nbsp;<input type = "button"  value="수정" class="button" onclick ="location.href = 'boarddatupdateForm.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%= String.valueOf(dto.getBOARD_NUM())%> +'&page=' + <%= nowPage %>">
										&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
										<% } else if("admin".equals(id)) {%>
											&nbsp;&nbsp;<input type = "button" value="삭제" class="button" onclick="javascript:if(confirm('정말 삭제 하시겠습니까?')){location.href = 'boarddatdeletePro.bo?dat_board_num=' + <%= dat_dto.get(i).getDat_num() %> +'&board_num=' + <%=dto.getBOARD_NUM()%> +'&page=' + <%= nowPage %>}">
										<% } %>
									</div>
								</div>
								<div class = "text_left_clear_both"><textarea readonly = "true"><%= dat_dto.get(i).getDat_content() %></textarea></div>
							</div>
						</div>
					<% } %>
				<%} %>
				<% } 
			}%>
			<div class = "board_dat_write">
				<div><textarea name ="write"></textarea></div>
				<div><input type = "button" value="등록" class="button" onclick="board_dat_write(this.form)"></div>
			</div>
		</form>
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
		
	</body>
</html>

