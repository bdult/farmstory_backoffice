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
			<li class="active">브랜드 관리</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="search.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" autocomplete="off" value="${search }"/>
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->

	<div class="row-fluid">
			<h3 class="header smaller lighter blue">브랜드 리스트</h3>
			<div class="table-header">
				<button id="create-brand-btn" class="btn btn-info">브랜드 추가</button>
			</div>
			<table  class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>생성일</th>
						<th></th>
					</tr>
				</thead>				
				<tbody>
					<c:forEach items="${brandList }" var="brand">
					<tr>
						<td>${brand.BRAND_ID }</td>
						<td>${brand.BRAND_NM }</td>
						<td>${brand.REG_DT }</td>
						<td class="td-actions">
								<div class="hidden-phone visible-desktop action-buttons">
									<a class="blue" href="detail.do?brand_id=${brand.BRAND_ID}">
										<i id="detail_icon" class="icon-zoom-in bigger-130"></i>
									</a>

									<a class="green" href="detail.do?brand_id=${brand.BRAND_ID}">
										<i id="modify_icon" class="icon-pencil bigger-130"></i>
									</a>

									<a class="red" href="delete.do?brand_id=${brand.BRAND_ID}">
										<i id="delete_icon" class="icon-trash bigger-130"></i>
									</a>
								</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>	
			</table>
	</div><!--/.row-fluid-->
</div><!--/. main-content-->

<div id="creat-brand-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="/storyfarm-admin/brand/create.do" method="post">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">브랜드 등록</h3>
		</div>
		<div class="modal-body">
					브랜드 명  <input type="text" name="brand_nm">
		</div>
		<div class="modal-footer">
			<button class="btn btn-series-close" data-dismiss="modal" aria-hidden="true">등록취소</button>
			<button type="submit" class="btn btn-primary btn-series-select">등록하기</button>
		</div>
	</form>
</div>

<script>

$("#side-contents-brand").attr("class", "active");
$("#side-contents").attr("class", "open active");

$(function(){
	$("#create-brand-btn").click(function(){
			console.log("create-brand-btn click");
			$("#creat-brand-modal").modal('toggle');
	});
	
});
</script>

		