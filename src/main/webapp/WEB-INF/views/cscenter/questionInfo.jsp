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
			<li>CS
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Custom Voice</li>
		</ul>
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<form id="modify-form" >
			<div class="row-fluid">
				<h3 class="header smaller lighter blue">Custom Voice Detail</h3>
				<!-- /. table-header -->
				<input type="hidden" name="board_contents_id" value="${ contentsInfo.CONTENTS_ID }">
				<input type="hidden" name="member_id" value="${ login_session.MEMBER_ID }">

				<div class="row-fluid">
					<div class="span12 form-horizontal">
						<!--PAGE CONTENT BEGINS-->
						<div class="control-group">
							<label class="control-label">Title</label>
							<div class="controls">
								<input type="text" name="title" value="${ contentsInfo.TITLE }">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Writer</label>
							<div class="controls">
								<input type="text" name="member_nm" value="${ contentsInfo.MEMBER_NM }">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Member ID</label>
							<div class="controls">
								<input type="text" value="${ contentsInfo.MEMBER_ID }">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">E-mail</label>
							<div class="controls">
								<input type="text" name="member_email" value="${contentsInfo.MEMBER_EMAIL }">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Phone</label>
							<div class="controls">
								<input type="text" name="member_email" value="${contentsInfo.MEMBER_CEL }">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Contents</label>
							<div class="controls">
								<textarea name="contents" rows="5" cols="50" style="width:80%;" readonly="readonly">${ contentsList.CONTENTS }</textarea>
							</div>
						</div>
					</div>
				</div><!-- 고객문의 내용 .row-fluid -->
		
				<div class="row-fluid">
					<h3 class="header smaller lighter blue">Response Infomation</h3>
					<div class="row-fluid form-horizontal">
						<div class="span12">
							<c:if test="${ contentsInfo.SUB_CONTENTS != null }">
								<div class="control-group">
									<label class="control-label">Response</label>
									<div class="controls">
										<textarea rows="5" name="sub_contents" cols="50" style="width:80%;" readonly="readonly">${ contentsInfo.SUB_CONTENTS }</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Date</label>
									<div class="controls">
										<input type="text" value="${ contentsInfo.MOD_DT }">
									</div>
								</div>
								<div class="form-actions">
									<a class="btn btn-default" href="${ contextPath }/cscenter/questionManage.do">
										<i class="icon-wrench bigger-110"></i>
										List
									</a>
								</div>
							</c:if>
							<c:if test="${ contentsInfo.SUB_CONTENTS == null }">
								<div class="control-group">
									<label class="control-label">Response</label>
									<div class="controls">
										<textarea name="sub_contents" rows="5" cols="50" style="width:80%;"></textarea>
									</div>
								</div>
								
								<div class="form-actions">
									<a class="btn btn-primary" id="modify-btn">
										<i class="icon-wrench bigger-110"></i>
										Save
									</a>
									<a class="btn btn-inverse" id="cancel-btn">
										<i class="icon-undo bigger-110"></i>
										Cancel
									</a>
								</div>
							</c:if>
						</div>
					</div>
				</div> <!--  / 답변 .row-fluid -->
			</div><!-- / 고객문의 body .row-fluid -->
		</form>	
	</div> <!-- / .page-content -->
</div><!-- / .main-content -->

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
			action: '${ contextPath }/cscenter/questionModify.do'
		}).submit();
	});
</script>