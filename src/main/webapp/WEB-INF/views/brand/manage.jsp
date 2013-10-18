<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<style>
#editor {
	overflow: scroll; 
	max-height: 300px
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
			<li>컨텐츠 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">출판사</li>
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
			<h3 class="header smaller lighter blue">출판사 리스트</h3>
			<div class="table-header" align="right">
				<button id="create-brand-btn" class="btn btn-success">추가</button>
			</div>
			<table  class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th><i class="icon-time bigger-110 hidden-phone"></i>생성일</th>
					</tr>
				</thead>				
				<tbody>
					<c:forEach items="${brandList }" var="brand">
					<tr>
						<td><a href="${contextPath }/brand/detail.do?pageNum=${pageInfo.pageNum}&brand_id=${brand.BRAND_ID }">${brand.BRAND_ID }</a></td>
						<td><a href="${contextPath }/brand/detail.do?pageNum=${pageInfo.pageNum}&brand_id=${brand.BRAND_ID }">${brand.BRAND_NM }</a></td>
						<td>${brand.REG_DT }</td>
					</tr>
					</c:forEach>
				</tbody>	
			</table>
	</div><!--/.row-fluid-->
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
</div><!--/. main-content-->


<script>
$("#side-contents-brand").attr("class", "active");
$("#side-contents").attr("class", "open active");

	
$(function(){
	
	
	$("#create-brand-btn").click(function(){
			location.href="${contextPath}/brand/createView.do";
	});
	
});
</script>

		