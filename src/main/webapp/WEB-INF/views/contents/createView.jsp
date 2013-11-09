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

		<form id="createForm" action="${ contextPath }/contents/create.do" class="form-horizontal" role="form" method="POST">
			<div class="row-fluid">
		
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
						<input type="text" id="src_path" name="movie_path" placeholder="" class="input-xxlarge" value="${ contentInfo.PREFIX_URL }${ contentInfo.SRC_PATH }">
						<a id="movie-mod-btn" class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">썸네일 파일</label>
					<div class="span9">
						<input type="text" id="img_path" name="img_path" placeholder="" class="input-xxlarge" value="${ contentInfo.PREFIX_URL }${ contentInfo.IMG_PATH }">
						<a id="thumbnail-mod-btn" class="btn">찾아보기</a>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">국가 선택</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ locationList }" var="obj">
									<input class="ace checkboxLocationList" type="checkbox" name="location" id="chk${ obj.CODE }" data-code="${ obj.CODE }" value="${ obj.CODE }">
									<span class="lbl"> ${ obj.CODE_DETAIL }</span>
								</c:forEach>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
			</div><!--/.row-fluid-->
		
			
			<div id="boxLOC001" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">한국(필수)</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id1" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn1" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn1" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="hidden" id="location_code" value="LOC001">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC001.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC001.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
		
			<div id="boxLOC002" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">미국</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id2" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn2" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn2" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="hidden" id="location_code" value="LOC002">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC002.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC002.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
		
			<div id="boxLOC003" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">중국</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id3" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn3" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn3" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC003.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC003.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
			
			
			<div id="boxLOC004" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">러시아</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id4" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn4" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn4" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC004.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC004.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
			
			
			<div id="boxLOC005" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">인도</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id5" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn5" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn5" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC005.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC005.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
			
			
			<div id="boxLOC006" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">사우디아라비아</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id6" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn6" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn6" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC006.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC006.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
			
			<div id="boxLOC007" >
				<hr />
				<div class="form-group row-fluid">
					<label class="span3 offset-9 control-label no-padding-right" for="form-field-1">일본</label>
				</div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">노출 카테고리</label>
					<div class="span9">
						<div class="checkbox-inline">
							<label>
								<c:forEach items="${ categoryList }" var="obj">
								    <input class="ace" name="category_id7" type="checkbox" value="${ obj.CATE_ID }">
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
								<input name="display_yn7" type="radio" class="ace" value="Y">
								<span class="lbl"> 노출함 </span>
								<input name="display_yn7" type="radio" class="ace" value="N" checked>
								<span class="lbl"> 노출안함 </span>
							</label>
						</div>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠명</label>
					<div class="span9">
						<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠명" class="input-xxlarge" value="${ detailMap.LOC007.CONTENTS_NM }">
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group row-fluid">
					<label class="span3 control-label no-padding-right" for="form-field-1">컨텐츠 설명</label>
					<div class="span9">
						<textarea rows="5" class="autosize-transition span12" id="contents_desc" name="contents_desc" >${ detailMap.LOC007.CONTENTS_DESC }</textarea>
					</div>
				</div>
			</div>
		</form>
		
		<div class="row-fluid text-center">
			<a id="createBtn" class="btn">등록</a>
			<a href="javascript:history.back(-1);" class="btn">뒤로가기</a>
		</div>
	</div><!--/.page-content-->
</div><!--/.main-content-->

<!--  movie modal -->			
<div id="movie-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="movie-upload.do" id="movie-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">동영상 업로드</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="movie-upload-input" name="file" />
		</div>
		<div id="movie-modal-footer" class="modal-footer">
			<button type="submit" id="movie-upload-submit" class="btn btn-sm btn-success">
				업로드 <i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
    <div id="upload-bar" class="progress">
        <div class="bar"></div >
        <div class="percent">0%</div >
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
		
		$('#movie-upload-input').ace_file_input({
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
			$("#movie-modal-footer").show();
		});
		
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
		
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		$('#movie-upload-form').ajaxForm(
				 {
					 beforeSend: function() {
							
					        status.empty();
					        var percentVal = '0%';
					        bar.width(percentVal);
					        percent.html(percentVal);
					    },
				    uploadProgress: function(event, position, total, percentComplete) {
				    	$("#upload-bar").show();
				        var percentVal = percentComplete + '%';
				        bar.width(percentVal);
				        percent.html(percentVal);
				    },
				    success: function(response){
				      $("#src_path").val(response);
				      $("#movie-modal").modal('toggle');
					}
				 }
		 );
		$('#thumbnail-upload-form').ajaxForm(
				 {
					    success: function(response){
					      $("#img_path").val(response);
					      $("#thumbnail-modal").modal('toggle');
						}
				 }
		 );
		
		$("#movie-mod-btn").click(function(){
			$("#movie-modal-footer").hide();
			$("#upload-bar").hide();
			$("#movie-modal").modal('toggle');
		}); // <!-- brand-mod-btn event end
		
		$("#thumbnail-mod-btn").click(function(){
			$("#thumbnail-modal-footer").hide();
			$("#thumbnail-modal").modal('toggle');
		}); // <!-- brand-mod-btn event end
		
		$("#createBtn").click(function(){
			if( confirm("등록하시겠습니까?") ) {
				$("#createForm").submit();
			}
		});
		
		
	}//event
	
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
	
	{//init
		
		$("#side-contents-contents").addClass("active");
		$("#side-contents").addClass("open active");
		
		$("input.checkboxLocationList").first().prop({"checked" : true});
		$("input.checkboxLocationList").each(function(){
			var $this = $(this);
			if( !!! $this.prop("checked")  ) {
				$("#box" + $this.data("code")).hide()
			}
		});
		
		$("#selectBrandBox").trigger("change");
		
	}//init
	
});
</script>