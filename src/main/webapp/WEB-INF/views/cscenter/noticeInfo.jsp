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
				<a href="#">공지사항 관리</a>
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">
				<c:if test="${ contentsList.CONTENTS_ID ne null }">
					공지사항 상세
				</c:if>
				<c:if test="${ contentsList.CONTENTS_ID eq null }">
					공지사항 등록
				</c:if>
			</li>
		</ul>
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<div class="row-fluid">
			<c:if test="${ contentsList.CONTENTS_ID ne null }">
				<h3 class="header smaller lighter blue">공지사항 상세</h3>
			</c:if>
			<c:if test="${ contentsList.CONTENTS_ID eq null }">
				<h3 class="header smaller lighter blue">공지사항 등록</h3>
			</c:if>
			<!-- /. table-header -->
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
						<form id="create-form" class="form-horizontal" >
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
							<div class="control-group">
								<label class="control-label">내용</label>
								<div class="controls">
									<textarea name="contents" rows="5" cols="50" style="width:80%;">${ contentsList.CONTENTS }</textarea>
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

<script type="text/javascript">

//validate
setValid();
$("#create-form").validate({
	rules: {
		title: {
			required: true
		},
		contents: {
			required: true
		}
	},
	messages: {
		title: {
			required: "제목을 입력해 주세요."
		},
		contents: {
			required: "내용을 입력해 주세요."
		}
	}
});

	//side active
	$("#side-cscenter").addClass("open active");
		$("#side-cscenter-notice").addClass("active");
	
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
			action: '${ contextPath }/cscenter/noticeCreateContents.do'
		}).submit();
	});
	$("#modify-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/noticeModifyContents.do'
		}).submit();
	});
	$("#delete-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/noticeDeleteContents.do'
		}).submit();
	});
</script>