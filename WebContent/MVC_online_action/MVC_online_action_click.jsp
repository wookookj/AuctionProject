<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "vo.OnlineActionBean"%>
<%@ page import = "vo.OnlineActionTotalBean"%>
<%@ page import = "vo.MypageBean"%>
<%@ page import = "vo.OnlineActionChatBean"%>
<%@ page import = "java.util.*"%>
<!doctype html>
<html>
	<% String id = (String)session.getAttribute("id");
	String birth = (String)session.getAttribute("birth");
	String birth_chk = null;
	OnlineActionBean actionbean_dto = (OnlineActionBean)request.getAttribute("article");
	MypageBean mypagebean = (MypageBean)request.getAttribute("mypagebean");	
	String nowPage = (String)request.getAttribute("page");
	OnlineActionTotalBean total = (OnlineActionTotalBean)request.getAttribute("total");
	OnlineActionTotalBean action_end = (OnlineActionTotalBean)request.getAttribute("action_end");
	OnlineActionTotalBean buy_id = (OnlineActionTotalBean)request.getAttribute("buy_id");
	OnlineActionTotalBean sell_id = (OnlineActionTotalBean)request.getAttribute("sell_id");
	
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
		if(birth != null) {
			birth_chk = birth.substring(0,4);
		}
		if(actionbean_dto.getAction_adult().equals("19세이상")) {
			if(Integer.parseInt(birth_chk)>2001) {
				out.print("<script>history.go(-1);alert('미성년자는 불가합니다'); </script>");
			}
		}
	%>
	<head>
		<meta charset="UTF-8">
		<title>상품정보</title>
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
			b {
				font-size : 20px;
				color : #114DA5;
			}
			text_small {
				font-size : small;
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
  				height : auto;
  				border-top : 2px solid;
  				border-color : #eeeeee;
				background: url("image/mainListbg.gif");
    			background-size: 100% 1000px;
    			background-attachment : fixed;
    			background-repeat : no-repeat;
  				text-align : left;
  				padding-bottom : 100px;
  				z-index : 3;
  			}
  			#section_id > div {
  				width : 1036px;
  				margin : 50px auto 0 auto;
  			}
  			#section_id > div:last-child {
  				width : 760px;
  			}
  			#section_id article {
  				width : 1036px;
  				height : auto;
  				margin : auto;		
  				background-color : white;
  				overflow: hidden;
  				z-index : 4;
  			}
  			#section_id article > div {
  				float : left;
  			}
  			#section_id article > div:first-child {
  				width : 963px;
  				height : 60px;
  				border-bottom : 1px solid;
  				margin-left : 30px;
  			}  			
  			#section_id article > div:nth-child(2) {
  				width : 520px;
  				height : 480px;
  				margin-top : 50px;
  				margin-left : 30px;
  				position:relative;
  			}  	
  			#section_id article > div:nth-child(3) {
  				width : 470px;
  				height : auto;
  				margin-top : 50px;
  			} 				
  			#section_id article div img {
  				max-height : 100%;
  				max-width : 100%;
  				vertical-align:middle;
  			}
  			#section_id article div:last-child div:last-child {
  				text-align : right;
  			}   			  			  						
  			#section_id article div ul {
  				list-style-type: none;
  				margin : 0;
  				padding : 0;
  				height : 440px;
  			}
  			#section_id article div ul li{
  				clear : both;
  				height : auto;
  				margin-left :30px;
  				line-height : 40px;
  				text-align : center;
  			}	
  			#section_id article div ul li:nth-child(4) div:last-child {
  				font-size : small;
  			}
  			#section_id article div ul li div {
  				float : left;
  				width : 100px;
  				background-color : #D5D5D5;
  			}
  			#section_id article div ul li:first-child div{
  				background-color : white;
  				height : 50px;
  			}
  			#section_id article div ul li:first-child div:nth-child(2){
  				width : 150px;
  				text-align : center;
  				padding : 0;
  			}
  			#section_id article div ul li:first-child div:last-child {
	  			width : 150px;
	  			text-align : right;
	  			padding-left : 10px;
  			}
  			#section_id article div ul li:nth-child(2) div{
  				border-top : 1px solid;
  			}
  			#section_id article div ul li div:nth-child(2) {
  				width : 290px;
  				text-align : left;
  				padding-left : 20px;
  				background-color : white;
  			}
  			#section_id article div ul li:first-child div:nth-child(3) input {
				border : 0;
				height : 30px;
				color : white;
				background-color : #114DA5;
				width : 130px;
  			}
  			#section_id article div ul li select{
  				width : 304px;
  				background-color : white;
  				border-color : white;		
  			}
  			#explain_container > div {
  				border-top : 1px solid;
  				width : 410px;
  				height : 110px;
  				margin-left :30px;
  			}
  			#explain_container > div > div {
  				float : left;
  				width : 200px;
  			}
  			#explain_container > div > div:first-child {
  				width : 100px;
  				text-align : center;
  				background-color : #D5D5D5;
  				line-height : 40px;
  			}
  			#explain_container > div > div:nth-child(2) {
  				width : 290px;
  				padding-left : 20px;
  				text-align : left;
  				line-height : 40px;
  			}
  			#explain_container > div > div:nth-child(3) {
				width : 126px;
				margin-top:20px;
  			}
  			#explain_container > div > div:nth-child(4) {
				width : 126px;
				margin-top : 20px;
				margin-left : 16px;
  			}
  			#explain_container > div > div:nth-child(5) {
				width : 126px;
				margin-top : 20px;
				margin-left : 16px;
  			}
  			#imformation_container {	
  				margin-top : 50px;
  				width : 982px;
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
  				width : 963px;
  				height : auto;
  				margin-top : 30px;
  				margin-left : 17px;
  			}
  			#imformation_container > div:last-child textarea{
  				width : 957px;	
  				height : auto;
  				background-color : white;	
  				resize : none;
  				outline: none;
  				border : 0;
  			}
  			#image_container {
  				border:1px solid;
  				border-color : #F6F6F6;
  				text-align : center;
  				width : 520px;
  				height : 480px;
  				line-height : 475px;
  			}
  			.image_container_sub {
  				margin-top : 21px;
  				height : auto;
  				text-align : left;
  			}
			.action_start_money {
  				width : 300px;
  				text-indent : 2%;
  				background-color : white;	
  				border-color : white;
  				border : 0;
  				height : 20px;
  				outline: none;
			}  		
  			.action_name {
  				width : 300px;
  				text-indent : 2%;
  				background-color : white;	
  				border-color : white;
  				border : 0;
  				height : 20px;
  				outline: none;
  			}
  			.action_sell {
				background-color : #114DA5;
				color : white;
				border-width : 0;
				width : 126px;
				height : 50px;
				font-weight : bold;
			}	
			.action_mylist {
				background-color : #B3A586;
				color : white;
				border-width : 0;
				width : 126px;
				height : 50px;
				font-weight : bold;
			}
			.action_sell_back {
				background-color : #FFB2F5;
				color : white;
				border-width : 0;
				width : 126px;
				height : 50px;
				font-weight : bold;
			}
			.action_action {
				background-color : #5CD1E5;
				color : white;
				border-width : 0;
				width : 126px;
				height : 50px;
				font-weight : bold;
			}
  			/* footer */
  			#footer_id {
  				background-color : #8C8C8C;
  				height : 200px; 
  				text-align : left;	
  				clear : both;
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
			.action {
				border : 1px solid;
				border-color : #D5D5D5;
				width : 760px;
				height : 700px;
				background-color : white;
				position : absolute;
				top : 350px;
			}
			.action b {
				color : white;
			}
			.action > div:first-child {
				width : 100%;
				height : 58px;
				background-color : #114DA5;
				color : white;
				line-height : 58px;
			}
			.action > div:first-child > div {
				float :left;
				width : 150px;
			}
			.action > div:first-child > div:last-child {
				width : 570px;
				text-align:right;
				line-height : 73px;
			}
			.action > div:first-child > div:first-child {
				margin-left : 20px;
			}
			.online_action {
				border : 1px solid;
				border-color : #D5D5D5;
				width : 760px;
				height : 700px;
				background-color : white;
				position : absolute;
				top : 350px;
				margin-left : 138px;
			}
			.online_action > div {
				float : left;
			}
			.online_action > div:nth-child(2) {
				margin : 10px 0 0 10px;
			}
			.online_action > div:nth-child(3) {
				width : 360px;
				height : 450px;
				margin : 10px 0 0 15px;
			}
			.online_action > div:nth-child(3) > div {
				float: left;
				width : 110px;
				height : 60px;
				border : 0;
				margin-top : 10px;
				margin-right : 15px;
			}
			.online_action > div:nth-child(3) > div:first-child {
				clear : both;
				width : 360px;
				height : 380px;
				margin-top : 0;
				margin-left : 0;
				border-bottom : 1px solid;
			}
			.online_action > div:nth-child(3) > div:first-child > div > div {
				float : left;
				width : 100px;
				height : 45px;
				line-height : 50px;
			}
			.online_action > div:nth-child(3) > div:first-child > div > div:first-child{
				background-color : #D5D5D5;
			}
			.online_action > div:nth-child(3) > div:first-child > div > div:last-child {
				width : 230px;
				margin-left : 20px;
				text-align : left;
			}
			.online_action > div:nth-child(3) > div:first-child > div:last-child > div {
				height : 80px;
				line-height : 80px;
				padding-top : 20px;
			}
			.online_action > div:nth-child(3) > div:first-child > div:last-child > div:last-child {
				line-height : 20px;
				overflow : auto;
				font-size : 15px;
			}
			.online_action > div:nth-child(3) > div:first-child > div:first-child{
				clear : both;
				height : 50px;
				width : 360px;
				line-height : 50px;
				background-color : #4374D9;
				border-bottom: 5px solid;
				border-color : white;
				font-size : 15px;
				font-weight : bold;
				color : white;
			}
			.online_action > div:nth-child(3) > div:nth-child(2) > input {
				background-color : #114DA5;
				width : 100%;
				height : 100%;
				border : 0;
				color : white;
			}
			.online_action > div:nth-child(3) > div:nth-child(3) > input {
				background-color : #F15F5F;
				width : 100%;
				height : 100%;
				border : 0;
				color : white;
			}
			.online_action > div:nth-child(3) > div:last-child {
				margin-right : 0;
			}
			.online_action > div:nth-child(3) > div:last-child > input{
				background-color : #FFB2F5;
				width : 100%;
				height : 100%;
				border : 0;
				color : white;
			}
			.online_action > div:nth-child(4) {
				clear : both;
				width : 735px;
				border : 0;
				height : 150px;
				margin : 20px 0 0 10px;
			}
			.online_action > div:nth-child(4) > div {
				background-color : #eeeeee;
				float : left;
				width : 50px;
				height : 30px;
				margin-top : 120px;
				margin-left : 10px;
			}
			.online_action > div:nth-child(4) > div input {
				background-color : orange;
				width : 100%;
				height : 100%;
				border : 0;
				color : white;
			}
			.online_action > div:nth-child(4) > div:first-child {
				margin-left : 0;
				margin-top : 0;
				width : 675px;
				height : 150px;
			}
			.online_action > div:nth-child(4) > div:first-child  textarea {
				width : 669px;
				height : 144px;
				resize : none;
  				outline: none;
  				border : 1px solid;
  				border-color : #8C8C8C;
			}
			.online_action b {
				color : white;
			}
			.online_chat {			
				text-align : left;
				width : 360px;
				height : 451px;
			}
			.online_chat textarea {
				background-color : lightblue;	
				width : 360px;
				height : 451px;
				overflow-y: auto;
				resize : none;
  				outline: none;
  				border : 0;
  				font-size : 18px;
  				color : #161616;
			}
			.online_action > div:first-child {
				width : 100%;
				height : 58px;
				background-color : #114DA5;
				color : white;
				line-height : 58px;
			}
			.online_action > div:first-child > div {
				float :left;
				width : 150px;
			}
			.online_action > div:first-child > div:last-child {
				width : 570px;
				text-align:right;
				line-height : 73px;
			}
			.online_action > div:first-child > div:first-child {
				margin-left : 20px;
				text-align : left;
			}
			.action_body {
				width : 600px;
				height : 500px;
				margin : 70px auto 70px auto;
			}
			.action_body b {
				color : black;
			}
			.action_body > div:first-child {
				border-bottom : 1px solid;
				height : 30px;
			}
			.action_body > div:nth-child(2) {
				width : 700px;
				height : 45%;
			}
			.action_body > div:nth-child(2) > div {
				float : left;
				width : 150px;
				border : 1px solid;
				text-align : center;
				border-left : 0;
				border-top : 0;
				height : 40px;
				line-height : 40px;
				background-color : #f8f8f8;
				border-color : #D5D5D5;
			}
			.action_body > div:nth-child(2) > div:nth-child(2n) {
				width : 419px;
				border-right : 0;
				background-color : white;
				text-align : left;
				padding-left : 30px;
			}
			.action_body > div:nth-child(2) > div:nth-child(2n) > input[type="text"] {
				height : 20px;
				width : 80px;
			}
			.action_body input[type="button"] {
				border : 0;
				height : 30px;
				width : 70px;
			}
			.submit {
				border : 0;
				height : 30px;
				color : white;
				background-color : #114DA5;
				width : 70px;
			}
			.action_body > div:nth-child(3) {
				text-align : center;
			}
			.action_body > div:nth-child(4) {
				margin-top : 30px;
				border-top : 1px solid;
				height : 200px;
				border-color : #D5D5D5;
			}
			.action_body > div:nth-child(4) > div:first-child {
				height : 50px;
				line-height : 40px;
			}	
			.action_body > div:nth-child(4) > div:nth-child(2) {
				height : 100px;
			}		
			.action_num {
			  	width : 100px;
  				background-color : white;	
  				border-color : white;
  				border : 0;
  				height : 20px;
  				outline: none;
  				text-align : center;
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
			}
			.slidedown {
				position : fixed;
				bottom : 50px;
				left : 96%;
				width : 50px;
				height : 50px;
				background-color : #eeeeee;
				line-height : 50px;
			}
			.parent {
				width : 1036px;
				margin : auto;
			}
		</style>	
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
    $(document).ready(function() {
        $('#imformation_container').on( 'keyup', 'textarea', function (e){
          $(this).css('height', 'auto' );
          $(this).height( this.scrollHeight );
        });
        $('#imformation_container').find( 'textarea' ).keyup();
        
      });
	window.onload = function(){ 
		ajaxTime();
		ajaxMoney();	
		ajaxBuy();
		ajaxEndInsert();
		action_end();		
		action_chat();
		var ajaxtime = setInterval("ajaxTime()", 1000); 
		var ajaxmoney = setInterval("ajaxMoney()", 100);
		var ajaxbuy = setInterval("ajaxBuy()",1000);
		var actionend = setInterval("action_end()",1000);
		var actionchat = setInterval("action_chat()",1000);
	} 
	function ajaxEndInsert() {
	       $.ajax({
	           type : "GET",
	           url : "online_action_click.ajax",
	           data : {action_time : "<%= actionbean_dto.getAction_time()%>", page : <%=nowPage%>,action_buy : <%= actionbean_dto.getAction_buy()%>},
	           dataType : "text",
	           cache: false,
	           async : false,
	           error : function(data) {
	             alert('통신실패!!');
	           },
	           success : function(data) {
	         	 ajax.ajax_time.value = data;
	         	 const data_time = $.trim(data);
	         	 if(data_time == "로딩 중") {
	     	        $.ajax({
	    	            type : "GET",
	    	            url : "online_action_chk.ajax",
	    	            cache: false,
	    	            async : false,
	    	            data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>, sell_id : "<%=total.getAction_sellid() %>", buy_id : "<%= total.getAction_buyid()%>"},            
	    	            dataType : "text",
	    	            error : function(data) {
	    	              	alert('통신실패!!');
	    	            },
	    	            success : function(data) {
	    	            }   
	    	        });
	         	 }
	          }   
	        });
	}
    function ajaxTime(){
       $.ajax({
          type : "GET",
          url : "online_action_click.ajax",
          data : {action_time : "<%= actionbean_dto.getAction_time()%>", 
        	  page : <%=nowPage%>,action_buy : <%= actionbean_dto.getAction_buy()%>, 
        	  action_end : "<%= actionbean_dto.getAction_end()%>"},
          dataType : "text",
          cache: false,
          error : function(data) {
            alert('통신실패!!');
          },
          success : function(data) {
        	 $(".ajax").html(data);
        	 ajax.ajax_time.value = data;
        	 const data_time = $.trim(data);
        	 if(data_time == "거래 대기") {
        		 $("#action_buy_money").attr("disabled","true");
        		 $(".action_action").show();
        	 }
        	 else if(data_time == "경매 종료") {
                 $.ajax({
                     type : "GET",
                     url : "online_action_end.ajax",
                     cache: false,
                     data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
                     dataType : "text",
                     error : function(data) {
                       alert('통신실패!!');
                     },
                     success : function(data) {                      	
                     }   
                   });
        		 $("#action_buy_money").attr("disabled","true");
        		 $(".action_action").hide();
        	 }
        	 else if(data_time == "경매 취소") {
        		 $("#action_buy_money").attr("disabled","true");
        		 $(".action_action").hide();
        	 }
         }   
       });
    }
    function ajaxMoney(){
        $.ajax({
          type : "GET",
          url : "online_action_click_money.ajax",
          data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
          dataType : "text",
          cache: false,
          async : false,
          error : function(data) {
            alert('통신실패!!');
          },
          success : function(data) {
        	if(data != 0 ) {    	
        		var commaprice = new Intl.NumberFormat('ko-KR').format(data);
            	$("#ajax_money").html(data);
            	//ajax.action_money.value = data;
            	$(".ajax_now_money").html("<b>"+commaprice+" 원</b>");
        	}
          }   
        });
    }
    function ajaxBuy(){
        $.ajax({
          type : "GET",
          url : "online_action_click_Buy.ajax",
          data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
          dataType : "text",
          cache: false,
          async : false,
          error : function(data) {
            alert('통신실패!!');
          },
          success : function(data) {
          	$(".ajax_buy").html(data);
          }   
        });
    }
    function ajaxInsert(){
    	var action_buy_money = parseInt(ajax.action_buy_money.value);		
        $.ajax({
          type : "GET",
          url : "online_action_click_action.ajax",
          cache: false,
          async : false,
          data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>, buy_id : "<%= id%>", action_buy_money : action_buy_money},
          dataType : "text",
          error : function(data) {
            alert('통신실패!!');
          },
          success : function(data) {
        	  if($.trim(data)  ==  "emoney_out"){
        		  alert("잔여이머니가 부족합니다");
        		  ajax.action_buy_money.focus();
        		  ajax.action_buy_money.select();
        	  }
          }   
        });
    }
    function action_ok() {
    	if(confirm("정말 경매 확정 하시겠습니까?")){     
    		// 구매자 경매 확정
	    	<% if(id.equals(total.getAction_buyid())) { %>  
	        $.ajax({
	            type : "GET",
	            url : "online_action_buyid_chk_money.ajax",
	            cache: false,
	            async : false,
	            data : {buy_id : "<%= total.getAction_buyid()%>", 
	            page : <%=nowPage%>, end_money : <%= total.getAction_end_money()%>},            
	            dataType : "text",
	            error : function(data) {
	              	alert('통신실패!!');
	            },
	            success : function(data) {
	              // 위에 문장을 통해 잔여이머니 부족시 경매확정 불가능
	          	  if($.trim(data)  ==  "emoney_out") {
	        		  alert("잔여이머니가 부족합니다");
	        	  }
	          	  else {
		      	        $.ajax({
		    	            type : "GET",
		    	            url : "online_action_buyid_chk.ajax",
		    	            cache: false,
		    	            async : false,
		    	            data : {action_num : <%= actionbean_dto.getAction_num()%>, 
		    	            page : <%=nowPage%>, buy_id : "<%= total.getAction_buyid()%>"},            
		    	            dataType : "text",
		    	            error : function(data) {
		    	              	alert('통신실패!!');
		    	            },
		    	            success : function(data) {
		    	            	$(".action_clear").prop("disabled","true"); // 경매확정 버튼 비활성화
		    	            	$(".action_fail").prop("disabled","true"); // 경매취소 버튼 비활성화
		    		            $(".action_clear").css("background-color","white");
		    		            $(".action_fail").css("background-color","white"); 		    		            
		    	            }
		    	        });
	          	  }
	            }   
	        });

	    	<% } else if( id.equals(total.getAction_sellid())) {%>
	    	// 판매자 경매 확정
	        $.ajax({
	            type : "GET",
	            url : "online_action_sellid_chk.ajax",
	            cache: false,
	            async : false,
	            data : {action_num : <%= actionbean_dto.getAction_num()%>,
	           	page : <%=nowPage%>, sell_id : "<%=total.getAction_sellid() %>"},            
	            dataType : "text",
	            error : function(data) {
	              	alert('통신실패!!');
	            },
	            success : function(data) {
	            	$(".action_clear").prop("disabled","true"); // 경매확정 버튼 비활성화
	            	$(".action_fail").prop("disabled","true"); // 경매취소 버튼 비활성화
		            $(".action_clear").css("background-color","white");
		            $(".action_fail").css("background-color","white");
	            }   
	        });       
	    	<% } %>
    	}
    }
    function action_fail() {
    	if(confirm("정말 경매 취소 하시겠습니까?\n(＊한번 취소한 경매는 복구할 수 없습니다)")){        
	    	<% if(id.equals(total.getAction_buyid())) { %>  
	    	// 구매자 경매 취소
                    $.ajax({
                        type : "GET",
                        url : "online_action_buyid_cancel.ajax",
                        cache: false,
                        async : false,
                        data : {buy_id : "<%= total.getAction_buyid()%>", page : <%=nowPage%>},
                        // 구매자 구매 등급 하락
                        dataType : "text",
                        error : function(data) {
                          alert('통신실패!!');
                        },
                        success : function(data) {  
                            $.ajax({
                                type : "GET",
                                url : "online_action_cancel.ajax",
                                cache: false,
                                async : false,
                                data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
                                dataType : "text",
                                error : function(data) {
                                  alert('통신실패!!');
                                },
                                success : function(data) {   
                                	// 물품 상태를 경매취소로 변경
                                	alert("경매가 취소 되었습니다");
                                	window.location.href = window.location.href;
                                }   
                            });
                        }   
                    });
	    	<% } else if( id.equals(total.getAction_sellid())) {%>
	    		// 판매자 경매 취소
                    $.ajax({
                        type : "GET",
                        url : "online_action_sellid_cancel.ajax",
                        cache: false,
                        async : false,
                        data : {sell_id : "<%=total.getAction_sellid() %>", page : <%=nowPage%>},
                        // 판매자 판매 등급 하락
                        dataType : "text",
                        error : function(data) {
                          alert('통신실패!!');
                        },
                        success : function(data) {
                            $.ajax({
                                type : "GET",
                                url : "online_action_cancel.ajax",
                                cache: false,
                                async : false,
                                data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
                                dataType : "text",
                                error : function(data) {
                                  alert('통신실패!!');
                                },
                                success : function(data) {    
                                	// 물품 상태를 경매취소로 변경
                                	alert("경매가 취소 되었습니다");
                                	window.location.href = window.location.href;
                                }   
                            });
                        }   
                    });
	    	<% } %>
    	}
    }
    function action_end() {
        $.ajax({
            type : "GET",
            url : "online_action_end_chk.ajax",
            cache: false,
            async : false,
            data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
            dataType : "text",
            error : function(data) {
            	alert('통신실패!!!!!');
            },
            success : function(data) {
            	// 입찰자, 판매자 경매 확정 클릭 시 1씩 증가 
            	if($.trim(data)  ==  2){ // 입찰자, 판매자 둘다 경매 확정 클릭 시 조건
                    $.ajax({
                        type : "GET",
                        url : "online_action_end.ajax",
                        cache: false,
                        data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>},
                        dataType : "text",
                        error : function(data) {
                          alert('통신실패!!');
                        },
                        success : function(data) {                      	
                        	action_end_money(); // 판매자 이머니 증가, 입찰자 이머니 차감
                        	action_end_grd(); // 판매자 판매등급 증가, 구매자 구매등급 증가
                        	alert("경매가 종료 되었습니다");
                        	window.location.href = window.location.href;
                        }   
                      });
            	}
            }   
          }); 
    }
    function action_end_money() {
		$.ajax({
            type : "GET",
            url : "online_action_end_chk_money.ajax",
            cache: false,
            async : false,
            data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>,sell_id : "<%=total.getAction_sellid() %>", buy_id : "<%= total.getAction_buyid()%>", end_money : <%= total.getAction_end_money()%>},
            dataType : "text",
            error : function(data) {
              alert('통신실패!!');
            },
            success : function(data) {              	
            }
        });               
    }
    function action_end_grd() {
		$.ajax({
            type : "GET",
            url : "online_action_end_chk_grd.ajax",
            cache: false,
            async : false,
            data : {action_num : <%= actionbean_dto.getAction_num()%>, page : <%=nowPage%>,sell_id : "<%=total.getAction_sellid() %>", buy_id : "<%= total.getAction_buyid()%>"},
            dataType : "text",
            error : function(data) {
              alert('통신실패!!');
            },
            success : function(data) {              	
            }
        });               
    }
    function action_chat_submit() {
    	// 엔터키 누를시 엔터값 빼기
    	var value = ajax.action_chat.value.replace(/\n$/gm, ''); 
		$.ajax({
            type : "GET",
            url : "online_action_chat_insert.ajax",
            cache: false,
            async : false,
            data : {action_num : <%= actionbean_dto.getAction_num()%>, 
            page : <%=nowPage%>, id : "<%=id %>", action_chat : value + "\n"},
            dataType : "text",
            error : function(data) {
              alert('통신실패!!');
            },
            success : function(data) {         
            	ajax.action_chat.value = ""; // DB에 값이 저장되면 좌측텍스트필드값 초기화
        		action_chat();  // DB에서 해당되는 물품번호의 채팅가져오기
        		// 전송 버튼 누를시 채팅창 맨아래로 이동
        		$('.online_chat textarea').scrollTop($('.online_chat textarea')[0].scrollHeight);
            }
        });
    }
    function action_chat() {
		$.ajax({
            type : "GET",
            url : "online_action_chat_select.ajax",
            cache : false,
            async : false,
            data : {action_num : <%= actionbean_dto.getAction_num()%>},
            dataType : "text",
            error : function(data) {
              alert('통신실패!!');
            },
            success : function(data) {
            	// DB에서 해당되는 물품번호의 채팅가져오기
            	$('.online_chat textarea').html(data);              	
            }
        });
    }
    
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
	function mylist() {
		if(ajax.action_sellid.value == "<%= id %>") {
			alert("본인이 등록한 물품은 불가능합니다");
		}
		else {
			$.ajax({
	            type : "GET",
	            url : "mypage_mylist.jung",
	            cache: false,
	            async : false,
	            data : {action_num : <%= actionbean_dto.getAction_num()%>,id : "<%=id %>"},
	            dataType : "text",
	            error : function(data) {
	              alert('통신실패!!');
	            },
	            success : function(data) {  
					alert(data);
	            }
	        });
		}
	}
  
	function money_chk(form) {
		var action_buy_money = parseInt(form.action_buy_money.value);
		var action_money = parseInt($(".ajax_now_money"));
		var action_sell_id = ajax.action_sellid.value;
		const element = document.getElementById("ajax_time");
		const elementmoney = document.getElementById("ajax_money");
			
		var exit = element.innerText;
		var nowmoney = elementmoney.innerText;
		if(exit == "경매 종료" || exit =="거래 대기" || exit == "경매 취소") {
			alert("이미 종료(취소)되었거나 대기 중인 경매 입니다");
			form.action_buy_money.value = "";
		}
		else if(ajax.action_sellid.value == "<%= id %>") {
			alert("본인이 등록한 물품은 입찰이 불가능합니다");
			form.action_buy_money.value = "";
		}
		else if(form.action_buy_money.value == "") {
			alert("현재가보다 높은 금액이어야 합니다");
			form.action_buy_money.focus();
		}
		else if(action_buy_money % 1000 != 0) {
			alert("입찰금액은 1000단위 이상이어야 합니다");
			form.action_buy_money.focus();
			form.action_buy_money.select();
		}
		else if(action_buy_money <= nowmoney ) {
			alert("현재가보다 높은 금액이어야 합니다");
			form.action_buy_money.focus();
			form.action_buy_money.select();
		}
		else{
			ajaxInsert();
		}
	}

		$(function (){
			$(".navbox").hide();
			$(".navbox2").hide();
			$(".navbox3").hide();
			$(".action").hide();
			$(".action_action").hide();
			$(".online_action").hide();
								
			if(<%= action_end.getAction_buyid_chk()%> > 0 && "<%= action_end.getAction_buyid()%>"=="<%=id%>") {
	            $(".action_clear").prop("disabled","true");
	            $(".action_fail").prop("disabled","true");
	            $(".action_clear").css("background-color","white");
	            $(".action_fail").css("background-color","white");
			}
			if(<%= action_end.getAction_sellid_chk()%> > 0 && "<%= action_end.getAction_sellid()%>"=="<%=id%>") {
				$(".action_clear").prop("disabled","true");
	            $(".action_fail").prop("disabled","true");
	            $(".action_clear").css("background-color","white");
	            $(".action_fail").css("background-color","white");
			}
			$('.slideup').click(function(){
				$('html,body').animate( {scrollTop : 0},400);
				return false;
			});
			$('.slidedown').click(function(){
				var scrollHeight = $(document).height();
				$('html,body').animate( {scrollTop : scrollHeight},400);
				return false;
			});
  			$("#action").click(function(){
 				$(".action").fadeIn(100);				
 			});
  			$(".action_action").click(function(){
 				$(".online_action").show();	
 				$('.online_chat textarea').scrollTop($('.online_chat textarea')[0].scrollHeight);
 				$(".action").fadeOut(100);
 			});
			$(".close").click(function(){
				$(".action").fadeOut(100);
				$(".online_action").fadeOut(100);
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
       		$(".action_chat").keyup(function(e){
       			e.preventDefault();
       			var code = e.keyCode ? e.keyCode : e.which;	
           	        if(code == 13){
           	            action_chat_submit();
           	        }
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
       					document.querySelector("div#image_container img").src = event.target.result;
       				}	
       			};  		
       			
       			reader.readAsDataURL(event.target.files[0]);
       		});     		
		});
	</script>
	<body>
	<form action ="online_action_click_action.wookook" method="post" name="ajax">
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
				<div><h1>온라인 경매</h1></div>
				<article>
					<div><h1><%=actionbean_dto.getAction_name() %></h1></div>				
					<% 
						String path = "onlineactionfileupload/" + actionbean_dto.getAction_file(); 
					%>	
					<div>
					<div id="image_container"><img src="<%=path%>"></div>
					<%if(id.equals(total.getAction_buyid()) || id.equals(total.getAction_sellid()) ) { %>
						<div class ="image_container_sub"><input type="button" class = "action_action" value= "거래 진행"></div>
					<% } %>			
					</div>
					
					<div id="explain_container">
						<ul>
							<li><div>현재가</div><div class="ajax_now_money"><b><script>var replacemoney = "<%=actionbean_dto.getAction_start_money()%>".toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); document.write(replacemoney);</script>원</b></div><div><input type="button" name="ajax_time" value=""></div></li>
							<li><div>물품번호</div><div><%=actionbean_dto.getAction_num() %></div></li>
							<li><div>물품이름</div><div><%=actionbean_dto.getAction_name() %></div></li>
							<li><div>경매기간</div><div><%=actionbean_dto.getAction_date()%>&nbsp; ~ &nbsp;<%=actionbean_dto.getSetAction_date_day() %></div></li>
							<li><div>시작가격</div><div><script>var replacemoney = "<%=actionbean_dto.getAction_start_money()%>".toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); document.write(replacemoney);</script>원</div></li>
							<li><div>입찰수</div><div class="ajax_buy"><%=actionbean_dto.getAction_buy() %></div></li>
							<li><div>판매자ID</div><div><%=actionbean_dto.getAction_sellid()%></div></li>
							<li><div>물품종류</div><div><%=actionbean_dto.getAction_kind()%></div></li>
							<li><div>배송방법</div><div><%=actionbean_dto.getAction_quick()%></div></li>
							<li><div>연령제한</div><div><%=actionbean_dto.getAction_adult()%></div></li>
						</ul>
						<div>
							<div>판매등급</div><div><%=mypagebean.getMy_sellgrd() %></div>
							<div><input type="button" class = "action_sell" 
							value= "실시간 입찰 " id = "action"></div>
							<div><input type="button" class = "action_mylist" 
							value= "관심 물품" onclick = "mylist()"></div>
							<div><input type="button" class = "action_sell_back" value="뒤로" onclick="location.href = document.referrer;"></div>
						</div>
					</div>
					<div id="imformation_container">
						<div>물품정보</div>
						<div><textarea name="action_content" readonly = "true"><%=actionbean_dto.getAction_content() %></textarea></div>
					</div>
				</article>
				<div class = "parent">
				<div class = "action">
					<div>
						<div><b>입찰하기</b></div>
						<div><img src="image/close.png" class = "close"></div>
					</div>
					<div class ="action_body">
						<div><b><%= actionbean_dto.getAction_name() %></b></div>
						<div>
							<div>판매자</div><div><%= actionbean_dto.getAction_sellid() %></div>
							<div>남은시간</div><div class="ajax" id ="ajax_time"></div>
							<div>배송방법</div><div><%=actionbean_dto.getAction_quick()%></div>
							<div>현재가</div><div id="ajax_money"><%=actionbean_dto.getAction_start_money()%></div>
							<div>입찰금액</div><div><input type = "text" 
							id = "action_buy_money" name = "action_buy_money" 
							maxlength="9" onchange = "checkNumber()"></div>
						</div>
						<div>
							<input type = "button" class = "submit" value="입찰" onclick="money_chk(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button" value="취소" class = "close">
						</div>
						<div>
							<div><b>＊알려드립니다.</b></div>
							<div><text_small>입찰 실수 및 허위입찰은 경매사고로 이어질 수 있으며, 미정산(미입금,구매거부,반품실책 등) 2건이상 누적시
							코베이 이용 제한 됩니다.<br>특히 홈페이지 상단 배너, 추천경매에 노출된 물품 중 위와 같은
							사고가 발생될 경우 1건 누적으로 코베이 이용 제한이 될 수 있으므로 신중한 입찰을 부탁드립니다.</text_small>
							</div>
							<div><text_small>코베이에 등록된 판매물품의 내용 및 판매진행은 판매자의 전적인 책임으로 이루어지며, 거래 및 결제와 관련된
							모든 책임은 판매자와 구매자에게 있습니다.</text_small>
							</div>
						</div>
					</div>
				</div>
				</div>
		</section>
				<div class = "parent">
				<div class = "online_action">
					<div>
						<div><b>거래진행</b></div>
						<div><img src="image/close.png" class = "close"></div>
					</div>
					<div class="online_chat">
						<textarea readonly="true"></textarea>
					</div>
					<div>
						<div>
						<%if(id.equals(total.getAction_buyid())) { %>
							<div>판매자 정보</div>
							<div>
								<div>ID</div>
								<div><%= sell_id.getId() %></div>
							</div>
							<div>
								<div>판매등급</div>
								<div><%= sell_id.getMy_sellgrd() %></div>
							</div>
							<div>
								<div>이름</div>
								<div><%= sell_id.getSign_name() %></div>	
							</div>						
							<div>
								<div>전화번호</div> 
								<div>
								<%if(sell_id.getSign_tell() != null) { %>
										<%= sell_id.getSign_tell().substring(0,3) %>-<%= sell_id.getSign_tell().substring(3,7)%>-<%= sell_id.getSign_tell().substring(7) %>
								<% } %>
								</div>
							</div>
							<div>
								<div>이메일</div>
								<div><%= sell_id.getSign_email() %></div>
							</div>
							<div>
								<div>주소</div>
								<div>
									<%if(sell_id.getSign_addr() != null)  {%>
										<%= sell_id.getSign_addr().substring(0,sell_id.getSign_addr().indexOf("/")) %><br>
										<%= sell_id.getSign_addr().substring((sell_id.getSign_addr().indexOf("/"))+1,sell_id.getSign_addr().lastIndexOf("/"))%><br>
										<%= sell_id.getSign_addr().substring((sell_id.getSign_addr().lastIndexOf("/"))+1)%>
									<% } %>
								</div>
							</div>
						<% } else {%>
							<div>구매자 정보</div>
							<div>
								<div>ID</div>
								<div><%= buy_id.getId() %></div>
							</div>
							<div>
								<div>구매등급</div>
								<div><%= buy_id.getMy_buygrd() %></div>
							</div>
							<div>
								<div>이름</div>
								<div><%= buy_id.getSign_name() %></div>	
							</div>						
							<div>
								<div>전화번호</div> 
								<div>
									<%if(buy_id.getSign_tell() != null) { %>
										<%= buy_id.getSign_tell().substring(0,3) %>-<%= buy_id.getSign_tell().substring(3,7)%>-<%= buy_id.getSign_tell().substring(7) %>
									<% } %>
								</div>
							</div>
							<div>
								<div>이메일</div>
								<div><%= buy_id.getSign_email() %></div>
							</div>
							<div>
								<div>주소</div>
								<div>
									<%if(buy_id.getSign_addr() != null) { %>
										<%= buy_id.getSign_addr().substring(0,buy_id.getSign_addr().indexOf("/")) %><br>
										<%= buy_id.getSign_addr().substring((buy_id.getSign_addr().indexOf("/"))+1,buy_id.getSign_addr().lastIndexOf("/"))%><br>
										<%= buy_id.getSign_addr().substring((buy_id.getSign_addr().lastIndexOf("/"))+1)%>
									<% } %>
								</div>
							</div>										
						<% } %>
						</div>
						<div><input type = "button" value = "경매확정" onclick="action_ok()" class = "action_clear"></div>
						<div><input type = "button" value = "경매취소" onclick="action_fail()" class = "action_fail"></div>
						<div><input type = "button" value = "뒤로" class="close"></div>
					</div>
					<div>
						<div><textarea name ="action_chat" class ="action_chat"></textarea></div>
						<div><input type ="button" value="전송" onclick = "action_chat_submit()"></div>
					</div>
				</div>
				</div>
		<input type = "hidden" name = "page" value = "<%= nowPage %>">
		<input type = "hidden" name = "action_sellid" value = "<%= actionbean_dto.getAction_sellid() %>" >
		<input type = "hidden" name = "buy_id" value = "<%= id%>" >
		<div class ="slideup">▲</div>
		<div class ="slidedown">▼</div>
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