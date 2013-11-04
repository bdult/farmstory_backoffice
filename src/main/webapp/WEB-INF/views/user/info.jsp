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
										<input type="text" readonly="readonly" name="member_id" value="${detail.MEMBER_ID}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이름</label>
									<div class="controls">
										<input type="text" name="member_nm" value="${detail.MEMBER_NM}" />
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
										<input type="hidden" value="${detail.MEMBER_YEAR}" />
										<input type="hidden" value="${detail.MEMBER_MONTHL}" />
										<input type="hidden" value="${detail.MEMBER_DAY}" />
										<input type="text" value="${detail.MEMBER_YEAR}년 ${detail.MEMBER_MONTH}월 ${detail.MEMBER_DAY}일" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">성별</label>
									<div class="controls">
										<input type="text" name="member_gender" value="${detail.MEMBER_GENDER}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">휴대폰</label>
									<div class="controls">
										<input type="text" name="member_cel" value="${detail.MEMBER_CEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이메일</label>
									<div class="controls">
										<input type="text" name="member_email" value="${detail.MEMBER_EMAIL}" />
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
										<input class="input-xxlarge" type="text" value="${detail.MEMBER_ADDR_1} ${detail.MEMBER_ADDR_2}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">회원구분</label>
									<div class="controls">
										<input type="text" name="" value="${detail.MEMBER_ROLE}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">최근결제일</label>
									<div class="controls">
										<input type="text" name="" value="${detail.PAYDAY}" />
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
		<c:if test="${type == 'userView' }">
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
				<c:forEach var="childList" items="${childInfo}" varStatus="status" begin="0" end="1">
					<thead>
						<tr>
							<c:if test="${ status.count == 1 }">
								<th colspan="4">자녀A 정보<button href="#child-modal-form" class="btn pull-right" data-toggle="modal">자녀A 정보 수정</button></th>
							</c:if>
							<c:if test="${ status.count == 2 }">
								<th colspan="4">자녀B 정보<button href="#child-modal-form" class="btn pull-right" data-toggle="modal">자녀B 정보 수정</button></th>
							</c:if>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>이름</td>
								<td>${ childList.CHILD_NM }</td>
								<td>성별</td>
								<td>${ childList.GENDER }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
								<td>자녀등록일</td>
								<td>${ childList.REG_DT }</td>
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
						<c:forEach var="paymentsInfo" items="${paymentsInfo}" varStatus="status">
							<tr>
								<td>${ paymentsInfo.IDX }</td>
								<td>${ paymentsInfo.REG_DT }</td>
								<td>${ paymentsInfo.PAYMENT_CODE }</td>
								<td>${ paymentsInfo.PAYMENT_PROCESS }</td>
								<td>${ paymentsInfo.PRICE }</td>
								<td>${ paymentsInfo.REMINE_DAY }</td>
							</tr>
						</c:forEach>
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
					<c:forEach var="questionInfo" items="${ questionInfo }" varStatus="status">
						<tr>
							<td>${ questionInfo.IDX }</td>
							<td>${ questionInfo.TITLE }</td>
							<td>${ questionInfo.REG_DT }</td>
							<td>${ questionInfo.ANSWER_YN }</td>
						</tr>
					</c:forEach>
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

<!-- clid modify modal form -->
<div id="child-modal-form" class="modal hide in" tabindex="-1" >
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h4 class="blue bigger">아래의 정보를 입력해 주세요</h4>
	</div>

	<div class="modal-body overflow-visible">
		<div class="row-fluid">
			<div class="span12">
				<div class="control-group">
					<label class="control-label" for="form-field-username">자녀명</label>

					<div class="controls">
						<input type="text" id="form-field-username" value="">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">성별</label>
					<div class="controls">
						<div class="row-fluid">
						<label class="span2">
							<input name="form-field-radio" type="radio">
							<span class="lbl"> 남</span>
						</label>
						<label class="span2">
							<input name="form-field-radio" type="radio">
							<span class="lbl"> 여</span>
						</label>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">썸네일</label>

					<div class="controls">
						<input readonly="readonly" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
						<input type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">생년월일</label>

					<div class="controls">
						<input class="span3" type="text" id="" value="">년
						<input class="span3" type="text" id="" value="">월
						<input class="span3" type="text" id="" value="">일
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal-footer">
		<button class="btn btn-small btn-primary">
			<i class="icon-ok"></i>
			등록
		</button>
		<button class="btn btn-small" data-dismiss="modal">
			<i class="icon-remove"></i>
			취소
		</button>

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


//child modal thombnail upload
$(function(){
	
	$('#thumbnail-upload-input').ace_file_input({
		style:'well',
		btn_choose:'Drop files here or click to choose',
		btn_change:null,
		no_icon:'icon-cloud-upload',
		droppable:true,
		thumbnail:'large'//large | fit
		//,icon_remove:null//set null, to hide remove/reset button
		/**,before_change:function(files, dropped) {
			//Check an example below
			//or examples/file-upload.html
			return true;
		}*/
		/**,before_remove : function() {
			return true;
		}*/
		,
		preview_error : function(filename, error_code) {
			//name of the file that failed
			//error_code values
			//1 = 'FILE_LOAD_FAILED',
			//2 = 'IMAGE_LOAD_FAILED',
			//3 = 'THUMBNAIL_FAILED'
			//alert(error_code);
		}

	}).on('change', function(){
		$("#thumbnail-modal-footer").show();
	});
	
	$('#thumbnail-upload-form').ajaxForm(
			 {
				    success: function(response){
				      $("#img_path").val(response);
				      $("#thumbnail-modal").modal('toggle');
					}
			 }
	 );
	
	$("#thumbnail-mod-btn").click(function(){
		$("#thumbnail-modal-footer").hide();
		$("#thumbnail-modal").modal('toggle');
	}); // <!-- brand-mod-btn event end
	
	
}); // <!-- function() end 

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
