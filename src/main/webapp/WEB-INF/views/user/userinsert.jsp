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

								<div class="control-group">
									<label class="control-label">유저 타입 1:admin 2:user</label>

									<div class="controls">
										<input type="text" name="member_type" value="" />
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset" onclick="history.back(-1)">
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
								
								<div class="control-group">
									<label class="control-label">유저 타입 1:admin 2:user</label>

									<div class="controls">
										<input type="text" name="member_type" value="${userListOne.MEMBER_TYPE}" />
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset" onclick="history.back(-1)">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>
								
							</form>
					
				</c:if>
				
				
					<c:if test="${ type == 'childCreate' }">
							<form id="create-form" method="post" action="${ contextPath }/user/childCreate.do" class="form-horizontal" >
								<input type="hidden" name="id" value="${ userListOne.MEMBER_ID }">
								
								<div class="control-group">
									<label class="control-label">부모 ID</label>

									<div class="controls">
										<input type="text" name="parent_member_id" value="">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">자녀 이름</label>

									<div class="controls">
										<input type="text" name="child_nm" value="" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label">자녀 사진</label>

									<div class="controls">
										<input class="span1" type="text" id="form-field-5" placeholder="file name" />
										<input class="span11" type="text" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>

								
								<div class="control-group">
									<label class="control-label">자녀 성별</label>

									<div class="controls">
										<select class="span2" id="genderBox" name="gender">
											<option value="남">남</option>
											<option value="여">여</option>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">자녀 생년월일</label>

									<div class="controls">
										<select class="span2" id="yearBox" name="birth_year">
										</select>년&nbsp;
										
										<select class="span2" id="monthBox" name="birth_month">
										</select>월&nbsp;
										
										<select class="span2" id="dayBox" name="birth_day">
										</select>일&nbsp;
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset" onclick="history.back(-1)">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>

								
							</form>
				</c:if>
				
				<c:if test="${ type == 'childEdit' }">
							<form id="create-form" method="post" action="${ contextPath }/user/childUpdate.do" class="form-horizontal" >
								<input type="hidden" name="id" value="${ userListOne.MEMBER_ID }">
								<input type="hidden" name="idx" value="${ childListOne.IDX }">
								
								<div class="control-group">
									<label class="control-label">부모 ID</label>

									<div class="controls">
										<input type="text" name="parent_member_id" value="${ childListOne.PARENT_MEMBER_ID }">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">자녀 이름</label>

									<div class="controls">
										<input type="text" name="child_nm" value="${ childListOne.CHILD_NM }" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label">자녀 사진</label>

									<div class="controls">
										<input class="span1" type="text" id="form-field-5" placeholder="file name" />
										<input class="span11" type="text" name="photo" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>

								
								<div class="control-group">
									<label class="control-label">자녀 성별</label>

									<div class="controls">
										<select class="span2" id="genderBox" name="gender" data-gender_value="${childListOne.GENDER}">
											<option value="남">남</option>
											<option value="여">여</option>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">자녀 생년월일</label>

									<div class="controls">
										<select class="span2" id="yearBox" name="birth_year">
										</select>년&nbsp;
										
										<select class="span2" id="monthBox" name="birth_month">
										</select>월&nbsp;
										
										<select class="span2" id="dayBox" name="birth_day">
										</select>일&nbsp;
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset" onclick="history.back(-1)">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>

							</form>
					
				</c:if>
				
				<c:if test="${ type == 'edit' }">
				
			<div class="table-header">
				<a class="btn btn-info" href="${ contextPath }/user/childCreateView.do?id=${ userListOne.MEMBER_ID }">자녀추가</a>
			</div><!-- /. table-header -->
		<!--/.page-header-->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>자녀 이름</th>
						<th>자녀 사진경로</th>
						<th>지녀 성별</th>
						<th>자녀 생년월일</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
						<c:forEach var="childList" items="${childList}"
							varStatus="status">
							<tr>
								<td><a href="${ contextPath }/user/childModify.do?idx=${ childList.IDX }&id=${ userListOne.MEMBER_ID }">${ childList.CHILD_NM }</a></td>
								<td>${ childList.PHOTO }</td>
								<td>${ childList.GENDER }</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
								<td class="td-actions">
									<div class="hidden-phone visible-desktop action-buttons">
	
										<a class="red" href="${ contextPath }/user/childDelete.do?idx=${ childList.IDX }&id=${ userListOne.MEMBER_ID }">
											<i id="delete_icon" class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>

	</div>
	<!--/.page-content-->

</div>
<!--/.main-content-->
<<<<<<< HEAD


<script>
$(document).ready(function(){
	
	var $genderBox = $("#genderBox");
	var genderData = $genderBox.data("gender_value");
	$genderBox.find("option").each(function(){
		
		var $this = $(this);
		
		if( genderData == $this.val() ) {
			$this.prop("selected", true);
		}
		
	});
	
	
	for(var i=1995; i <= 2014; i++){
		$("#yearBox").append("<option value=" + i +">" + i + "</option>");
		$("#yearBox").val(${childListOne.BIRTH_YEAR});
	}
	for(var i=1; i <= 12; i++){
		$("#monthBox").append("<option value=" + i +">" + i + "</option>");
		$("#monthBox").val(${childListOne.BIRTH_MONTH});
	}
	for(var i=1; i <= 31; i++){
		$("#dayBox").append("<option value=" + i +">" + i + "</option>");
		$("#dayBox").val(${childListOne.BIRTH_DAY});
	}
		
});
</script>
=======
>>>>>>> jisoon
