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
			<li>컨텐츠 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">컨텐츠 관리</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="search.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" id="search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">컨텐츠 리스트</h3>
			<div class="table-header">
				<button id="create-contents-btn" class="btn btn-info">컨텐츠 추가</button>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>컨텐츠 ID</th>
						<th>컨텐츠명</th>
						<th>시리즈</th>
						<th>브랜드</th>
						<th>저장위치</th>
						<th>섬네일 위치</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="conlist" items="${list}" varStatus="status">
					<tr>
						<td class="center">
							<label>
								<input type="checkbox" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="${contextPath }/contents/detail.do?contents_id=${conlist.CONTENTS_ID}">${conlist.CONTENTS_ID}</a>
						</td>
						<td>${conlist.CONTENTS_NM}</td>
						<td>${conlist.SERIES_NM}</td>											
						<td>${conlist.BRAND_NM}</td>
						<td>${conlist.SRC_PATH}</td>
						<td>${conlist.IMG_PATH}</td>
						<td class="td-actions">
							<div class="hidden-phone visible-desktop action-buttons">
								<a class="blue" href="detail.do?contents_id=${conlist.CONTENTS_ID}">
									<i id="detail_icon" class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="detail.do?contents_id=${conlist.CONTENTS_ID}">
									<i id="modify_icon" class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="delete.do?contents_id=${conlist.CONTENTS_ID}">
									<i id="delete_icon" class="icon-trash bigger-130"></i>
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
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
	</div><!--/ .page-content-->
</div><!--/ .main-content-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
		
		$("#modify_icon").click(function(){
			
		});
		$("#detail_icon").click(function(){
			
		});
		</script>
		
		<!-- add jquery -->
		<script type="text/javascript">				
			$("#create-contents-btn").click(function(){
				location.href="${contextPath}/contents/createView.do";
			});
		</script>