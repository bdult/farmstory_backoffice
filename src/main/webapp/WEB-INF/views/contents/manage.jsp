<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<style>
.mg-bt-20 {
	margin-bottom: 20px;
}

.datepicker {
	z-index: 7777 !important;
}
</style>			

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
			<li>컨텐츠 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">컨텐츠</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" id="search-input" autocomplete="off" value="${ search }" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">컨텐츠 관리</h3>
			
			<!-- search -->
			<form action="" id="searchForm" class="form-horizontal well">
				<div class="row-fluid mg-bt-20">
					<div class="span2 text-right">컨텐츠검색</div>
					<div class="span2">
						<select name="search_type" class="span12">
							<option value="name">컨텐츠명</option>
							<option value="id">아이디</option>
						</select>
					</div>
					<div class="span8">
						<input class="input-xxlarge" name="search" type="text" value="${ pageInfo.search }" placeholder="검색어를 입력하세요">
					</div>
				</div>
				<div class="row-fluid mg-bt-20">
					<div class="span2 text-right">카테고리</div>
					<div class="span2">
						<select id="selectCategoryBox" name="category_id" class="span12">
							<option value="">전체</option>
							<c:forEach items="${ categoryList }" var="obj">
								<option <c:if test="${ obj.CATE_ID eq pageInfo.category_id }">selected</c:if> value="${ obj.CATE_ID }">${ obj.name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="span1 text-right">출판사</div>
					<div class="span2">
						<select id="selectBrandBox" name="brand_id" class="span12">
							<option value="">전체</option>
							<c:forEach items="${ brandList }" var="obj">
								<option <c:if test="${ obj.BRAND_ID eq pageInfo.brand_id }">selected</c:if> value="${ obj.BRAND_ID }" >${ obj.BRAND_NM }</option>
							</c:forEach>
						</select>
					</div>
					<div class="span1 text-right">시리즈</div>
					<div class="span2">
						<select id="selectSeriesBox" name="series_id" class="span12">
							<option value="">전체</option>
						</select>
					</div>
				</div>
				<div class="row-fluid mg-bt-20">
					<div class="span2 text-right">등록일자</div>
					<div class="span5">
						<div class="input-append ">
							<input class="span10" name="search_start_date" id="start_date" type="text" data-date-format="yyyy-mm-dd" value="${ pageInfo.search_start_date }"> 
							<span class="add-on start_date"><i class="icon-calendar"></i></span>
						</div>
						~
						<div class="input-append">
							<input class="span10" name="search_end_date" id="end_date" type="text" data-date-format="yyyy-mm-dd" value="${ pageInfo.search_end_date }"> 
							<span class="add-on end_date"><i class="icon-calendar"></i></span>
						</div>
					</div>
					<div class="span1 text-right">국가</div>
					<div class="span2">
						<select name="member_role" class="span12">
							<option value="">전체</option>
						</select>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span2 text-right">노출여부</div>
					<div class="span3">
						<div id="displayBox" class="radio-inline" data-display-yn="${ pageInfo.display_yn }">
							<label class="inline">
								<input name="display_yn" type="radio" class="ace" value="" checked>
								<span class="lbl"> 전체 </span>
							</label>
							<label class="inline">
								<input name="display_yn" type="radio" class="ace" value="Y" >
								<span class="lbl"> 노출 </span>
							</label>
							<label class="inline">
								<input name="display_yn" type="radio" class="ace" value="N">
								<span class="lbl"> 비노출 </span>
							</label>
						</div>
					</div>
					<div class="span7 text-right">
						<a class="btn btn-info input-small" id="searchBtn">검색</a>
					</div>
				</div>
			</form>
			
			<div class="table-header" align="right">
				<button id="create-contents-btn" class="btn btn-success">등록</button>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>
							<div class="checkbox">
								<label>
									<input name="cb_all" type="checkbox" class="ace" value="false">
									<span class="lbl"></span>
								</label>
							</div>
						</th>
						<th>컨텐츠 ID</th>
						<th>컨텐츠명</th>
						<th>시리즈</th>
						<th>출판사</th>
						<th>노출여부</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="obj" items="${ list }" varStatus="util">
					<tr>
						<td>
							<div class="checkbox">
								<label>
									<input name="cb" type="checkbox" class="ace" data-contents-id="${ obj.CONTENTS_ID }">
									<span class="lbl"></span>
								</label>
							</div>
						</td>
						<td>
							<a href="${ contextPath }/contents/detail.do?pageNum=${ pageInfo.pageNum }&contents_id=${ obj.CONTENTS_ID }">${ obj.CONTENTS_ID }</a>
						</td>
						<td>
							
							<a href="${ contextPath }/contents/detail.do?pageNum=${ pageInfo.pageNum }&contents_id=${ obj.CONTENTS_ID }">${ obj.CONTENTS_NM }</a>
						</td>
						<td>${ obj.CONTENTS_SERIES_NM }</td>											
						<td>${ obj.BRAND_NM }</td>
						<td>${ obj.DISPLAY_YN }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
		
		<div class="row-fluid">
				<div class="span2 pagination">
					<div class="dataTables_info">Total ${ pageInfo.totalCount } entries</div>
				</div>
				<div class="span8 text-center">
					<div class="paging_bootstrap pagination">
						<ul>
							<c:choose>
								<c:when test="${ pageInfo.blockPage == 1}">
									<li class="prev disabled"><a href="#null" ><i class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="prev"><a href="manage.do?blockPage=${ pageInfo.preBlockPage}&search=${ page.search}&search_type=${ pageInfo.search_type }&category_id=${ pageInfo.category_id }&brand_id=${ pageInfo.brand_id }&series_id=${ pageInfo.series_id }&search_start_date=${ pageInfo.search_start_date }&search_end_date=${ pageInfo.search_end_date }&display_yn=${ pageInfo.display_yn }"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${ pageList }" var="page">
								<c:choose>
									<c:when test="${ pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="manage.do?pageNum=${ page.pageNum}&blockPage=${ pageInfo.blockPage}&search=${ pageInfo.search}&search_type=${ pageInfo.search_type }&category_id=${ pageInfo.category_id }&brand_id=${ pageInfo.brand_id }&series_id=${ pageInfo.series_id }&search_start_date=${ pageInfo.search_start_date }&search_end_date=${ pageInfo.search_end_date }&display_yn=${ pageInfo.display_yn }">${ page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="manage.do?pageNum=${ page.pageNum}&blockPage=${ pageInfo.blockPage}&search=${ pageInfo.search}&search_type=${ pageInfo.search_type }&category_id=${ pageInfo.category_id }&brand_id=${ pageInfo.brand_id }&series_id=${ pageInfo.series_id }&search_start_date=${ pageInfo.search_start_date }&search_end_date=${ pageInfo.search_end_date }&display_yn=${ pageInfo.display_yn }">${ page.pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${ pageInfo.blockPage == pageInfo.totalBlockPage}">
									<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="next"><a href="manage.do?blockPage=${ pageInfo.nextBlockPage}&search=${ pageInfo.search}&search_type=${ pageInfo.search_type }&category_id=${ pageInfo.category_id }&brand_id=${ pageInfo.brand_id }&series_id=${ pageInfo.series_id }&search_start_date=${ pageInfo.search_start_date }&search_end_date=${ pageInfo.search_end_date }&display_yn=${ pageInfo.display_yn }"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<div class="span2 pagination text-right">
					<button id="deleteBtn" class="btn">선택삭제</button>
				</div>
			</div><!--  page-link -->
		
	</div><!--/ .page-content-->
</div><!--/ .main-content-->

<!-- delete form -->
<form id="deleteForm" action="${ contextPath }/contents/delete.do" method="POST">
	<!-- content_id array here -->
</form>

<script>
$(function(){
	
	{//init
		
		$("#side-contents-contents").addClass("active");
		$("#side-contents").addClass("open active");
		
		//검색 시작일 초기화
		$('#start_date').datepicker();
		$('span.start_date')
			.click(function(){
				$('#start_date').datepicker("show");
			})
			.hover(function(){
				$(this).css("cursor", "pointer");
			});

		//검색 종료일 초기화
		$('#end_date').datepicker();
		$('span.end_date')
			.click(function(){
				$('#end_date').datepicker("show");
			})
			.hover(function(){
				$(this).css("cursor", "pointer");
			});
		
		var $displayBox = $("#displayBox");
		var displayYn = $displayBox.data("displayYn");
		$displayBox.find(":radio").each(function(){
			var $this = $(this);
			if( $this.val() == displayYn ) {
				$this.prop("checked", true);
			}
		});
		
	}//init
	
	{//event

		$("#selectBrandBox").change(function(){
			var $this = $(this);
			
			//기존 시리즈 셀렉트 전체 제외하고 삭제
			$("#selectSeriesBox").find("option:not(:first)").remove();
			
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
		
		if( "${ pageInfo.brand_id }" != "" ) {
			$("#selectBrandBox").trigger("change");
		}
		
		$("#create-contents-btn").click(function(){
			location.href="${ contextPath }/contents/createView.do";
		});
		
		$("#searchBtn").click(function(){
			$("#searchForm").submit();
		});
	
		$("#deleteBtn").click(function(){
			if( confirm("선택한 컨텐츠를 삭제하시겠습니까?") ) {
				var $checkedArr = $("input[name='cb']:checked");
				var $targetForm = $("#deleteForm");
				$checkedArr.each(function(){
					var $this = $(this);
					$targetForm.append("<input type='text' name='contents_id' value='" + $this.data("contentsId") + "' />");
				});
				$("#deleteForm").submit();
			}
			
			
		});
		
		//체크박스 전체 선택/해제 이벤트
		$("input[name=cb_all]").click( function(){
			
			// false is default value 
			var isAllChecked = $( this ).val();
			
			var $checkboxArray = $("input[name='cb']");
			console.info( $checkboxArray );
			if( isAllChecked == "true" ) {
				$( this ).val( "false" );
				$.each( $checkboxArray, function(){
					$checkboxArray.prop("checked", false);
				});
			} else {
				$( this ).val( "true" );
				$.each( $checkboxArray, function(){
					$checkboxArray.prop("checked", true);
				});
			}
			
		});
		
	}//event
});
</script>