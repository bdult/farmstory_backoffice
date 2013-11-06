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
								<label class="control-label">카테고리</label>
								<div class="controls">
									<select>
									  <option>자주묻는질문 TOP10</option>
									  <option>회원/가입안내</option>
									  <option>결제안내</option>
									  <option>서비스안내</option>
									  <option>이용장애안내</option>
									</select>
								</div>
							</div>
							</c:if>
							
							<div class="control-group">
								<label class="control-label">내용</label>
								<div class="controls">
									<textarea rows="5" cols="50" name="contents" style="width:80%;">${ contentsList.CONTENTS }</textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<a class="btn btn-danger" id="delete-btn" disabled>
									<i class="icon-trash bigger-110"></i>
									삭제
								</a>
								<c:if test="${ contentsList.CONTENTS_ID ne null }">
								<a class="btn btn-primary" href="${ contextPath }/cscenter/faqManage.do">
									<i class="icon-wrench bigger-110"></i>
									확인
								</a>
								</c:if>
								<c:if test="${ contentsList.CONTENTS_ID eq null }">
								<a class="btn btn-primary" id="modify-btn">
									<i class="icon-wrench bigger-110"></i>
									확인
								</a>
								</c:if>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
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

<script type="text/javascript">
	
	//side active
	$("#side-cscenter").addClass("open active");
		$("#side-cscenter-faq").addClass("active");

	//page init
	if("${ contentsList.CONTENTS_ID }" != ''){
		$("input:text").attr({
			readonly : 'readonly'
		});
		$("textarea").attr({
			readonly : 'readonly'
		});
	}

	$("#modify-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/faqAddContents.do'
		}).submit();
	});
</script>