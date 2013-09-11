<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

</style>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i> 
				<a href="#">Home</a> 
				<span class="divider"> <i class="icon-angle-right arrow-icon"></i></span>
			</li>

			<li>
				<a href="#">회원 관리</a> 
				<span class="divider"> <i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">
				<a href="#">일반 회원 정보 상세</a>
				<span class="divider"> <i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">
				자녀 회원 정보 상세
			</li>
		</ul>
		<!--.breadcrumb-->

	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				자녀 정보
				<small>
					<i class="icon-double-angle-right"></i>
					자녀 정보에 대한 상세한 정보를 입력한다
				</small>
			</h1>
		</div>
		<!--/.page-header-->
		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
							<form id="create-form" method="get" class="form-horizontal" >
								<div class="control-group">
									<label class="control-label">부모 회원 ID</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="parent_member_id" value="${ childDetail.PARENT_MEMBER_ID }">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">자녀 이름</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="child_nm" value="${ childDetail.CHILD_NM }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">자녀 사진</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="photo" value="${ childDetail.PHOTO }" />
										<input type="button" id="photo-mod-btn" class="btn btn-primary" value="자녀 사진변경" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">자녀 성별</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="gender" value="${ childDetail.GENDER }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">자녀 생년월일</label>
									<div class="controls">
										<input class="span1" type="text" readonly="readonly" name="birth_year" value="${ childDetail.BIRTH_YEAR }" />년&nbsp;
										<input class="span1" type="text" readonly="readonly" name="birth_month" value="${ childDetail.BIRTH_MONTH }" />월&nbsp;
										<input class="span1" type="text" readonly="readonly" name="birth_day" value="${ childDetail.BIRTH_DAY }" />일
									</div>
								</div>
								<div class="form-actions">
									<a class="btn btn-inverse" id="cancel-btn">
										<i class="icon-list bigger-110"></i>
										목록으로
									</a>
								</div>
							</form>
					</div>
			</div>
	</div>
	<!--/.page-content-->
<!--/.main-content-->

<script type="text/javascript">

$("#side-user").attr("class", "open active");
$("#side-user-user").attr("class", "active");

$("#cancel-btn").click(function(){
	var parentId = "${ childDetail.PARENT_MEMBER_ID }";
	window.location.href="detail.do?member_id="+ parentId;
});

</script>
