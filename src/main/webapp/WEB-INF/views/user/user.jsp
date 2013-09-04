<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.btn-group form{
	margin: 0;
	float: left;
}

#userCreatebtn {
	float: right;
}

</style>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i> 
				<a href="#">Home</a> 
				<span class="divider"> 
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">User</li>
		</ul>
		<!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> <input type="text"
					placeholder="Search ..." class="input-small nav-search-input"
					id="nav-search-input" autocomplete="off" /> <i
					class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				User <small> <i class="icon-double-angle-right"></i>
					overview &amp; stats
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="span12">
			<table id="user-table"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PASSWORD</th>
						<th>ROLE</th>
						<th>STATUS</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${ type == 'userView' }">
					<c:forEach var="userlist" items="${positionList}"
						varStatus="status">
						<tr>
							<td>${userlist.MEMBER_ID}</td>
							<td>${userlist.MEMBER_NM}</td>
							<td>${userlist.MEMBER_PW}</td>
							<td>${userlist.MEMBER_ROLE}</td>
							<td>
								<div class="hidden-phone visible-desktop btn-group">

									<form method="get" action="${ contextPath }/user/modify.do">
										<input type="hidden" name="id" value="${userlist.MEMBER_ID}">
										<button class="btn btn-mini btn-info">
											<i class="icon-edit bigger-120"></i>
										</button>
									</form>

									<form method="get" action="${ contextPath }/user/delete.do">
										<input type="hidden" name="id" value="${userlist.MEMBER_ID}">
										<button class="btn btn-mini btn-danger">
											<i class="icon-trash bigger-120"></i>
										</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:when test="${ type == 'search' }">
					<c:forEach var="searchlist" items="${searchList}">
						<tr>
							<td>${ searchlist.MEMBER_ID }</td>
							<td>${ searchlist.MEMBER_NM }</td>
							<td>${ searchlist.MEMBER_PW }</td>
							<td>${ searchlist.MEMBER_ROLE }</td>
							<td>
								<div class="hidden-phone visible-desktop btn-group">

									<form method="get" action="${ contextPath }/user/modify.do">
										<input type="hidden" name="id" value="${searchlist.MEMBER_ID}">
										<button class="btn btn-mini btn-info">
											<i class="icon-edit bigger-120"></i>
										</button>
									</form>

									<form method="get" action="${ contextPath }/user/delete.do">
										<input type="hidden" name="id" value="${searchlist.MEMBER_ID}">
										<button class="btn btn-mini btn-danger">
											<i class="icon-trash bigger-120"></i>
										</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
		</div>
		
		<div class="span12">
			<form method="POST" action="${ contextPath }/user/createView.do">
				<button id="userCreatebtn" class="btn btn-info">
					<i class="icon-ok bigger-110"></i> 회원추가-
				</button>
			</form>
		</div>
		
		<div class="span12 text-center">
			<form method="GET" action="${ contextPath }/user/search.do">
			<select name="" id="selectBox">
				<option value="">아이디</option>
				<option value="">이름</option>
				<option value="">ROLE</option>
			</select>
			<input type="text" id="serchText" name="" value="">
			<button class="btn btn-info">조건 검색</button>
			</form>
		</div>

	</div>
	<!--/.page-content-->

	<div class="ace-settings-container" id="ace-settings-container">
		<div class="btn btn-app btn-mini btn-warning ace-settings-btn"
			id="ace-settings-btn">
			<i class="icon-cog bigger-150"></i>
		</div>

		<div class="ace-settings-box" id="ace-settings-box">
			<div>
				<div class="pull-left">
					<select id="skin-colorpicker" class="hide">
						<option data-class="default" value="#438EB9">#438EB9</option>
						<option data-class="skin-1" value="#222A2D">#222A2D</option>
						<option data-class="skin-2" value="#C6487E">#C6487E</option>
						<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
					</select>
				</div>
				<span>&nbsp; Choose Skin</span>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-header" /> <label class="lbl"
					for="ace-settings-header"> Fixed Header</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-sidebar" /> <label class="lbl"
					for="ace-settings-sidebar"> Fixed Sidebar</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-breadcrumbs" /> <label class="lbl"
					for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
				<label class="lbl" for="ace-settings-rtl"> Right To Left
					(rtl)</label>
			</div>
		</div>
	</div>
	<!--/#ace-settings-container-->
</div>
<!--/.main-content-->

<a href="#" id="btn-scroll-up"
	class="btn-scroll-up btn btn-small btn-inverse"> <i
	class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<button class="btn btn-default" id="test">test</button>

<script>
$(document).ready(function() {
	switch ($("#selectBox option:selected").text()) {
	case ('아이디'):
		$("#serchText").attr({
			name: "id"
		})
		break;
	case ('이름'):
		$("#serchText").attr({
			name: "name"
		})
		break;
	case ('ROLE'):
		$("#serchText").attr({
			name: "role"
		})
		break;
	}
});
$("#selectBox").change(function(){
	switch ($("#selectBox option:selected").text()) {
	case ('아이디'):
		$("#serchText").attr({
			name: "id"
		})
		break;
	case ('이름'):
		$("#serchText").attr({`
			name: "name"
		})
		break;
	case ('ROLE'):
		$("#serchText").attr({
			name: "role"
		})
		break;
	}
});

</script>