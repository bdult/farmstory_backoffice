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
			<li>
				<a href="#">일반 회원 정보 상세</a>
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">
				일반 회원 정보 수정
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
					회원 정보수정
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
							<form id="create-form" class="form-horizontal" >

								<div class="control-group">
									<label class="control-label">아이디</label>
									<div class="controls">
										<input type="text" readonly="readonly" name="member_id" value="${detail.MEMBER_ID}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이름</label>
									<div class="controls">
										<input type="text" name="member_name" value="${detail.MEMBER_NM}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">이메일</label>
									<div class="controls">
										<input type="text" name="member_email" value="${detail.MEMBER_EMAIL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">휴대폰</label>
									<div class="controls">
										<input type="text" name="member_cel" value="${detail.MEMBER_CEL}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">주소</label>
									<div class="controls">
										<input type="text" name="member_zipno" readonly="readonly"/>&nbsp;&nbsp;
										<a class="btn btn-primary" href="#addr-modal-form" data-toggle="modal">우편번호 검색</a>
									</div>
									<div class="controls">
										<input type="text" name="member_addr_1" value="${detail.MEMBER_ADDR_1}"  readonly="readonly"/>&nbsp;&nbsp;
										<input type="text" name="member_addr_2" value="${detail.MEMBER_ADDR_2}" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">성별</label>
									<div class="controls">
										<input type="text" value="${detail.MEMBER_GENDER}" readonly="readonly"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">생년월일</label>
									<div class="controls">
										<input type="hidden" value="${detail.MEMBER_YEAR}" />
										<input type="hidden" value="${detail.MEMBER_MONTHL}" />
										<input type="hidden" value="${detail.MEMBER_DAY}" />
										<input type="text" value="${detail.MEMBER_YEAR}년 ${detail.MEMBER_MONTH}월 ${detail.MEMBER_DAY}일" readonly="readonly"/>
									</div>
								</div>
								
								<div class="form-actions">
									<a class="btn btn-primary" id="modify-btn">
										<i class="icon-wrench bigger-110"></i>
										수정
									</a>
									<a class="btn btn-inverse" id="cancel-btn">
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
	<!--/.page-content-->
<!--/.main-content-->

<!-- addr-modal -->
<form id="addr-modal-form" class="modal hide in" tabindex="-1" >
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h4 class="blue bigger">검색 정보를 입력해 주세요</h4>
	</div>

	<div class="modal-body overflow-visible">
		<div class="row-fluid">
			<div class="span12">
				<div class="control-group">
					<label class="control-label" for="form-field-username"></label>

					<div class="controls">
						도로명 : <input name="birth_year" class="span3" type="text" id="roadNo" style="margin: 0;">
						건물번호 : <input name="birth_month" class="span3" type="text" id="buildNo" style="margin: 0;">
						<a class="btn btn-small btn-primary" id="addr-modify-btn">
							<i class="icon-ok"></i>
							검색
						</a>
					</div>
				</div>
				<hr>
				<div class="control-group">
				</div>
				<div class="control-group">
					<div class="span12">
						<div class="widget-main padding-4">
							<div class="slim-scroll" data-height="270">
								<ul class="unstyled" id="addrList">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="row-fluid">
		</div>
	<div class="modal-footer">
		<a class="btn btn-small" data-dismiss="modal">
			<i class="icon-remove"></i>
			취소
		</a>

	</div>
</form>

<script type="text/javascript">

	//validate
	setValid();
	$("#create-form").validate({
		rules: {
			member_name: {
				required: true
			},
			member_cel: {
				required: true
			},
			member_email: {
				required: true
			},
			member_addr_1: {
				required: true
			},
			member_addr_2: {
				required: true
			}
		},
		messages: {
			member_name: {
				required: "이름을 입력해 주세요."
			},
			member_cel: {
				required: "휴대폰 번호를 입력해 주세요."
			},
			member_email: {
				required: "이메일 주소를 입력해 주세요."
			},
			member_addr_1: {
				required: "주소를 입력해 주세요."
			},
			member_addr_2: {
				required: "상세 주소를입력해 주세요."
			}
		}
	});

	//side active
	$("#side-user").addClass("active");
	
	$("#cancel-btn").click(function(){
		window.location.href="${ contextPath }/user/detail.do?member_id=${detail.MEMBER_ID}";
	});

	$("#modify-btn").click(function(){
		if(confirm("저장 하시겠습니까?")){
			$("#create-form").attr({
				method: 'post',
				action: '${ contextPath }/user/userModify.do'
			}).submit();
		}else{
			return false;
		}
	});

	function xmlLoader(){
		var roadNo = encodeURI($("#roadNo").val()) + encodeURI(" ")
		var buildNo = encodeURI($("#buildNo").val())
		console.info(roadNo + buildNo);
		
		var comp = roadNo + buildNo;
		
		$.ajax({
		    url: 'http://openapi.epost.go.kr/postal/retrieveNewAdressService/retrieveNewAdressService/getNewAddressList?searchSe=road&srchwrd=' + comp + '&ServiceKey=Cjso/MVtBKmmlaTCL5JlbdPozTRBWknR42ujuuEnun8zRtISeezAPK3UIBxus6a9Z0IqBAjS7J7Hlwgb7dcrtQ==&encoding=UTF-8',
		    dataType: "xml",
		    type: 'GET',
		    success: function(res) {
				var xml = res.responseText;
				var $xml = $(xml);

					$("#addrList li").remove();
					$xml.find("newAddressList").each(function(index){
						var $this = $(this);
						var zipno = $this.find("zipNo").text();
						var lnmadres = $this.find("lnmadres").text();
						$("#addrList").append(
							"<li>" + lnmadres + "<a data-zipNo='" + zipno + "' data-lnmadres='" + lnmadres + "' class='btn btn-default addrSelect'>" + "선택" + "</a>" + "</li>" 
						);
					});
					$("a.addrSelect").click(function(){
						var $this = $(this);

						$("input[name='member_zipno']").val($this.data("zipno"));
						$("input[name='member_addr_1']").val($this.data("lnmadres"));
					});
			}
		});
	}

	
	$("#addr-modify-btn").click(function(){
		xmlLoader();
	});
	

	$(function() {
	
		// scrollables
		$('.slim-scroll').each(function () {
			var $this = $(this);
			$this.slimScroll({
				height: $this.data('height') || 100,
				railVisible:true
			});
		});
	
	});


</script>
<style>
	
	#addrList > li {
		list-style: none;
	    display: inline-block;
	    width: 100%;
	    margin: 5px 0px 5px 0px;
		vertical-align: middle;
		font-size: 15px;
	}
	
	#addrList > li > a{
		float: right;
	}
</style>
