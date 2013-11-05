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
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
				<!--PAGE CONTENT BEGINS-->
						<div class="control-group">
							<label class="control-label">문의 제목</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">작성자</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">아이디</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">이메일</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">전화번호</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">내용</label>
							<div class="controls">
								<input type="text" name="" value="">
							</div>
						</div>
			</div>
		</div>
		
		
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">고객문의 내용 답변</h3>
			
			<div class="row-fluid">
				<div class="span12">
					<c:if test="true">
						<form id="create-form" method="get" class="form-horizontal" >
							<div class="control-group">
								<label class="control-label">답변</label>
								<div class="controls">
									<textarea rows="5" cols="50" style="width:80%;"></textarea>
								</div>
							</div>
							
							<div class="form-actions">
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
					</c:if>
					<c:if test="true">
						<form id="create-form" method="get" class="form-horizontal" >
							<div class="control-group">
								<label class="control-label">답변</label>
								<div class="controls">
									<textarea rows="5" cols="50" style="width:80%;" readonly="readonly"></textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">답변일</label>
								<div class="controls">
									<input type="text" name="" value="">
								</div>
							</div>
							
							<div class="form-actions">
								<button class="btn btn-default" type="submit" id="modify-btn"">
									<i class="icon-wrench bigger-110"></i>
									목록
								</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
				
			
		</div>
	</div>
</div>

<script type="text/javascript">

	//side active
	$("#side-cscenter").addClass("open active");
		$("#side-cscenter-question").addClass("active");

	$("input:text").attr({
		readonly : 'readonly'
	});
</script>