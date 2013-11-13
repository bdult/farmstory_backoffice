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
			<li>Statistics <span class="divider"> <i
					class="icon-angle-right arrow-icon"></i>
			</span>
			</li>
			<li class="active">Setting</li>
		</ul>
		<!--.breadcrumb-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Setting <small> <i class="icon-double-angle-right"></i> Google API
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
				<a href="${ contextPath }/stats/checkAccessToken.do" target="">1. Access Token</a>
				<p style="color: red;">
				<c:if test="${ not empty isValidAccessToken }">
					<c:choose>
						<c:when test="${ isValidAccessToken eq true }">A token can be used!</c:when>
						<c:otherwise>A token can not be used!</c:otherwise>
					</c:choose>
				</c:if>
				</p>
				<hr />
				<a href="${ contextPath }/stats/getCode.do" target="_blank">2. Get the code</a>
				<hr />
				3. Token to store
				<form action="${ contextPath }/stats/saveAccessToken.do">
					<input type="text" name="code" placeholder="code" />
					<input type="submit" value="Save" />
				</form>
				Response code : ${ accessToken }
				<br />
				( 200: Ok, 400,401: Faile )
				<hr />
				<a href="${ contextPath }/stats/revoke.do" target="_blank">Access token to destroy</a>
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