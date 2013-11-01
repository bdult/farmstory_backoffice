<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<a href="#">이벤트 관리</a>
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">
				<c:if test="true">
					이벤트 상세
				</c:if>
				<c:if test="true">
					이벤트 등록
				</c:if>
			</li>
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
			<c:if test="true">
				<h3 class="header smaller lighter blue">이벤트 상세</h3>
			</c:if>
			<c:if test="true">
				<h3 class="header smaller lighter blue">이벤트 등록</h3>
			</c:if>
			<!-- /. table-header -->
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
			
						<form id="create-form" method="get" class="form-horizontal" >
							<div class="control-group">
								<label class="control-label">제목</label>
								<div class="controls">
									<input type="text" name="" value="" style="width:80%">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">이벤트기간</label>
								<div class="controls">
    								<div class="span6">
										<div class="input-append">
											<input class="date-picker-1 input-medium" id="date-picker-first" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
										~
										<div class="input-append">
											<input class="date-picker-2 input-medium" id="date-picker-last" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-2">배너</label>
								<div class="controls">
									<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
									<input  type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">내용</label>
								<div class="controls">
									<textarea rows="5" cols="50" style="width:80%;"></textarea>
								</div>
							</div>
							
							<c:if test="true">
								<div class="control-group">
									<label class="control-label">당첨자발표</label>
									<div class="controls">
										<textarea rows="5" cols="50" style="width:80%;"></textarea>
									</div>
								</div>
							</c:if>
							
							<div class="form-actions">
								<c:if test="true">
									<button class="btn btn-danger" type="submit" id="delete-btn">
										<i class="icon-trash bigger-110"></i>
										삭제
									</button>
								</c:if>
								<button class="btn btn-primary" type="submit" id="modify-btn">
									<i class="icon-wrench bigger-110"></i>
									확인
								</button>
								<a class="btn btn-inverse" id="cancel-btn">
									<i class="icon-undo bigger-110"></i>
									취소
								</a>
							</div>
						</form>
			</div>
		</div>
						
		</div>
	</div>
	
</div>

<script>
jQuery(function($){
	$('.date-picker-1').datepicker();
	$('.date-picker-2').datepicker();
});
</script>