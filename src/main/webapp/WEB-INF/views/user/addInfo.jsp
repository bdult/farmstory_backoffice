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
			<li>
				<c:if test="${detail.type == 'userView' }">
					<a href="#">일반 회원 정보 상세</a>
				</c:if>
				<c:if test="${detail.type == 'adminView' }">
					<a href="#">관리자 회원 정보 상세</a>
				</c:if>
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">
				<c:if test="${detail.type == 'userView' }">
					일반 회원 정보 수정
				</c:if>
				<c:if test="${detail.type == 'adminView' }">
					관리자 회원 정보 수정
				</c:if>
			</li>
		</ul>
		<!--.breadcrumb-->

	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				회원 정보
				<small>
					<i class="icon-double-angle-right"></i>
					회원 정보수정
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
							<form id="create-form" method="get" class="form-horizontal" >

								<div class="control-group">
									<label class="control-label">아이디</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="member_id" value="${detail.MEMBER_ID}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이름</label>
									<div class="controls">
										<input type="text" name="member_name" value="${detail.MEMBER_NM}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">생년월일</label>
									<div class="controls">
										<input type="hidden" value="${detail.MEMBER_YEAR}" />
										<input type="hidden" value="${detail.MEMBER_MONTHL}" />
										<input type="hidden" value="${detail.MEMBER_DAY}" />
										<input type="text" value="${detail.MEMBER_YEAR}년 ${detail.MEMBER_MONTH}월 ${detail.MEMBER_DAY}일" readonly="readonly"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">성별</label>
									<div class="controls">
										<input type="text" value="${detail.MEMBER_GENDER}" readonly="readonly"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">휴대폰</label>
									<div class="controls">
										<input type="text" name="member_cel" value="${detail.MEMBER_CEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이메일</label>
									<div class="controls">
										<input type="text" name="member_email" value="${detail.MEMBER_EMAIL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">주소</label>
									<div class="controls">
										<input type="text" value="" readonly="readonly"/>&nbsp;&nbsp;
										<a class="btn btn-primary">우편번호 검색</a>
									</div>
									<div class="controls">
										<input type="text" name="member_addr_1" value="${detail.MEMBER_ADDR_1}" />&nbsp;&nbsp;
										<input type="text" name="member_addr_2" value="${detail.MEMBER_ADDR_2}" />
									</div>
								</div>
								
								<div class="form-actions">
									<button class="btn btn-primary" type="submit" id="modify-btn">
										<i class="icon-wrench bigger-110"></i>
										수정
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
	<!--/.page-content-->
<!--/.main-content-->

<script type="text/javascript">

$(function(){
	var memberType = "${detail.userDetail.MEMBER_TYPE}";
	$("#side-user").attr("class", "open active");
	if(memberType == 1){
		$("input:text").attr({
		});
		$("#side-user-user").attr("class", "active");
	}else{
		$("#side-user-admin").attr("class", "active");
	}

	$("#cancel-btn").click(function(){
		window.location.href="${ contextPath }/user/detail.do?member_id=${detail.MEMBER_ID}";
	});

	$("#modify-btn").click(function(){
		if(confirm("저장 하시겠습니까?")){
			$("#create-form").attr({
				method: 'post',
				action: '${ contextPath }/user/userModify.do'
			}).submit();
		}else{
			return false;
		}
	});

});

</script>
