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
				<a href="#">FAQ 관리</a>
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">
				<c:if test="${ contentsList.CONTENTS_ID ne null }">
					FAQ 상세
				</c:if>
				<c:if test="${ contentsList.CONTENTS_ID eq null }">
					FAQ 등록
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
			<c:if test="${ contentsList.CONTENTS_ID ne null }">
				<h3 class="header smaller lighter blue">FAQ 상세</h3>
			</c:if>
			<c:if test="${ contentsList.CONTENTS_ID eq null }">
				<h3 class="header smaller lighter blue">FAQ 등록</h3>
			</c:if>
			<!-- /. table-header -->
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
						<form id="create-form" method="get" class="form-horizontal" >
							<input type="hidden" name="member_id" value="${ login_session.MEMBER_ID }">
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
								<input type="hidden" name="board_contents_id" value="${ contentsList.CONTENTS_ID }">
							</c:if>
							
							<div class="control-group">
								<label class="control-label">제목</label>
								<div class="controls">
									<input type="text" name="title" value="${ contentsList.TITLE }" style="width:80%">
								</div>
							</div>
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
							<div class="control-group">
								<label class="control-label">카테고리</label>
								<div class="controls">
									<input type="text" name="cate" value="${ contentsList.CATE }">
								</div>
							</div>
							</c:if>
							<c:if test="${ contentsList.CONTENTS_ID eq null }">
							<div class="control-group">
								<div class="span4">
								<label class="control-label">카테고리</label>
								<div class="controls">
									<select class="span12" name="board_contents_code">
    								<c:forEach var="cateList" items="${ cateList }">
									  <option value="${cateList.CODE }" >${ cateList.CODE_DETAIL }</option>
    								</c:forEach>
    								</select>
								</div>
								</div>
								<div class="span8"></div>
							</div>
							</c:if>
							
							<div class="control-group">
								<label class="control-label">내용</label>
								<div class="controls">
									<textarea rows="5" cols="50" name="contents" style="width:80%;">${ contentsList.CONTENTS }</textarea>
								</div>
							</div>
							
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
							<div class="form-actions">
								<a class="btn btn-danger" id="delete-btn" disabled>
									<i class="icon-trash bigger-110"></i>
									삭제
								</a>
								<a class="btn btn-primary" id="modify-btn">
									<i class="icon-wrench bigger-110"></i>
									확인
								</a>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
									<i class="icon-undo bigger-110"></i>
									취소
								</a>
							</div>
							</c:if>
							
							<c:if test="${ contentsList.CONTENTS_ID eq null }">
							<div class="form-actions">
								<a class="btn btn-primary" id="create-btn">
									<i class="icon-wrench bigger-110"></i>
									확인
									</a>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
									<i class="icon-undo bigger-110"></i>
									취소
								</a>
							</div>
							</c:if>
						</form>
			</div>
		</div>
						
		</div>
	</div>
	
</div>


<!--  thumbnail modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="thumbnail-upload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">썸네일 업로드</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="thumbnail-upload-input" name="file" />
		</div>
		<div id="thumbnail-modal-footer" class="modal-footer">
			<button type="submit" id="thumbnail-upload-submit" class="btn btn-sm btn-success">
				업로드
				<i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	
	//side active
	$("#side-cscenter").addClass("open active");
		$("#side-cscenter-faq").addClass("active");

	//page init
	/* if("${ contentsList.CONTENTS_ID }" != ''){
		$("input:text").attr({
			readonly : 'readonly'
		});
		$("textarea").attr({
			readonly : 'readonly'
		});
	} */

	$("#create-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/faqCreateContents.do'
		}).submit();
	});
	$("#modify-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/faqModifyContents.do'
		}).submit();
	});
	$("#delete-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/faqDeleteContents.do'
		}).submit();
	});
</script>