<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<li class="active">Event</li>
		</ul>
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">Event Information</h3>
			<!-- /. table-header -->

		<div class="row-fluid">
			<div class="span12 form-horizontal">
			
						<form id="create-form" method="get" class="form-horizontal" >
							<input type="hidden" name="member_id" value="${ login_session.MEMBER_ID }">
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
								<input type="hidden" name="board_contents_id" value="${ contentsList.CONTENTS_ID }">
							</c:if>
							
							<div class="control-group">
								<label class="control-label">Title</label>
								<div class="controls">
									<input type="text" name="title" value="${ contentsList.TITLE }" style="width:80%">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Event Date</label>
								<div class="controls">
    								<div class="span6">
										<div class="input-append">
											<input class="date-picker-1 input-medium" id="date-picker-first" name="event_start_dt" type="text" data-date-format="yyyy-mm-dd" value="${ contentsList.EVENT_START_DT }">
											<span class="add-on start_date">
												<i class="icon-calendar"></i>
											</span>
										</div>
										~
										<div class="input-append">
											<input class="date-picker-2 input-medium" id="date-picker-last" name="event_end_dt" type="text" data-date-format="yyyy-mm-dd" value="${ contentsList.EVENT_END_DT }">
											<span class="add-on end_date">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="span4">
								<label class="control-label">Status</label>
								<div class="controls">
									<select class="span12" name="status">
									  <option value="" >Select</option>
									  <option value="0" >Ready</option>
									  <option value="1" >Doing</option>
    								</select>
								</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-2">Banner</label>
								<div class="controls">
									<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${ contentsList.IMG_PATH }" />
									<input  type="button" class="btn btn-primary thumbnail-mod-btn" value="Searching.." />
								</div>
							</div>
							<div class="control-group" id="img-control-group">
								<label class="control-label" for="form-field-2">Image</label>
								<div class="controls">
									<img id="img-thumbnail-src" width="300" height="300">
									<a class="btn btn-app btn-danger btn-small" id="deleteImg">
										<i class="icon-trash bigger-200"></i>
										Delete
									</a>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Contents</label>
								<div class="controls">
									<textarea rows="5" cols="50" name="contents" style="width:80%;">${ contentsList.CONTENTS }</textarea>
								</div>
							</div>
							
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
							<div class="control-group">
								<label class="control-label">Winners</label>
								<div class="controls">
									<textarea rows="5" cols="50" name="sub_contents" style="width:80%;">${ contentsList.SUB_CONTENTS }</textarea>
								</div>
							</div>
							</c:if>
							
							<c:if test="${ contentsList.CONTENTS_ID ne null }">
							<div class="form-actions">
								<a class="btn btn-danger" id="delete-btn" disabled>
									<i class="icon-trash bigger-110"></i>
									Delete
								</a>
								<a class="btn btn-primary" id="modify-btn">
									<i class="icon-wrench bigger-110"></i>
									Save
								</a>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
									<i class="icon-undo bigger-110"></i>
									Cancel
								</a>
							</div>
							</c:if>
							
							<c:if test="${ contentsList.CONTENTS_ID eq null }">
							<div class="form-actions">
								<a class="btn btn-primary" id="create-btn">
									<i class="icon-wrench bigger-110"></i>
									Save
									</a>
								<a class="btn btn-inverse" id="cancel-btn" href="javascript:history.back();">
									<i class="icon-undo bigger-110"></i>
									Cancel
								</a>
							</div>
							</c:if>
						</form>
			</div>
		</div>
						
		</div>
	</div>
	
</div>
<!--  thumbnail modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="thumbnail-upload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">Image Upload</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="thumbnail-upload-input" name="file" />
		</div>
		<div id="thumbnail-modal-footer" class="modal-footer">
			<button type="submit" id="thumbnail-upload-submit" class="btn btn-sm btn-success">
				Upload
				<i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
</div>

<script type="text/javascript">

//validate
setValid();
$("#create-form").validate({
	rules: {
		title: {
			required: true
		},
		event_start_dt: {
			required: true
		},
		event_end_dt: {
			required: true
		},
		status: {
			required: true
		},
		contents: {
			required: true
		}
	},
	messages: {
		title: {
			required: "Please insert title."
		},
		event_start_dt: {
			required: "Check event date."
		},
		event_end_dt: {
			required: "Check event date."
		},
		status: {
			required: "Please select status."
		},
		contents: {
			required: "Please insert contents."
		}
	}
	
});
	//page init
	jQuery(function($){
		//side active
		$("#side-event").addClass("active");
		
		$('#date-picker-first').datepicker();
		$('span.start_date')
		.click(function(){
			$('#date-picker-first').datepicker("show");
		})
		.hover(function(){
			$(this).css("cursor", "pointer");
		});
		$('#date-picker-last').datepicker();
		$('span.end_date')
		.click(function(){
			$('#date-picker-last').datepicker("show");
		})
		.hover(function(){
			$(this).css("cursor", "pointer");
		});
	});
	$("[name=status]").val("${ contentsList.STATUS }");
	if("${ contentsList.CONTENTS_ID }" == ''){
		$("#img-control-group").attr({
			style : "display: none;"
		});
	}else {
		if('${ contentsList.IMG_PATH }' == ''){
			$("#img-control-group").attr({
				style : "display: none;"
			});
		}else {
			$("#img-thumbnail-src").attr({
				src : "${ httpPath }${ contentsList.IMG_PATH }"
			});
		}
	}
	
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
					      $("#img-thumbnail-src").attr({
					    	 src : "${ httpPath }" + (response)
					      });
					      $("#img-control-group").show();
					      $("#thumbnail-modal").modal('toggle');
						}
				 }
		 );
		
		$(".thumbnail-mod-btn").click(function(){
			$("#thumbnail-modal-footer").hide();
			$("#thumbnail-modal").modal('toggle');
		}); // <!-- brand-mod-btn event end
		
		
	}); // <!-- function() end 
	
	$("#deleteImg").click(function(){
		$("#img_path").val('');
		$("#img-thumbnail-src").attr({
			src : ''
		});
	    $("#img-control-group").attr({
	    	style : "display:none;"
	    });
	});

	$("#create-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/event/eventCreateContents.do'
		}).submit();
	});
	$("#modify-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/event/eventModifyContents.do'
		}).submit();
	});
	$("#delete-btn").click(function(){
		$("#create-form").attr({
			method: 'post',
			action: '${ contextPath }/event/eventDeleteContents.do'
		}).submit();
	});
</script>