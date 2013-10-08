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
			<li>회원 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<c:if test="${ type == 'userView' }"><li class="active">일반 회원 관리</li></c:if>
			<c:if test="${ type == 'adminView' }"><li class="active">관리자 회원 관리</li></c:if>
		</ul>
		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" autocomplete="off"  value="${search }" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<c:if test="${ type == 'userView' }">
				<h3 class="header smaller lighter blue">일반 회원 정보 리스트</h3></li>
			</c:if>
			<c:if test="${ type == 'adminView' }">
				<h3 class="header smaller lighter blue">관리자 회원 정보 리스트</h3></li>
				<div class="table-header" align="right">
					<a class="btn btn-info btn-success" href="${ contextPath }/user/admin/createView.do">추가</a>
				</div>
			</c:if>
			<!-- /. table-header -->
		<!--/.page-header-->
		
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>IDX</th>
						<th>ID</th>
						<th>이름</th>
						<th>이메일</th>
						<th>상태</th>
						<th>등급</th>
						<c:if test="${ type == 'userView' }">
						<th>SMS 수신</th>
						<th>이메일 수신</th>
						</c:if>
						<th>가입일</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="userlist" items="${positionList}" varStatus="status">
							<tr>
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.IDX}</a></td>
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.MEMBER_ID}</a></td>
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.MEMBER_NM}</a></td>
								<td>${userlist.MEMBER_EMAIL}</td>
								<td>${userlist.MEMBER_STATUS_DESC}</td>
								<td>${userlist.MEMBER_ROLE}</td>
								<c:if test="${ type == 'userView' }">
								<td>${userlist.SMS_RECEIVE_DESC}</td>
								<td>${userlist.EMAIL_RECEIVE_DESC}</td>
								</c:if>
								<td>${userlist.REG_DT}</td>
							</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		<div class="row-fluid">
				<div class="span6">
					<div class="dataTables_info">Total ${pageInfo.totalCount } entries</div>
				</div>
				<div class="span6">
					<div class="dataTables_paginate paging_bootstrap pagination">
						<ul>
							<li class="prev disabled"><a href="#null"><i
									class="icon-double-angle-left"></i></a></li>
							<c:forEach items="${pageList }" var="page">
								<c:choose>
									<c:when test="${pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="manage.do?pageNum=${page.pageNum}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="manage.do?pageNum=${page.pageNum}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="next"><a href="#"><i
									class="icon-double-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div><!--  page-link -->
		
	</div>
	<!--/.page-content-->
</div>

<script>
	$(function(){
		var dspType = "${type}";
		$("#side-user").attr("class", "open active");
		if(dspType == "userView"){
			$("#side-user-user").attr("class", "active");
		}else{
			$("#side-user-admin").attr("class", "active");
		}
	});
</script>
