<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>

<script>

function OpenWinCount(URL,width,height) {

	var str,width,height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,";
	str=str+"width="+width;
	str=str+",height="+height+"',top=100,left=100";

	window.open(URL,'remote',str);
}

$(function(){
	// 1depth 메뉴들
	var parent = $(".parent");
	
	//현재 주소
	// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
	var curUrl = document.location.pathname;
	curUrl = curUrl.substring(curUrl.indexOf("admin")+11,curUrl.length);
	if (curUrl.indexOf("/") > 0) {
		curUrl = curUrl.substring(curUrl,curUrl.indexOf("/"));
	}
	parent.each(function(){
		$(this).find("span").removeClass("bg");

		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
		href = href.substring(href.indexOf("admin")+6,href.length);
		href = href.substring(href,href.indexOf("/"));
		
		// 현재 주소에서 href가 포함 되어 있으면 그 메뉴에 배경색 지정
		if(curUrl == href){
			$(this).find("span").addClass("bg");
		}
	});
	
	// 방문자 통계 클릭시 메뉴 유지
	parent.click(function(){
		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		if(href.indexOf("OpenWinCount") >= 0){
			parent.find("span").removeClass("bg");
			$(this).find("span").addClass("bg");
		}
	});
	
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1>SEND MUSIC</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
				<li class="frist"><a href="<%=request.getContextPath()%>/index.do" onclick="">Site</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/logout.do">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="<%=request.getContextPath()%>/admin/user/index.do" class="parent"><span>회원관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/ticket/index.do" class="parent"><span>이용권관리</span></a></li>
				<li>
					<a href="<%=request.getContextPath()%>/admin/song/index.do" class="parent"><span>콘텐츠관리</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/album/index.do"><span>앨범등록</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/artist/index.do"><span>아티스트등록</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/song/index.do"><span>곡등록</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/mv/index.do"><span>MV등록</span></a></li>
					</ul>
				</li>
				<li>
  					<a href="<%=request.getContextPath()%>/admin/recommend/index.do" class="parent"><span>추천음악관리</span></a>
  					<div class="standard_left">
  					<ul>
  						<li><a href="<%=request.getContextPath()%>/admin/recommend/index.do"><span>추천음악선택</span></a></li>
  						<li><a href="<%=request.getContextPath()%>/admin/recommend/write.do"><span>추천음악등록</span></a></li>
  						<li><a href="<%=request.getContextPath()%>/recommend/recommend_list.do"><span>추천음악페이지</span></a></li>
  					</ul>
  					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/notice/index.do" class="parent"><span>게시판관리</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/notice/index.do"><span>공지사항</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/qna/index.do"><span>Q&A</span></a></li>
					</ul>
					</div>
				</li>
				<li>
  					<a href="<%=request.getContextPath()%>/admin/statistic/chart1.do" class="parent"><span>통계관리</span></a>
  					<div class="standard_left">
  					<ul>
  						<li><a href="<%=request.getContextPath()%>/admin/statistic/chart1.do"><span>일간차트</span></a></li>
  						<li><a href="<%=request.getContextPath()%>/admin/statistic/chart2.do"><span>주간차트</span></a></li>
  						<li><a href="<%=request.getContextPath()%>/admin/statistic/chart3.do"><span>누적합계차트</span></a></li>
  					</ul>
  					</div>
				</li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->