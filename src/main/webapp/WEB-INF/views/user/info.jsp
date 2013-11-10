<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				일반 회원 정보 상세
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
								<%-- <c:if test="${detail.type == 'adminView' }">
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
								</c:if> --%>
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
				
				<!-- <li class="" id="navTab3">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						쿠폰내역
					</a>
				</li> -->
				
				<li class="" id="navTab4">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						1:1문의
					</a>
				</li>
			</ul>

		<!--/.page-header-->
			<table class="table table-striped table-bordered table-hover" id="navTabList1">
			<c:if test="${ !empty childInfo }">
				<c:forEach var="childList" items="${childInfo}" varStatus="status" begin="0" end="1">
					<thead>
						<tr>
							<c:if test="${ status.index == 0 }">
								<th colspan="4">자녀A 정보<button href="#child-modal-form-A" id="child-modal-btn-A" class="btn pull-right" data-toggle="modal">자녀A 정보 수정</button></th>
							</c:if>
							<c:if test="${ status.index == 1 }">
								<th colspan="4">자녀B 정보<button href="#child-modal-form-B" id="child-modal-btn-B" class="btn pull-right" data-toggle="modal">자녀B 정보 수정</button></th>
							</c:if>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>이름</td>
								<td>${ childList.CHILD_NM }</td>
								<td>성별</td>
								<td class="tdGender">${ childList.GENDER }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${ childList.BIRTH_YEAR } . ${ childList.BIRTH_MONTH } . ${ childList.BIRTH_DAY }</td>
								<td>자녀등록일</td>
								<td>${ childList.REG_DT }</td>
							</tr>
					</tbody>
				</c:forEach>
			</c:if>
			</table>
			
			<table class="table table-striped table-bordered table-hover" id="navTabList2" style="display: none;">
			<c:if test="${ !empty paymentsInfo}">
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
								<td>${ paymentsInfo.ROWNUM }</td>
								<td>${ paymentsInfo.REG_DT }</td>
								<td>${ paymentsInfo.PAYMENT_CODE }</td>
								<td>${ paymentsInfo.PRICE }</td>
								<td>${ paymentsInfo.PAYMENT_PROCESS }</td>
								<td>${ paymentsInfo.REMINE_DAY }</td>
							</tr>
						</c:forEach>
					</tbody>
			</c:if>
			</table>
			
			<%-- <table class="table table-striped table-bordered table-hover" id="navTabList3" style="display: none;">
			<c:if test="${ !empty couponInfo }">
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
			</c:if>
			</table> --%>
			
			<table class="table table-striped table-bordered table-hover" id="navTabList4" style="display: none;">
			<c:if test="${ !empty questionInfo }">
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
							<td><a href="${ contextPath }/cscenter/questionInfo.do?board_contents_id=${ questionInfo.CONTENTS_ID }">${ questionInfo.ROWNUM }</a></td>
							<td><a href="${ contextPath }/cscenter/questionInfo.do?board_contents_id=${ questionInfo.CONTENTS_ID }">${ questionInfo.TITLE }</a></td>
							<td>${ questionInfo.REG_DT }</td>
							<td>${ questionInfo.ANSWER_YN }</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
			</table>
			
			<div class="row-fluid">
				<div class="span12 text-right">
					<a class="btn btn-primary" href="${ contextPath }/user/userModifyView.do?member_id=${detail.MEMBER_ID}">회원정보 수정</a>
				</div>
			</div>
		</div>
	</div>
	<!--/.page-content-->
<!--/.main-content-->

<!-- clid modify modal form A -->
<form id="child-modal-form-A" class="modal hide in" tabindex="-1" >
	<c:forEach var="childList" items="${childInfo}" varStatus="status" begin="0" end="0">
	<input type="hidden" name="child_idx" value="${ childList.IDX }">
	<input type="hidden" name="member_id" value="${ detail.MEMBER_ID }">
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
						<input type="text" name="child_name" id="form-field-username" value="${ childList.CHILD_NM }">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">성별</label>
					<div class="controls">
						<div class="row-fluid">
						<label class="span2">
							<input id="gender-m" name="gender" type="radio" value="남">
							<span class="lbl"> 남</span>
						</label>
						<label class="span2">
							<input id="gender-f" name="gender" type="radio" value="여">
							<span class="lbl"> 여</span>
						</label>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">썸네일</label>

					<div class="controls" style="height:40px;">
						<input readonly="readonly" type="text" id="img_path" name="img_path" value="${ childList.PHOTO }" style="margin-bottom:0;"/>
						<input type="button" class="btn btn-primary thumbnail-mod-btn" value="썸네일 변경" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">생년월일</label>

					<div class="controls">
						<input name="birth_year" class="span3" type="text" id="" value="${ childList.BIRTH_YEAR }">년
						<input name="birth_month" class="span3" type="text" id="" value="${ childList.BIRTH_MONTH }">월
						<input name="birth_day" class="span3" type="text" id="" value="${ childList.BIRTH_DAY }">일
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>

	
	<div class="modal-footer">
		<a class="btn btn-small btn-primary" id="child-modify-btn-A">
			<i class="icon-ok"></i>
			등록
		</a>
		<a class="btn btn-small" data-dismiss="modal">
			<i class="icon-remove"></i>
			취소
		</a>

	</div>
