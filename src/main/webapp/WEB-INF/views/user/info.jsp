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
							<form id="create-form" method="get" class="form-horizontal" >

								<div class="control-group">
									<label class="control-label">아이디</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="member_id" value="${detail.userDetail.MEMBER_ID}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이름</label>
									<div class="controls">
										<input type="text" name="member_nm" value="${detail.userDetail.MEMBER_NM}" />
									</div>
								</div>
								<%-- <div class="control-group">
									<label class="control-label">회원 비밀번호</label>
									<div class="controls">
										<input type="text" name="member_pw" value="${detail.userDetail.MEMBER_PW}" />
									</div>
								</div> --%>
								<div class="control-group">
									<label class="control-label">생년월일</label>
									<div class="controls">
										<input type="hidden" value="${detail.userDetail.MEMBER_YEAR}" />
										<input type="hidden" value="${detail.userDetail.MEMBER_MONTHL}" />
										<input type="hidden" value="${detail.userDetail.MEMBER_DAY}" />
										<input type="text" value="${detail.userDetail.MEMBER_YEAR}년 ${detail.userDetail.MEMBER_MONTH}월 ${detail.userDetail.MEMBER_DAY}일" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">성별</label>
									<div class="controls">
										<input type="text" name="member_gender" value="${detail.userDetail.MEMBER_GENDER}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">휴대폰</label>
									<div class="controls">
										<input type="text" name="member_cel" value="${detail.userDetail.MEMBER_CEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이메일</label>
									<div class="controls">
										<input type="text" name="member_email" value="${detail.userDetail.MEMBER_EMAIL}" />
									</div>
								</div>
								<!-- <div class="control-group">
									<label class="control-label">회원 주소</label>
									<div class="controls"> -->
										<input type="hidden" name="member_addr_1" value="${detail.userDetail.MEMBER_ADDR_1}" />
									<!-- </div>
								</div>
								<div class="control-group">
									<label class="control-label">회원 상세 주소</label>
									<div class="controls"> -->
										<input type="hidden" name="member_addr_2" value="${detail.userDetail.MEMBER_ADDR_2}" />
									<!-- </div>
								</div> -->
								<div class="control-group">
									<label class="control-label">주소</label>
									<div class="controls">
										<input class="input-xxlarge" type="text" value="${detail.userDetail.MEMBER_ADDR_1} ${detail.userDetail.MEMBER_ADDR_2}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원구분</label>
									<div class="controls">
										<input type="text" name="" value="" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">최근결제일</label>
									<div class="controls">
										<input type="text" name="" value="" />
									</div>
								</div>
								
								<%-- <div class="control-group">
									<label class="control-label">회원 등급</label>

									<div class="controls">
										<input type="text" name="member_role" value="${detail.userDetail.MEMBER_ROLE}" />
									</div>
								</div> --%>
								
								<%-- <div class="control-group">
									<label class="control-label">회원 상태</label>

									<div class="controls">
										<input type="text" name="member_status" value="${detail.userDetail.MEMBER_STATUS}" />
									</div>
								</div> --%>
								<c:if test="${detail.type == 'adminView' }">
								<div class="form-actions">
									<button class="btn btn-primary" type="submit" id="modify-btn">
										<i class="icon-wrench bigger-110"></i>
										수정
									</button>
									<button class="btn btn-danger" type="submit" id="delete-btn">
										<i class="icon-trash bigger-110"></i>
										삭제
									</button>
									<a class="btn btn-inverse" id="cancel-btn">
										<i class="icon-undo bigger-110"></i>
										취소
									</a>
								</div>
								</c:if>
								<%-- <c:if test="${detail.type == 'userView' }">
									<div class="form-actions">
										<a class="btn btn-inverse" id="cancel-btn">
											<i class="icon-list bigger-110"></i>
											목록으로
										</a>
									</div>
								</c:if> --%>
							</form>
					</div>
			</div>
			
		<c:if test="${detail.type == 'userView' }">
		<!-- clidren nav -->
			<ul class="nav nav-tabs" id="myTab">
				<li class="active" id="navTab1">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						자녀방설정
					</a>
				</li>

				<li class="" id="navTab2">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						결제내역
					</a>
				</li>
				<li class="" id="navTab3">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						쿠폰내역
					</a>
				</li>
				<li class="" id="navTab4">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						1:1문의
					</a>
				</li>
			</ul>
			
		<!--/.page-header-->
			<table class="table table-striped table-bordered table-hover" id="navTabList1">
				<c:forEach var="childList" items="${detail.userChildList}" varStatus="status" begin="0" end="0">
					<thead>
						<tr>
							<th colspan="4">자녀A 정보</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>이름</td>
								<td><a href="${ contextPath }/user/childDetail.do?idx=${ childList.IDX }">${ childList.CHILD_NM }</a></td>
								<td>성별</td>
								<td>${ childList.GENDER }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
								<td>자녀등록일</td>
								<td></td>
							</tr>
					</tbody>
				</c:forEach>
					
				<c:forEach var="childList" items="${detail.userChildList}" varStatus="status" begin="1" end="1">
					<thead>
						<tr>
							<th colspan="4">자녀B 정보</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>이름</td>
								<td><a href="${ contextPath }/user/childDetail.do?idx=${ childList.IDX }">${ childList.CHILD_NM }</a></td>
								<td>성별</td>
								<td>${ childList.GENDER }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
								<td>자녀등록일</td>
								<td></td>
							</tr>
					</tbody>
				</c:forEach>
			</table>
			
			<table class="table table-striped table-bordered table-hover" id="navTabList2" style="display: none;">
				<thead>
					<tr>
						<th>NO.</th>
						<th>결제일자</th>
						<th>요금제</th>
						<th>결제요금</th>
						<th>결제방법</th>
						<th>잔여기간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="true" items="true">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-striped table-bordered table-hover" id="navTabList3" style="display: none;">
				<thead>
					<tr>
						<th>NO.</th>
						<th>등록일자</th>
						<th>쿠폰명</th>
						<th>쿠폰번호</th>
						<th>쿠폰만료일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="true" items="true">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-striped table-bordered table-hover" id="navTabList4" style="display: none;">
				<thead>
					<tr>
						<th>NO.</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변현황</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="true" items="true">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			
			<div class="row-fluid">
				<div class="span12 text-right">
					<a class="btn btn-primary" href="${ contextPath }/user/userModify.do?member_id=${detail.userDetail.MEMBER_ID}">회원정보 수정</a>
				</div>
			</div>
		</c:if>
		</div>
	</div>
	<!--/.page-content-->
