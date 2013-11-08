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
			<li>문의하기 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">문의하기 상세</li>
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
				<h3 class="header smaller lighter blue">고객문의 내용</h3>
				<!-- /. table-header -->
				
				<form id="modify-form" action="questionModify" method="post">
					<div class="row-fluid">
						<div class="span12 form-horizontal">
							<!--PAGE CONTENT BEGINS-->
									<input type="hidden" name="board_contents_id" value="${ contentsList.CONTENTS_ID }">
									<input type="hidden" name="member_id" value="${ login_session.MEMBER_ID }">
									<div class="control-group">
										<label class="control-label">문의 제목</label>
										<div class="controls">
											<input type="text" name="title" value="${ contentsInfo.TITLE }">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">작성자</label>
										<div class="controls">
											<input type="text" name="member_nm" value="${ contentsInfo.MEMBER_NM }">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">회원 아이디</label>
										<div class="controls">
											<input type="text" value="${ contentsInfo.MEMBER_ID }">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">이메일</label>
										<div class="controls">
											<input type="text" name="member_email" value="${contentsInfo.MEMBER_EMAIL }">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">전화번호</label>
										<div class="controls">
											<input type="text" name="member_email" value="${contentsInfo.MEMBER_CEL }">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">내용</label>
										<div class="controls">
											<textarea name="" rows="5" cols="50" style="width:80%;" readonly="readonly">${ contentsList.CONTENTS }</textarea>
										</div>
									</div>
						</div>
					</div>
				
					<div class="row-fluid">
						<h3 class="header smaller lighter blue">고객문의 내용 답변</h3>
						<div class="row-fluid">
							<div class="span12">
									<div class="control-group">
										<label class="control-label">답변</label>
										<div class="controls">
											<textarea rows="5" name="sub_contents" cols="50" style="width:80%;" readonly="readonly">${ commentsList.COMMENT }</textarea>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">답변일</label>
										<div class="controls">
											<input type="text" readonly="readonly" value="${ commentsList.REG_DT }">
										</div>
									</div>
									<div class="form-actions">
										<a class="btn btn-default" href="${ contextPath }/cscenter/questionManage.do">
											<i class="icon-wrench bigger-110"></i>
											목록
										</a>
									</div>
							</div>
						</div>
					</div>
				</form>
		</div>
	</div>
</div>

<script type="text/javascript">

	//side active
	$("#side-cscenter").addClass("open active");
		$("#side-cscenter-question").addClass("active");

	//page init
	$("input:text").attr({
		readonly : 'readonly'
	});
	
	$("#modify-btn").click(function(){
		$("#modify-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/questionAddComments.do'
		}).submit();
	});
</script>