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
			<li class="active">회원 관리</li>
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
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">유저정보 리스트</h3>
			<div class="table-header">
				<a class="btn btn-info" href="${ contextPath }/user/createView.do">회원추가</a>
				<a class="btn btn-info" href="${ contextPath }/user/">자녀추가</a>
			</div><!-- /. table-header -->
		<!--/.page-header-->
		
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>유저 ID</th>
						<th>유저 이름</th>
						<th>유저 비밀번호</th>
						<th>유저 권한</th>
						<th>자녀 수</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${ type == 'userView' }">
						<c:forEach var="userlist" items="${positionList}"
							varStatus="status">
							<tr>
								<td class="center">
									<label>
										<input type="checkbox" />
										<span class="lbl"></span>
									</label>
								</td>
							
								<td>${userlist.MEMBER_ID}</td>
								<td>${userlist.MEMBER_NM}</td>
								<td>${userlist.MEMBER_PW}</td>
								<td>${userlist.MEMBER_ROLE}</td>
								<td>?</td>
								<td class="td-actions">
									<div class="hidden-phone visible-desktop action-buttons">
	
										<a class="green" href="${ contextPath }/user/modify.do?id=${userlist.MEMBER_ID}">
											<i id="modify_icon" class="icon-pencil bigger-130"></i>
										</a>
										<a class="red" href="${ contextPath }/user/delete.do?id=${userlist.MEMBER_ID}">
											<i id="delete_icon" class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${ type == 'search' }">
						<c:forEach var="searchlist" items="${searchList}">
							<tr>
								<td class="center">
									<label>
										<input type="checkbox" />
										<span class="lbl"></span>
									</label>
								</td>
							
								<td>${searchlist.MEMBER_ID}</td>
								<td>${searchlist.MEMBER_NM}</td>
								<td>${searchlist.MEMBER_PW}</td>
								<td>${searchlist.MEMBER_ROLE}</td>
								<td class="td-actions">
									<div class="hidden-phone visible-desktop action-buttons">
	
										<a class="green" href="${ contextPath }/user/modify.do?id=${searchlist.MEMBER_ID}">
											<i id="modify_icon" class="icon-pencil bigger-130"></i>
										</a>
										<a class="red" href="${ contextPath }/user/delete.do?id=${searchlist.MEMBER_ID}">
											<i id="delete_icon" class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
		</div>
		
		
		<div class="text-center">
			<form method="GET" action="${ contextPath }/user/search.do">
			<select name="" id="selectBox">
				<option value="">아이디</option>
				<option value="">이름</option>
				<option value="">ROLE</option>
			</select>
			<input type="text" id="serchText" name="id" value="">
			<button class="btn btn-info">조건 검색</button>
			</form>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<div class="dataTables_info" id="sample-table-2_info">Showing 1
					to 10 of 23 entries</div>
			</div>
			<div class="span6">
				<div class="dataTables_paginate paging_bootstrap pagination">
					<ul>
						<li class="prev disabled"><a href="#"><i
								class="icon-double-angle-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#"><i
								class="icon-double-angle-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>	
	</div>
	<!--/.page-content-->

<script>
$("#selectBox").change(function(){
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

</script>
