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
			<form class="form-horizontal" role="form">
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span3">
						<input type="text" id="nm" placeholder="컨텐츠명" class="">
					</div>
					<label class="span3 control-label no-padding-right" for="form-field-1">카테고리</label>
					<div class="span3">
						<select name="" class="span12">
							<option value="">선택</option>
						</select>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">출판사 선택</label>
					<div class="span3">
						<select name="" class="span12">
							<option value="">선택</option>
						</select>
					</div>
					<label class="span3 control-label no-padding-right" for="form-field-1">시리즈 선택</label>
					<div class="span3">
						<select name="" class="span12">
							<option value="">선택</option>
						</select>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">동영상 파일</label>
					<div class="span9">
						<input type="text" id="" placeholder="" class="">
						<a class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">썸네일 파일</label>
					<div class="span9">
						<input type="text" id="" placeholder="" class="">
						<a class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">국가 선택</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<input class="ace" type="checkbox" id="chkKR">
								<span class="lbl"> 한국</span>
								<input class="ace" type="checkbox" id="chkUS">
								<span class="lbl"> 미국</span>
								<input class="ace" type="checkbox" id="chkRU">
								<span class="lbl"> 러시아</span>
								<!-- 
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 중국</span>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 독일</span>
								 -->
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
			</form>
		</div><!--/.row-fluid-->
		
		<div id="boxKR" style="display: none">
			<hr />
			<form action="" class="form-horizontal">
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">한국</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 한글</span>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 영어</span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 여부</label>
					<div class="span9">
						<div class="radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
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
						<input type="text" id="nm" placeholder="컨텐츠명" class="">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" ></textarea>
					</div>
				</div>
				<div class="space-4"></div>
			</form>
		</div>
		
		<div id="boxUS" style="display: none">
			<hr />
			<form action="" class="form-horizontal">
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">영어</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 한글</span>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 영어</span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 여부</label>
					<div class="span9">
						<div class="radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
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
						<input type="text" id="nm" placeholder="컨텐츠명" class="">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" ></textarea>
					</div>
				</div>
				<div class="space-4"></div>
			</form>
		</div>
		
		<div id="boxRU" style="display: none">
			<hr />
			<form action="" class="form-horizontal">
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">러시아</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 한글</span>
								<input class="ace" type="checkbox" id="noLink">
								<span class="lbl"> 영어</span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 여부</label>
					<div class="span9">
						<div class="radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
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
						<input type="text" id="nm" placeholder="컨텐츠명" class="">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" ></textarea>
					</div>
				</div>
				<div class="space-4"></div>
			</form>
		</div>
		
		<div class="row-fluid text-center">
			<a class="btn">컨텐츠 등록</a>
		</div>
	</div><!--/.page-content-->
</div><!--/.main-content-->
			
<script>
$(function(){
	
	{//init
		
		$("#side-contents-contents").addClass("active");
		$("#side-contents").addClass("open active");
		
	}//init
	
	{//event
		
		$("#chkKR").click(function(){
			var $this = $(this);
			var $boxKR = $("#boxKR");
			if( $this.prop("checked") ) {
				$boxKR.show();
			} else {
				$boxKR.hide();
			}
		});
		
		$("#chkUS").click(function(){
			var $this = $(this);
			var $boxUS = $("#boxUS");
			if( $this.prop("checked") ) {
				$boxUS.show();
			} else {
				$boxUS.hide();
			}
		});
		
		$("#chkRU").click(function(){
			var $this = $(this);
			var $boxRU = $("#boxRU");
			if( $this.prop("checked") ) {
				$boxRU.show();
			} else {
				$boxRU.hide();
			}
		});
		
	}//event
});
</script>