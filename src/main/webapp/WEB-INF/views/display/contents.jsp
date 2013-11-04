<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


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
			<li>
				전시관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">컨텐츠 노출 관리</li>
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
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">컨텐츠 노출 관리</h3>
			<div class="table-header">
				노출 카테고리 선택 
				<select id="categoryBox" name="category_id" data-parameter="${ parameter.category_id }">
					<c:forEach items="${ categories }" var="obj">
						<option value="${ obj.CATE_ID }">${ obj.name }</option>
					</c:forEach>
				</select>
			</div>
			<table  class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th></th>
						<th>컨텐츠ID</th>
						<th>컨텐츠명</th>
						<th>시리즈</th>
						<th>출판사</th>
						<th>노출순서</th>
					</tr>
				</thead>			
				<tbody>
					<c:forEach items="${contents }" var="obj">
					<tr>
						<td></td>
						<td>${ obj.CONTENTS_ID }</td>
						<td>${ obj.CONTENTS_NM }</td>
						<td>${ obj.SERIES_NM }</td>
						<td>${ obj.BRAND_NM }</td>
						<td><input type="text" value="${ obj.ORDERING_NO }"/></td>
					</tr>
					</c:forEach>
				</tbody>	
			</table>
			
			<div class="text-right">
				<button id="orderUpdateBtn" class="btn btn-sm btn-yellow">순서적용</button>
			</div>
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<script>
$(function(){
	
	//사이드바 활성화
	$("#side-display-contents").addClass("active");
	$("#side-display").addClass("open active");
	
	//노출 카테고리 이벤트
	var $categoryBox = $("#categoryBox");
	$categoryBox
		.find("option").each(function(){
			var $this = $(this);
			var cateId = $categoryBox.data("parameter");
			if( $this.val() == cateId ) {
				$this.prop("selected", true );
			}
		})
		.end()
		.change(function(){
			window.location.href = "${ contextPath }/display/contents/manage.do?category_id=" + $categoryBox.val();
		});
	
	//순서적용 버튼 이벤트
	$("#orderUpdateBtn").click(function(){
		alert("개발예정");
	});
});
</script>

		