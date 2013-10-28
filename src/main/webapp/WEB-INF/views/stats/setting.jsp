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
				1. 토큰 살아있나? 버튼
				<hr />
				<a href="${ contextPath }/stats/getCode.do" target="_blank">2. 코드 가져오기</a>
				<hr />
				3. 토큰 가져오기
				<form action="${ contextPath }/stats/getAccessToken.do">
					<input type="text" name="code" placeholder="코드" />
					<input type="submit" value="토큰 가져오기" />
				</form>
				<input type="text" name="code" value="${ accessToken }" placeholder="가져온 토큰" />
				<hr />
				5. 토큰 죽이기
				<form action="${ contextPath }/stats/revoke.do">
					<input type="text" name="accessToken" placeholder="accessToken" />
					<input type="submit" value="토큰 죽이기" />
				</form>
			</div>
			<!--/.span-->
		</div>
		<!--/.row-fluid-->
	</div>
	<!--/.page-content-->
</div>
<!--/.main-content-->