</form>
		
<!-- clid modify modal form B -->
<form id="child-modal-form-B" class="modal hide in" tabindex="-1" >
	<c:forEach var="childList" items="${childInfo}" varStatus="status" begin="1" end="1">
	<input type="hidden" name="child_idx" value="${ childList.IDX }">
	<input type="hidden" name="member_id" value="${ detail.MEMBER_ID }">
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
						<input type="text" name="child_name" id="form-field-username" value="${ childList.CHILD_NM }">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">성별</label>
					<div class="controls">
						<div class="row-fluid">
						<label class="span2">
							<input id="gender-m" name="gender" type="radio" value="남">
							<span class="lbl"> 남</span>
						</label>
						<label class="span2">
							<input id="gender-f" name="gender" type="radio" value="여">
							<span class="lbl"> 여</span>
						</label>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">썸네일</label>

					<div class="controls">
						<input readonly="readonly" type="text" id="img_path" name="img_path" value="${ childList.PHOTO }" />
						<input type="button" class="btn btn-primary thumbnail-mod-btn" value="썸네일 변경" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="form-field-username">생년월일</label>

					<div class="controls">
						<input name="birth_year" class="span3" type="text" id="" value="${ childList.BIRTH_YEAR }">년
						<input name="birth_month" class="span3" type="text" id="" value="${ childList.BIRTH_MONTH }">월
						<input name="birth_day" class="span3" type="text" id="" value="${ childList.BIRTH_DAY }">일
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>

	
	<div class="modal-footer">
		<a class="btn btn-small btn-primary" id="child-modify-btn-B">
			<i class="icon-ok"></i>
			등록
		</a>
		<a class="btn btn-small" data-dismiss="modal">
			<i class="icon-remove"></i>
			취소
		</a>

	</div>
</form>			
		
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
	//validate
	setValid();
	$("#child-modal-form-A").validate({
		rules: {
			child_name: {
				required: true
			},
			gender: {
				required: true
			},
			birth_year: {
				required: true
			},
			birth_month: {
				required: true
			},
			birth_day: {
				required: true
			}
		},
		messages: {
			child_name: {
				required: "이름을 입력해 주세요."
			},
			gender: {
				required: "성별을 선택해 주세요."
			},
			birth_year: {
				required: "생년을 입력해 주세요."
			},
			birth_month: {
				required: "월을 입력해 주세요."
			},
			birth_day: {
				required: "일을 입력해 주세요."
			}
		}
	});
	$("#child-modal-form-B").validate({
		rules: {
			child_name: {
				required: true
			},
			gender: {
				required: true
			},
			birth_year: {
				required: true
			},
			birth_month: {
				required: true
			},
			birth_day: {
				required: true
			}
		},
		messages: {
			child_name: {
				required: "이름을 입력해 주세요."
			},
			gender: {
				required: "성별을 선택해 주세요."
			},
			birth_year: {
				required: "생년을 입력해 주세요."
			},
			birth_month: {
				required: "월을 입력해 주세요."
			},
			birth_day: {
				required: "일을 입력해 주세요."
			}
		}
	});

	//side active
	$("#side-user").addClass("open active");
	
	//chlid modal put items
	$("#child-modal-btn-A").click(function(){
		$("[name=gender]").each(function(){
			var $this = $(this);
			if( $this.val() ==  $(".tdGender").eq(0).text() ) {
				$this.prop("checked", true);
			}
		});
	});
	$("#child-modal-btn-B").click(function(){
		$("[name=gender]").each(function(){
			var $this = $(this);
			if( $this.val() ==  $(".tdGender").eq(1).text() ) {
				$this.prop("checked", true);
			}
		});
	}); 
	
	 $("#child-modify-btn-A").click(function(){
		 $("#child-modal-form-A").attr({
			method: 'post',
			action: '${contextPath}/user/childModify.do'
		 }).submit();
	 });
	 $("#child-modify-btn-B").click(function(){
		 $("#child-modal-form-B").attr({
			method: 'post',
			action: '${contextPath}/user/childModify.do'
		 }).submit();
	 });
	
	$("#create-form input:text").attr({
		readonly: "readonly"
	});

	//child nav btn
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
	
	$(".thumbnail-mod-btn").click(function(){
		$("#thumbnail-modal-footer").hide();
		$("#thumbnail-modal").modal('toggle');
	}); // <!-- brand-mod-btn event end
	
	
}); // <!-- function() end 
</script>
