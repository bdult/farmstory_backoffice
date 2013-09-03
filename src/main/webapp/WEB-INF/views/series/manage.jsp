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
			<li >컨텐츠 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">시리즈 관리</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--/ #nav-search-->
	</div><!--/ .breadcrumb-->

	<div class="span7">
		<h3 class="header smaller lighter blue">시리즈 리스트</h3>
		<div class="table-header">
			<button id="create-series-btn" class="btn btn-info">시리즈 추가</button>
		</div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>생성일</th>
					<th></th>
				</tr>
			</thead>				
			<tbody>
				<c:forEach items="${seriesList }" var="series">
				<tr>
					<td>${series.CONTENTS_SERIES_ID }</td>
					<td>${series.CONTENTS_SERIES_NM }</td>
					<td>${series.REG_DT }</td>
					<td class="td-actions">
							<div class="hidden-phone visible-desktop action-buttons">
								<a class="blue" href="detail.do?series_id=${series.CONTENTS_SERIES_ID}">
									<i id="detail_icon" class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="detail.do?series_id=${series.CONTENTS_SERIES_ID}">
									<i id="modify_icon" class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="delete.do?series_id=${series.CONTENTS_SERIES_ID}">
									<i id="delete_icon" class="icon-trash bigger-130"></i>
								</a>
							</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div><!--/.span-->
</div><!--/.main-content-->

<div id="creat-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="create.do" method="post">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">시리즈 등록</h3>
		</div>
		<div class="modal-body">
					시리즈 명  <input type="text" name="series_nm">
		</div>
		<div class="modal-footer">
			<button class="btn btn-series-close" data-dismiss="modal" aria-hidden="true">등록취소</button>
			<button type="submit" class="btn btn-primary btn-series-select">등록하기</button>
		</div>
	</form>
</div>


<script>
$(function(){
	$("#create-series-btn").click(function(){
			$("#creat-series-modal").modal('toggle');
	});
	
});
</script>

		