<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.BoardBean"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    String cho = (String)request.getAttribute("cho");
    String search = (String)request.getAttribute("search");
    String arr = (String)request.getAttribute("array");
    if(arr == null) {
    	arr = "";
    }
    if(cho == null) {
    	cho = "";
    }
    if(search == null) {
    	search = "";
    }
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<!doctype html>
<html>
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
  				height : 1200px;
  				border-top : 1px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  				text-align : left;
  			}
  			#section_id article {
  				width : 1036px;
  				height : 950px;
  				margin : auto;
  				background-color : white;
  			}	
  			.free {
  				width : 816px;
  				margin: auto;
  			}
  			.total {
  				width : 816px;
  				margin : auto;
  				text-align : right;
  				font-size : small;
  			}
  			.free > div {
  				float : left;
  				width : 408px;	
  				text-align : right;			
  			}
  			.free > div:first-child {
  				text-align : left;			
  			}
  			.button_search{
				color : white; font-size : 11px; background:black; border-color : black; height : 30px;
			}
			.search {
				height : 24px;
			}
			.cho {
				height : 30px;
				width : 100px;
			}
  			#section_id article > div table {
				width : 816px;
				margin : auto;
  			}
  			table tr:first-child{
				background-color : #eeeeee;
				height : 50px;
  			}
  			table tr:first-child td:nth-child(2n+1){
				width : 100px;
  			}
  			table tr:first-child td:nth-child(2){
				text-align:center;
  			}
  			table tr td:nth-child(2){
				text-align:left;
				width : 350px;
  			}
  			table tr td:nth-child(4){
				width : 91px;
  			}
  			table tr td{
  				height : 41px;
  				border-bottom : 1px solid;
  				border-color : #D5D5D5;		
  			}
  			table a {
  				color : black;
  				line-height : 40px;
  			}
  			table a:hover {
  				color : blue;
  			}
  			article > div:last-child { 
  				width : 816px;
  				margin : 15px auto;
  				text-align : right;
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
			.array {
				width : 150px;
				border : 0;			
			}
			.button {
				 background-color: #40AA82;
   				 color: white;
   				 border: 0;
			}
		</style>	
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<script>
		function array_change(form) {
			if(form.array.value == "정렬") {
				location.href="boardList.bo?page=1";
			}
			else {
				location.href="boardListArrPro.bo?array=" + form.array.value +"&page=1";
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

	<body>
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
			<form action = "boardSearchPro.bo" method = "get">
			<article>
				<div>
				<br><div class ="total">게시글 수  : <%=listCount %></div><br>
					<div class ="free">
						<div>
							<input type ="hidden" name ="page" value = "1">
							<select name="array" onchange="array_change(this.form)" class = "array">	
								<% if(arr.equals("조회수↑")) { %>
									<option value="정렬">정렬 기준</option>
									<option value="조회수↑" selected >높은조회수</option>
									<option value="조회수↓">낮은조회수</option>
									<option value="번호↑">추가된 날짜(최신순)</option>
									<option value="번호↓">추가된 날짜(오래된순)</option>
								<% } else if(arr.equals("조회수↓")) {%>	
									<option value="정렬">정렬 기준</option>
									<option value="조회수↑">높은조회수</option>
									<option value="조회수↓" selected>낮은조회수</option>
									<option value="번호↑">추가된 날짜(최신순)</option>
									<option value="번호↓">추가된 날짜(오래된순)</option>
								<% } else if(arr.equals("번호↑")) {%>	
									<option value="정렬">정렬 기준</option>
									<option value="조회수↑">높은조회수</option>
									<option value="조회수↓">낮은조회수</option>
									<option value="번호↑" selected>추가된 날짜(최신순)</option>
									<option value="번호↓">추가된 날짜(오래된순)</option>
								<% } else if(arr.equals("번호↓")) {%>	
									<option value="정렬">정렬 기준</option>
									<option value="조회수↑">높은조회수</option>
									<option value="조회수↓">낮은조회수</option>
									<option value="번호↑">추가된 날짜(최신순)</option>
									<option value="번호↓" selected>추가된 날짜(오래된순)</option>
								<% } else {%>
									<option value="정렬">정렬 기준</option>
									<option value="조회수↑">높은조회수</option>
									<option value="조회수↓">낮은조회수</option>
									<option value="번호↑">추가된 날짜(최신순)</option>
									<option value="번호↓">추가된 날짜(오래된순)</option>								
								<%} %>
							</select>
						</div>
						<div> 		
							<select name="cho" class ="cho">
									<%if(cho.equals("작성자")) { %>
										<option value="작성자" selected>작성자</option>		
										<option value="제목">제목</option>
										<option value="번호">번호</option>
										<option value="내용">내용</option>
									<% } else if(cho.equals("제목")) { %>
										<option value="작성자">작성자</option>		
										<option value="제목" selected>제목</option>
										<option value="번호">번호</option>
										<option value="내용">내용</option>
									<% } else if(cho.equals("번호")) { %>
										<option value="작성자">작성자</option>		
										<option value="제목">제목</option>
										<option value="번호" selected>번호</option>
										<option value="내용">내용</option>
									<% } else if(cho.equals("내용")) { %>
										<option value="작성자">작성자</option>		
										<option value="제목">제목</option>
										<option value="번호">번호</option>
										<option value="내용" selected>내용</option>
									<% } else {%>
										<option value="작성자">작성자</option>		
										<option value="제목">제목</option>
										<option value="번호">번호</option>
										<option value="내용">내용</option>
									<% } %>							
							</select>
							<input type="text" name="search" class="search" value = "<%= search%>"/>
							<input type="submit" class ="button_search" value="검색" />
						</div>
					</div><br><br>
					<table border="0" cellspacing="0">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>파일</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>조회수</td>
						</tr>
						<% if(articleList != null && listCount > 0){ %>
						<% 
							for(int i=0;i<articleList.size();i++){	
						%>	
							<tr>
								<td><%=articleList.get(i).getBOARD_NUM()%></td>
								<td>
									<%if(articleList.get(i).getBOARD_RE_LEV()!=0){%><%for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>
									&nbsp;<%} %>└>(<%= articleList.get(i).getBOARD_RE_REF()%>번 답글 <%=articleList.get(i).getBOARD_RE_LEV()%>)<%}else{%> <% } %> 
									<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
									<%=articleList.get(i).getBOARD_TITLE()%></a><%if(articleList.get(i).getBOARD_DAT_COUNT()==0){ } else { %>(<%=articleList.get(i).getBOARD_DAT_COUNT() %>) <%}%> <%if(articleList.get(i).getBOARD_DATE().length() == 5)  { %> &nbsp;<img src = 'image/new.png'></td> <% } %>								
								</td>
							<% if(articleList.get(i).getBOARD_FILE() != null) { %>
								<td><img src ="image/file.png"></td>
							<% } else { %>
								<td></td>
							<% } %>
							<td><%=articleList.get(i).getBOARD_ID() %></td>
							<td><%=articleList.get(i).getBOARD_DATE() %></td>
							<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
							</tr>
							<% } 
							}%>

					</table>
					</div>
						<br>
						<%if(nowPage<=1){ %>
						[이전]&nbsp;
						<%}else{ %>
							<% if(!cho.equals("")) {%>
								<a href ="boardSearchPro.bo?cho=<%=cho%>&search=<%=search%>&page=<%=nowPage-1 %>">[이전]</a>&nbsp;
							<% } else if(!arr.equals("")) { %>
								<a href ="boardListArrPro.bo?array=<%=arr%>&page=<%=nowPage-1 %>">[이전]</a>&nbsp;	
							<% } else {%>
								<a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
							<% } %>		
						<%} %>
				
						<%for(int a=startPage;a<=endPage;a++){
								if(a==nowPage){%>
						[<%=a %>]
						<%}else{ %>
							<% if(!cho.equals("")) {%>
								<a href ="boardSearchPro.bo?cho=<%=cho%>&search=<%=search%>&page=<%=a %>">[<%=a %>]</a>&nbsp;
							<% } else if(!arr.equals("")) { %>
								<a href ="boardListArrPro.bo?array=<%=arr%>&page=<%=a %>">[<%=a %>]</a>&nbsp;	
							<% } else {%>
								<a href="boardList.bo?page=<%=a %>">[<%=a %>] </a>&nbsp;
								<%} %>	
						<%} %>
						<%} %>
				
						<%if(nowPage>=maxPage){ %>
						[다음]
						<%}else{ %>
							<% if(!cho.equals("")) { %>
								<a href ="boardSearchPro.bo?cho=<%=cho%>&search=<%=search%>&page=<%=nowPage+1 %>">[다음]</a>&nbsp;	
							<% } else if(!arr.equals("")) { %>
								<a href ="boardListArrPro.bo?array=<%=arr%>&page=<%=nowPage+1 %>">[다음]</a>&nbsp;
							<% } else { %>
								<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
							<% } %>
						<%}%>
					<div> <input type = button value = "작성" onclick = "location.href='boardWriteForm.bo'" class = "button"/> </div>			
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