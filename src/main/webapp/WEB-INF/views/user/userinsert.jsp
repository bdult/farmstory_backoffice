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
				<c:if test="${ type == 'create' }">유저정보 생성</c:if>
				<c:if test="${ type == 'edit' }">유저정보 수정</c:if>
			</li>
		</ul>
		<!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> 
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" /> 
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				<c:if test="${ type == 'create' }">유저정보 생성</c:if>
				<c:if test="${ type == 'edit' }">유저정보 수정</c:if>
				<small>
					<i class="icon-double-angle-right"></i>
					유저정보에 대한 상세한 정보를 입력한다
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
				
					<c:if test="${ type == 'create' }">
							<form id="create-form" method="post" action="${ contextPath }/user/create.do" class="form-horizontal" >
								
								<div class="control-group">
									<label class="control-label">유저 ID</label>

									<div class="controls">
										<input type="text" name="id" value="">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">유저 이름</label>

									<div class="controls">
										<input type="text" name="name" value="" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label">유저 비밀번호</label>

									<div class="controls">
										<input type="text" name="pwd" value="" />
									</div>
								</div>

								
								<div class="control-group">
									<label class="control-label">유저 권한</label>

									<div class="controls">
										<input type="text" name="role" value="" />
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>

								
							</form>
				</c:if>
				
				<c:if test="${ type == 'edit' }">
							<form id="create-form" method="get" action="${ contextPath }/user/update.do" class="form-horizontal" >
								
								<div class="control-group">
									<label class="control-label">유저 ID</label>

									<div class="controls">
										<input type="text" name="id" value="${userListOne.MEMBER_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">유저 이름</label>

									<div class="controls">
										<input type="text" name="name" value="${userListOne.MEMBER_NM}" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label">유저 비밀번호</label>

									<div class="controls">
										<input type="text" name="pwd" value="${userListOne.MEMBER_PW}" />
									</div>
								</div>

								
								<div class="control-group">
									<label class="control-label">유저 권한</label>

									<div class="controls">
										<input type="text" name="role" value="${userListOne.MEMBER_ROLE}" />
									</div>
								</div>
								

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>

							</form>
					
				</c:if>
				
		</div>
	</div>

	</div>
	<!--/.page-content-->

</div>
<!--/.main-content-->