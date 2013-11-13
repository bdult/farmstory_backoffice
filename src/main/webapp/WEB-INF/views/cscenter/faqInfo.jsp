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
				<a href="#">CS</a>
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">
					FAQ
			</li>
		</ul>
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">FAQ Information</h3>
			<!-- /. table-header -->
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
						<form id="create-form" method="get" class="form-horizontal" >
							<input type="hidden" name="member_id" value="${ login_session.MEMBER_ID }">
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
								<input type="hidden" name="board_contents_id" value="${ contentsList.CONTENTS_ID }">
							</c:if>
							
							<div class="control-group">
								<label class="control-label">Title</label>
								<div class="controls">
									<input type="text" name="title" value="${ contentsList.TITLE }" style="width:80%">
								</div>
							</div>
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
							<div class="control-group">
								<div class="span4">
								<label class="control-label">Category</label>
								<div class="controls">
									<select class="span12" name="contents_code">
    								<c:forEach var="cateList" items="${ cateList }">
									  <option value="${cateList.CODE }" >${ cateList.CODE_DETAIL }</option>
    								</c:forEach>
    								</select>
    							</div>
								</div>
							</div>
							</c:if>
							<c:if test="${ contentsList.CONTENTS_ID eq null }">
							<div class="control-group">
								<div class="span4">
								<label class="control-label">Category</label>
								<div class="controls">
									<select class="span12" name="contents_code">
									  <option value="">Select</option>
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
								<label class="control-label">Contents</label>
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
									Save
									</a>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
									<i class="icon-undo bigger-110"></i>
									Cancel
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
		contents_code: {
			required: true
		},
		contents: {
			required: true
		}
	},
	messages: {
		title: {
			required: "Please insert title."
		},
		contents_code: {
			required: "Please insert category."
		},
		contents: {
			required: "Please insert contents."
		}
	}
});

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
	$("select[name=contents_code]").val("${ contentsList.CONTENTS_CODE }").attr("selected", "selected");

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