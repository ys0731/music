<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chart_chart_daily</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

    <script>
	    //팝업
	    function popup(no) {
	        window.open("/music/chart/lyrics.do?no="+no, "popup", "width=400, height=600");
	    }

        $(document).ready(function(){
            // change color when clicked
            $(".chart_btn li").click(function(){
                $(".chart_btn li").removeClass("active");
                $(this).addClass("active");
            }); 
			
            //가사
            $(".lyrics").click(function() {
            	var no = $(this).data('no');
            	popup(no);
            });
            
          //좋아요
            $(".like").click(function() {
            	var sno = $(this).data('no');
            	$.ajax({
            		url: '/music/like/like.do?sno='+sno,
            		method: 'post',
            		success: function(data) {
            			console.log("success");
            		}
            		
            	});
            });//함수 끝
            
            // sysdate
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = yyyy + '.' + mm + '.' + dd;

            document.getElementById('sysdate').innerHTML = today;

            // check all
            $("#check_all").change(function(){
                if ($("#check_all").is(':checked')) {
                    $("input[type='checkbox'][name='check_list']").prop("checked", true);                  
                } 
                else {
                    $("input[type='checkbox'][name='check_list']").prop("checked", false);
                }
            });
            
            // preventDefault
            $(".chart_box ul li a, .lyrics_popup, .like_btn, .play_music, .add_list").click(function(e){
                e.preventDefault();
                // e.stopPropagation();
            })

            //like img toggle
            $(".like_btn").click(function(){
                $(this).toggleClass("on");
            });
        });
    </script>
    
    <%@ include file="/WEB-INF/view/player/playnlog.jsp" %>
    
    <style>
        /* chart top btn */
        .chart_btn li {float: left; width: 100px; height: 30px; border-radius: 5px; background-color: #bbb; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .chart_btn li:hover {background-color: #ccc;}
        .chart_btn li.active {background-color: #11264f;}
        .chart_btn li a {display: block; width: 100%;}

        /* sysdate */
        .chart_btn {position: relative;}
        #sysdate {position: absolute; font-size: 20px; top: 50%; left: 50%; transform: translate(-50%, -50%);}

        /* chart medium btn */
        .chart_box > ul:first-child {margin-top: 40px;}
        .chart_box > ul:first-child li {float: left; margin-right: 20px; height: 26px; line-height: 26px; background-color: #11347a; color: #fff; font-size: 13px; border-radius: 13px; overflow: hidden;}
        .chart_box > ul:first-child li:hover {background-color: #16439c;}
        .chart_box > ul:first-child li a {display: block; padding: 0 15px;}
        .chart_box > ul:first-child li:first-child {background-color: transparent; margin-top: 5px;}
        
        /* chart row */
        .chart_box table {margin-bottom: 20px;}

        .chart_box table tr td:nth-child(1) {width: 26px;}
        .chart_box table tr td:nth-child(2) {width: 50px;}
        .chart_box table tr td:nth-child(3) {width: 485px;}
        .chart_box table tr td:nth-child(4) {width: 130px;}
        .chart_box table tr td:nth-child(5) {width: 190px;}
        .chart_box table tr td:nth-child(6) {width: 45px; text-align: center;}
        .chart_box table tr td:nth-child(7) {width: 45px; text-align: center;}
        .chart_box table tr td:nth-child(8) {width: 45px; text-align: center;}

        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}

        /* chart txt */
        .album_mini {float: left; width: 45px; height: 45px;}
        .list_title {float: left; margin-top: 15px; margin-left: 10px; width: 385px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_artist {width: 125px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_album {width: 185px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}

        /* like btn */
        .like_btn {display: block; margin-left: 10.5px; width: 24px; height: 24px; background-image: url("<%=path %>/img/like_empty.png"); background-size: cover; background-position: center; background-repeat: no-repeat;}
        .like_btn.on {background-image: url("<%=path %>/img/like_full.png");}

        /* button icons */
        .button_icons {display: block; width: 24px; height: 24px; background-image: url("<%=path %>/img/button_icons.png"); border-radius: 50%; overflow: hidden;}
        
        /* lyrics btn */
        .lyrics_popup {float: left; display: block; margin-top: 11px; margin-left: 10px; width: 22px; height: 22px; background-position: -236px -215px;}
        
        /* .play_music btn */
        .play_music {background-position: 0px -167px; margin-left: 10.5px; }
        .play_music:hover {background-position: 221px -167px;}
        .play_music:active {background-position: 249px -167px;}
        .play_music.on {background-position: 249px -167px;}
        
        /* add_list btn */
        .add_list {background-position: -165px 0px; margin-left: 10.5px; }
        .add_list:hover {background-position: -165px 192px;}
        .add_list:active {background-position: -165px 220px;}
        .add_list.on {background-position: -165px 220px;}
    </style>

</head>

<body>
     <%@ include file="/WEB-INF/view/include/top.jsp" %>
	    <div id="container">
	        <div class="center">
	            <ul class="chart_btn clear">
	                <li><a href="/music/chart/chart_24hit.do">실시간</a></li>
	                <!-- <li class="active"><a href="/music/chart/chart_daily.do">일간</a></li> -->
	                <span id="sysdate"></span>
	            </ul>
	            <form class="chart_box" action="" method="post">
	                <ul class="clear">
	                    <li><input id="check_all" type="checkbox"></li>
	                    <li><a href="#" onclick="javascript:checkplayer();">듣기</a></li>
	                </ul>
	                <table>
	                    <tr>
	                        <td></td>
	                        <td>순위</td>
	                        <td>곡</td>
	                        <td>아티스트</td>
	                        <td>앨범</td>
	                        <td>좋아요</td>
	                        <td>듣기</td>
	                        <td>추가</td>
	                    </tr>
	                    <c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="8" style="text-align: center;">차트 정보가 없습니다.</td>
                            </tr>
                        </c:if>
	                    <c:forEach var="vo" items="${list }" varStatus="status">
	                    <tr>
	                		<td><input name="check_list" type="checkbox" data-Num="${vo.no }"></td>
	                		<td>
	               				<p style="margin-top: 11px;">${status.count}</p>
	                				<c:if test="${empty vo.rank_ch}">
	                					<p class="rank" style="color: red; font-size: 12px;">new</p>
	                				</c:if>
	                				<c:if test="${vo.rank_ch > 0}">
	                					<p class="rank" style="color: red; font-size: 12px;">↑${vo.rank_ch }</p>
	                				</c:if>
	                				<c:if test="${vo.rank_ch == 0}">
	                					<p class="rank" style="color: blue; font-size: 12px;">ㅡ</p>
	                				</c:if>
	                				<c:if test="${vo.rank_ch < 0}">
	                					<p class="rank" style="color: blue; font-size: 12px;">↓${vo.rank_ch * (-1) }</p>
	                				</c:if>
	                			</p>
	               			</td>
	                		<td class="clear">
		                      <a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.al_no }"> <img class="album_mini" src="<%=path %>/upload/${vo.rel}" alt="album_img"></a>
		                       <a class="lyrics_popup button_icons lyrics" href="#" data-no="${vo.no }"></a>
		                       <p class="list_title">${vo.title }</p>
	                   		</td>
	                   		<td>
	                      		<p class="list_artist" id="artist"><a class="artist" href="<%=request.getContextPath()%>/detail/artistDetail.do?artist_no=${vo.ar_no }">${vo.artist }</a></p>
	                   		</td>
	                  		<td>
	                     		<p class="list_album" id="album"><a class="album" href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.al_no }">${vo.album }</a></p>
	                   		</td>
		                    <td>
		                        <a class="like_btn like <c:if test="${vo.mlike_cnt==1 }">on</c:if>" href="#" data-no="${vo.no }"></a>
		                    </td>
		                    <td>
		                         <a class="play_music button_icons play" href="#" onclick="javascript:player(no=${vo.no });" data-no="${vo.no }"></a>
		                    </td>
	                  		<td>
	                       		<a class="add_list button_icons" href="#" onclick="javascript:plusplayer(no=${vo.no });"></a>
	                  		</td>
	                	</tr>
	                    </c:forEach>                  
	                </table>
	            </form>
	        </div>
	    </div>
     <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>

</html>