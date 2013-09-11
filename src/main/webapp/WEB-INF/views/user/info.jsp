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
				<c:if test="${detail.type == 'userView' }">
					일반 회원 정보 상세
				</c:if>
				<c:if test="${detail.type == 'adminView' }">
					관리자 회원 정보 상세
				</c:if>
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
							<form id="create-form" method="get" action="${ contextPath }/user/admin/delete.do" class="form-horizontal" >
								<div class="control-group">
									<label class="control-label">회원 ID</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_id" value="${detail.userDetail.MEMBER_ID}">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">회원 이름</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_nm" value="${detail.userDetail.MEMBER_NM}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 이메일</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_email" value="${detail.userDetail.MEMBER_EMAIL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 전화번호</label>
									<div class="controls">
										<input readonly="readonly" readonly="readonly" type="text" name="member_tel" value="${detail.userDetail.MEMBER_TEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 휴대폰 번호</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_sel" value="${detail.userDetail.MEMBER_CEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 주소</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_addr1" value="${detail.userDetail.MEMBER_ADDR_1}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 상세 주소</label>
									<div class="controls">
										<input readonly="readonly" type="text" name="member_addr2" value="${detail.userDetail.MEMBER_ADDR_2}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">회원 등급</label>

									<div class="controls">
										<input readonly="readonly" type="text" name="member_role" value="${detail.userDetail.MEMBER_ROLE}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">회원 상태</label>

									<div class="controls">
										<input readonly="readonly" type="text" name="member_type" value="${detail.userDetail.MEMBER_ROLE}" />
									</div>
								</div>
								<c:if test="${detail.type == 'adminView' }">
								<div class="form-actions">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i>
										삭제
									</button>
								</div>
								</c:if>
							</form>
					</div>
			</div>
			
		<c:if test="${detail.type == 'userView' }">
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
/* $(document).ready(function(){
	
	var dspType = "${detail.type}";
	$("#side-user").attr("class", "open active");
	if(dspType == "userView"){
		$("#side-user-user").attr("class", "active");
	}else{
		$("#side-user-admin").attr("class", "active");
	}
	
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
		
}); */
</script>
