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
			<div class="span6">
				
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
					<strong>카테고리관리</strong>
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th></th>
						</tr>
					</thead>				
					<tbody>
						<c:forEach items="${ cateList }" var="cateObj">
							<tr>
								<td>${ cateObj.CATE_ID }</td>
								<td class="pointer">${ cateObj.CATE_NM }</td>
								<td>x e</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button class="btn btn-info pull-right" id="createCateBtn">생성</button>
			</div><!--/.span-->
			<div class="span6">
			
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
					<strong>브랜드 관리</strong>
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>x e</th>
						</tr>
					</thead>				
					<tbody>
						<c:forEach items="${ brandList }" var="brandObj">
							<tr>
								<td>${ brandObj.BRAND_ID }</td>
								<td class="pointer">${ brandObj.BRAND_NM }</td>
								<td>
									<div class="hidden-phone visible-desktop btn-group">
										<button class="btn btn-mini btn-success">
											<i class="icon-ok bigger-120"></i>
										</button>
	
										<button class="btn btn-mini btn-info">
											<i class="icon-edit bigger-120"></i>
										</button>
	
										<button class="btn btn-mini btn-danger">
											<i class="icon-trash bigger-120"></i>
										</button>
	
										<button class="btn btn-mini btn-warning">
											<i class="icon-flag bigger-120"></i>
										</button>
									</div>
	
									<div class="hidden-desktop visible-phone">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
												<i class="icon-cog icon-only bigger-110"></i>
											</button>
	
											<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>
	
												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>
	
												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>	
				</table>
				<button class="btn btn-info pull-right" id="createBrandBtn">생성</button>
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<script>
$(function(){
	$("#createCateBtn").on(ace.click_event, function() {
		bootbox.prompt("생성할 카테고리 이름을 입력해 주세요.", function(result) {
			if (result === null) {
				//Example.show("Prompt dismissed");
			} else {
				alert("카테고리 생성 ajax 요청");
			}
		});
	});
	
	$("#createBrandBtn").on(ace.click_event, function() {
		bootbox.prompt("생성할 브랜드 이름을 입력해 주세요.", function(result) {
			if (result === null) {
				//Example.show("Prompt dismissed");
			} else {
				alert("브랜드 생성 ajax 요청");
			}
		});
	});

});
</script>

		