<!--/.main-content-->

<script type="text/javascript">

$(function(){
	var memberType = "${detail.userDetail.MEMBER_TYPE}";
	$("#side-user").attr("class", "open active");
	if(memberType == 1){
		$("input:text").attr({
			readonly : 'readonly'
		});
		$("#side-user-user").attr("class", "active");
	}else{
		$("#side-user-admin").attr("class", "active");
	}

	$("#cancel-btn").click(function(){
		if(memberType == 1){
			window.location.href="user/manage.do?pageNum=1";
		}else {
			window.location.href="admin/manage.do?pageNum=1";
		}
	});

	$("#modify-btn").click(function(){
		if(confirm("저장 하시겠습니까?")){
			$("#create-form").attr({
				method: 'post',
				action: '${ contextPath }/user/admin/modify.do'
			}).submit();
		}else{
			return false;
		}
	});

	$("#delete-btn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			$("#create-form").attr('action', '${ contextPath }/user/admin/delete.do').submit();
		}else{
			return false;
		}
	});
});


$("#navTab1").click(function(){
	$("#navTabList1").show();
	$("#navTabList2").css("display", "none");
	$("#navTabList3").css("display", "none");
	$("#navTabList4").css("display", "none");
});
$("#navTab2").click(function(){
	$("#navTabList1").css("display", "none");
	$("#navTabList2").show();
	$("#navTabList3").css("display", "none");
	$("#navTabList4").css("display", "none");
});
$("#navTab3").click(function(){
	$("#navTabList1").css("display", "none");
	$("#navTabList2").css("display", "none");
	$("#navTabList3").show();
	$("#navTabList4").css("display", "none");
});
$("#navTab4").click(function(){
	$("#navTabList1").css("display", "none");
	$("#navTabList2").css("display", "none");
	$("#navTabList3").css("display", "none");
	$("#navTabList4").show();
});

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
