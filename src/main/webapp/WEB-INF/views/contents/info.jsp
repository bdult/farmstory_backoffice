<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="${contextPath }/">Home</a>
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li>
				컨텐츠 관리
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li>
				컨텐츠
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">상세</li>
		</ul><!--.breadcrumb-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>컨텐츠 상세<small><i class="icon-double-angle-right"></i> 컨텐츠에 대한 상세한 정보를 입력한다</small></h1>
		</div><!--/.page-header-->

		<div class="row-fluid">
		
			<div>${ contentInfo }</div>
			<div>${ detailList }</div>
		
			<form class="form-horizontal" role="form">
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">출판사 선택</label>
					<div class="span3">
						<select id="selectBrandBox" name="brand_id" class="span12">
							<c:forEach items="${ brandList }" var="obj">
								<option value="${ obj.BRAND_ID }">${ obj.BRAND_NM }</option>
							</c:forEach>
						</select>
					</div>
					<label class="span3 control-label no-padding-right" for="form-field-1">시리즈 선택</label>
					<div class="span3">
						<select id="selectSeriesBox" name="series_id" class="span12">
						</select>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">동영상 파일</label>
					<div class="span9">
						<input type="text" id="" placeholder="" class="input-xxlarge" value="${ contentInfo.PREFIX_URL }${ contentInfo.SRC_PATH }">
						<a class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">썸네일 파일</label>
					<div class="span9">
						<input type="text" id="" placeholder="" class="input-xxlarge" value="${ contentInfo.PREFIX_URL }${ contentInfo.IMG_PATH }">
						<a class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">국가 선택</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ locationList }" var="obj">
									<input class="ace checkboxLocationList" type="checkbox" id="chk${ obj.CODE }">
									<span class="lbl"> ${ obj.CODE_DETAIL }</span>
								</c:forEach>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
			</form>
		</div><!--/.row-fluid-->
		
		<c:forEach items="${ locationList }" var="obj">
			
			<c:forEach items="${ detailList }" var="detail">
				<c:if test="${ obj.CODE eq detail.LOCATION_CODE }">
					<c:set var="item" value="${ detail }"></c:set>
				</c:if>
			</c:forEach>
			<div id="box${ obj.CODE }" style="display: none">
				<hr />
				<form action="" class="form-horizontal">
					<div class="form-group row-fluid">
						<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">${ obj.CODE_DETAIL }</label>
					</div>
					<div class="form-group row-fluid">
						<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
						<div class="span9">
							<div class="checkbox-inline">
								<label>
									<c:forEach items="${ categoryList }" var="obj">
										<input 
										<c:if test="${ obj.name eq item }"></c:if>
										class="ace" name="category_id" type="checkbox" value="${ obj.CATE_ID }">
										<span class="lbl"> ${ obj.name }</span>
									</c:forEach>
								</label>
							</div>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group row-fluid">
						<label class="span3 control-label no-padding-right" for="form-field-1">노출 여부</label>
						<div class="span9">
							<div class="radio-inline">
								<label>
									<input name="display_yn" type="radio" class="ace" value="Y">
									<span class="lbl"> 노출함 </span>
									<input name="display_yn" type="radio" class="ace" value="N" checked>
									<span class="lbl"> 노출안함 </span>
								</label>
							</div>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group row-fluid">
						<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
						<div class="span9">
							<input type="text" id="nm" placeholder="컨텐츠명" class="" value="${ item.CONTENTS_NM }">
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group row-fluid">
						<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
						<div class="span9">
							<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ item.CONTENTS_DESC }</textarea>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
		
		<div class="row-fluid text-center">
			<a id="updateBtn" class="btn">수정</a>
			<a href="javascript:history.back(-1);" class="btn">뒤로가기</a>
		</div>
	</div><!--/.page-content-->
</div><!--/.main-content-->
			
<script>
$(function(){
	
	{//event
		
		$("#selectBrandBox").change(function(){
			var $this = $(this);
			
			//기존 시리즈 셀렉트 전체 제외하고 삭제
			$("#selectSeriesBox").find("option").remove();
			
			$.getJSON("${ contextPath }/series/list.ajax", { brand_id : $this.val() })
				.done(function(json) {
					if( json.status == 200 && json.data.length > 0) {
						$.each( json.data, function( idx, item ){
							$("#selectSeriesBox").append("<option value='" + item.CONTENTS_SERIES_ID + "'>" + item.CONTENTS_SERIES_NM + "</option>");
						});
					}
					
				}).fail(function(jqxhr, textStatus, error) {
					var err = textStatus + ", " + error;
					console.log("Request Failed: " + err);
				});
			
		});
		
		if( "${ contentInfo.BRAND_ID }" != "" ) {
			$("#selectBrandBox").trigger("change");
		}
		
		//한국
		$("#chkLOC001").click(function() {
			locationToggle( $(this), $("#boxLOC001") );
		});
		
		//미국
		$("#chkLOC002").click(function() {
			locationToggle( $(this), $("#boxLOC002") );
		});
		
		//중국
		$("#chkLOC003").click(function() {
			locationToggle( $(this), $("#boxLOC003") );
		});
		
		//러시아
		$("#chkLOC004").click(function() {
			locationToggle( $(this), $("#boxLOC004") );
		});
		
		//인도
		$("#chkLOC005").click(function() {
			locationToggle( $(this), $("#boxLOC005") );
		});
		
		//사우디아라비아
		$("#chkLOC006").click(function() {
			locationToggle( $(this), $("#boxLOC006") );
		});
		
		//일본
		$("#chkLOC007").click(function() {
			locationToggle( $(this), $("#boxLOC007") );
		});
		
	}//event
	
	{//init
		
		$("#side-contents-contents").addClass("active");
		$("#side-contents").addClass("open active");
		
		$(".checkboxLocationList").each(function(){
			var $this = $(this);
			console.info( $this.attr("id") );
			
			console.info( "${ contentsDetailList }" );
		});
		
	}//init
	
	{//function
		
		//param체크박스 여부에 따라 target show/hide
		var locationToggle = function( param, target ) {
			if (param.prop("checked")) {
				target.show();
			} else {
				target.hide();
			}
		};

	}//function
	
});
</script>