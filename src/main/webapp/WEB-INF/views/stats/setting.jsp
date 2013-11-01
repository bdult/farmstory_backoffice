<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a
				href="${contextPath }/">Home</a> <span class="divider"> <i
					class="icon-angle-right arrow-icon"></i>
			</span></li>
			<li>통계관리 <span class="divider"> <i
					class="icon-angle-right arrow-icon"></i>
			</span>
			</li>
			<li class="active">설정</li>
		</ul>
		<!--.breadcrumb-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				설정 <small> <i class="icon-double-angle-right"></i> 구글 API
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
				0. 구글 콘솔 정보(필요한가?)
				<hr />
				<a href="${ contextPath }/stats/checkAccessToken.do" target="">1. 엑세스 토큰 확인</a>
				<p style="color: red;">
				<c:if test="${ not empty isValidAccessToken }">
					<c:choose>
						<c:when test="${ isValidAccessToken eq true }">사용할 수 있는 토큰입니다!</c:when>
						<c:otherwise>사용할 수 없는 토큰입니다!</c:otherwise>
					</c:choose>
				</c:if>
				</p>
				<hr />
				<a href="${ contextPath }/stats/getCode.do" target="_blank">2. 코드 가져오기</a>
				<hr />
				3. 토큰 저장하기
				<form action="${ contextPath }/stats/saveAccessToken.do">
					<input type="text" name="code" placeholder="코드" />
					<input type="submit" value="토큰 저장" />
				</form>
				<input type="text" name="code" value="${ accessToken }" placeholder="구글이 준 토큰" />
				<hr />
				<a href="${ contextPath }/stats/revoke.do" target="_blank">엑세스 토큰 파기하기</a>
			</div>
			<!--/.span-->
		</div>
		<!--/.row-fluid-->
	</div>
	<!--/.page-content-->
</div>
<!--/.main-content-->
<script>
$(function(){
	//사이드바 활성화
	$("#side-stats-setting").addClass("active");
	$("#side-stats").addClass("open active");
});
</script>