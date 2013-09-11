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
					관리자 회원 정보 추가
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
					회원 정보에 대한 상세한 정보를 입력한다
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
							<form id="create-form" method="post" action="${ contextPath }/user/admin/create.do" class="form-horizontal" >
								<div class="control-group">
									<label class="control-label">회원 ID</label>
									<div class="controls">
										<input type="text" name="member_id" id="member_id" placeholder="회원 ID">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 이름</label>
									<div class="controls">
										<input  type="text" name="member_nm" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 비밀번호</label>
									<div class="controls">
										<input  type="text" name="member_pw" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 전화번호</label>
									<div class="controls">
										<input  type="text" name="member_cel" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 이메일</label>
									<div class="controls">
										<input  type="text" name="member_email" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 휴대폰 번호</label>
									<div class="controls">
										<input  type="text" name="member_tel" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 주소</label>
									<div class="controls">
										<input  type="text" name="member_addr_1" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 상세 주소</label>
									<div class="controls">
										<input  type="text" name="member_addr_2" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 등급</label>
									<div class="controls">
										<input  type="text" name="member_role" />
									</div>
								</div>
								<div class="form-actions">
									<button class="btn btn-primary" type="submit" id="add-btn">
										<i class="icon-ok bigger-110"></i>
										저장
									</button>

									&nbsp; &nbsp; &nbsp;
									<a class="btn btn-inverse" id="cancel-btn">
										<i class="icon-undo bigger-110"></i>
										취소
									</a>
								</div>
							</form>
					</div>
			</div>
			
		<c:if test="${type == 'userView' }">
			<div class="page-header position-relative">
					<h1>
						자녀 정보
						<small>
							<i class="icon-double-angle-right"></i>
							회원 자녀 정보에 대한 상세한 정보를 입력한다
						</small>
					</h1>
			</div>		
				
		<!--/.page-header-->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>자녀 이름</th>
						<th>지녀 성별</th>
						<th>자녀 생년월일</th>
					</tr>
				</thead>
				
				<tbody>
						<c:forEach var="childList" items="${detail.userChildList}"
							varStatus="status">
							<tr>
								<td>${ childList.CHILD_NM }</td>
								<td>${ childList.GENDER }</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</c:if>
		</div>
	</div>
	<!--/.page-content-->
</div>
<!--/.main-content-->

<script>
$(document).ready(function(){
	
	var dspType = "${detail.type}";
	$("#side-user").attr("class", "open active");
	if(dspType == "userView"){
		$("#side-user-user").attr("class", "active");
	}else{
		$("#side-user-admin").attr("class", "active");
	}

	$("#cancel-btn").click(function(){
			window.location.href="manage.do?pageNum=1";
	});
	
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
