<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


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
			<li>
				전시관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">컨텐츠 노출 관리</li>
		</ul><!--.breadcrumb-->

	</div>

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">컨텐츠 노출 관리</h3>
			<div class="table-header">
				노출 카테고리 선택 
				<select style="margin-bottom: 3px" id="categoryBox" name="category_id" data-parameter="${ parameter.category_id }">
					<option value="">전체</option>
					<c:forEach items="${ categories }" var="obj">
						<option value="${ obj.CATE_ID }">${ obj.name }</option>
					</c:forEach>
				</select>
			</div>
			<table  class="table table-striped table-bordered table-hover">
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
						<th>컨텐츠ID</th>
						<th>컨텐츠명</th>
						<th>시리즈</th>
						<th>출판사</th>
						<th>노출순서</th>
					</tr>
				</thead>			
				<tbody>
					<c:forEach items="${contents }" var="obj" varStatus="util">
					<tr>
						<td>
							<div class="checkbox">
								<label>
									<input name="cb" type="checkbox" class="ace" data-index="${ util.index }" data-contents-id="${ obj.CONTENTS_ID }" data-idx="${ obj.CONTENTS_DETAIL_IDX }">
									<span class="lbl"></span>
								</label>
							</div>
						</td>
						<td>${ obj.CONTENTS_ID }</td>
						<td>${ obj.CONTENTS_NM }</td>
						<td>${ obj.SERIES_NM }</td>
						<td>${ obj.BRAND_NM }</td>
						<td><input class="no-magin-bottom ordering-no" id="ordering-no-${ util.index }" type="text" value="${ obj.ORDERING_NO }"/></td>
					</tr>
					</c:forEach>
				</tbody>	
			</table>
			
			<div class="text-right">
				<button id="orderUpdateBtn" class="btn btn-sm btn-yellow">순서적용</button>
			</div>
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<form id="orderingUpdateForm" action="${ contextPath }/display/contents/orderingUpdate.do" method="POST">
	<input type="hidden" name="category_id" id="category_id" value="${ parameter.category_id }"/>
	<input type="hidden" name="contents_id" id="contents_id" />
	<input type="hidden" name="contents_detail_idx" id="detail_idx" />
	<input type="hidden" name="ordering_no" id="ordering_no"/>
</form>

<script>
$(function(){
	
	{//init

		//사이드바 활성화
		$("#side-display-contents").addClass("active");
		$("#side-display").addClass("open active");
		
	}//init
	
	{//event
		
		//노출 카테고리 이벤트
		var $categoryBox = $("#categoryBox");
		$categoryBox
			.find("option").each(function(){
				var $this = $(this);
				var cateId = $categoryBox.data("parameter");
				if( $this.val() == cateId ) {
					$this.prop("selected", true );
				}
			})
			.end()
			.change(function(){
				window.location.href = "${ contextPath }/display/contents/manageView.do?category_id=" + $categoryBox.val();
			});
		
		//체크박스 전체 선택/해제 이벤트
		$("input[name=cb_all]").click( function(){
			
			// false is default value 
			var isAllChecked = $( this ).val();
			
			var $checkboxArray = $("input[name='cb']");
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

		//순서적용 이벤트
		$("#orderUpdateBtn").click(function(){
			var $checkedList = $("input[name='cb']:checked"),
				totalCnt = $checkedList.size();
			
			if( totalCnt == 0 ) {
				alert("선택된 컨텐츠가 없습니다.");
				return false;
			}
			
			var contentsIdList = "",
				orderingNoList = "",
				detailIdxList = "";
			
			var isValidation = true;
			
			var seq = 1;
			$checkedList.each(function(){
				var $this = $(this);
				var $orderingNo = $("#ordering-no-" + $this.data("index") );
				
				if( isEmpty( $orderingNo.val()) ) {
					alert("노출순서를 입력해 주세요");
					$orderingNo.focus();
					isValidation = false;
					return false;
				}
				
				contentsIdList += $this.data("contentsId");
				detailIdxList += $this.data("idx");
				orderingNoList += $orderingNo.val();

				//not last
				if( seq++ != totalCnt ) {
					contentsIdList += "&";
					detailIdxList += "&";
					orderingNoList += "&";
				}
			});
			
			if( isValidation ) {
				
				$("#contents_id").val( contentsIdList );
				$("#detail_idx").val( detailIdxList );
				$("#ordering_no").val( orderingNoList );
				
				if( confirm("적용하시겠습니까?") ) {
					$("#orderingUpdateForm").submit();
				}
			}
			
		});
	}//event
	
});
</script>