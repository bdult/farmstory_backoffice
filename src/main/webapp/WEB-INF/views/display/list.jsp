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
			<li class="active">Sub</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Category
				<small>
					<i class="icon-double-angle-right"></i>
					overview &amp; stats
				</small>
			</h1>
		</div><!--/.page-header-->

		<div class="row-fluid">
			<div class="span5">
				
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
					<strong>카테고리</strong>
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>생성일</th>
						</tr>
					</thead>				
					<tbody>
						<c:forEach items="${ cateList }" var="cate">
							<tr>
								<td>${ cate.CATE_ID }</td>
								<td class="pointer">${ cate.CATE_NM }</td>
								<td>${cate.REG_DT }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="create-category" class="btn btn-info pull-right">카테고리 생성</button>
			</div><!--/.span-->
			<div class="span5">
			
				<div class="alert alert-info">
					<strong>브랜드</strong>
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>생성일</th>
						</tr>
					</thead>				
					<tbody>
						<c:forEach items="${brandList }" var="brand">
						<tr>
							<td>${brand.BRAND_ID }</td>
							<td>${brand.BRAND_NM }</td>
							<td>${brand.REG_DT }</td>
						</tr>
						</c:forEach>
					</tbody>	
				</table>
				<button id="create-brand-btn" class="btn btn-info pull-right">브랜드 생성</button>
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<div id="creat-brand-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 class="text-center">브랜드 등록</h3>
	</div>
	<div class="modal-body">
		<form action="/brand/create.do">
				브랜드 명  <input type="text" name="brand_nm">
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-series-close" data-dismiss="modal" aria-hidden="true">등록취소</button>
		<button class="btn btn-primary btn-series-select">등록하기</button>
	</div>
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<script>
$(function(){
	$("#create-brand-btn").click(function(){
			console.log("create-brand-btn click");
			$("#creat-brand-modal").modal('toggle');
	});
	
	$("#create-category").click(function(){
			console.log("creat-category click");
	});
	
});
</script>

		