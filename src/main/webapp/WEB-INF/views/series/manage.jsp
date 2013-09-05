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
						<li >컨텐츠 관리
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">시리즈 관리</li>
					</ul>
				</div><!--/ .breadcrumb-->
				
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							시리즈 관리
							<small>
								<i class="icon-double-angle-right"></i>
								시리즈  생성, 수정, 삭제를 할 수 있습니다.
							</small>
						</h1>
					</div>
					<!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="row-fluid">
								<div class="widget-box span6">
									<div class="widget-header header-color-blue2">
										<h4 class="lighter smaller">Choose Series</h4>
									<button id="create-series-btn" class="btn btn-info">시리즈 생성</button>
									</div>

									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="series-tree" class="tree" ></div>
										</div>
									</div>
								</div>
								
								<div class="widget-box span6">
									<div class="widget-header header-color-green2">
										<h4 class="lighter smaller">Series Infomation</h4>
									</div>
							
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="series-info" >
												<form action="modify.do" class="form-horizontal" method="post">
														<input type="hidden" id="series-id" name="series_id">
														<div class="control-group">
															<label class="control-label">시리즈 명</label>
															<div class="controls">
																<input id="series-name" name="series_nm" type="text">															
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">시리즈 레벨</label>
															<div class="controls">
																<input id="series-level" name="series_level" type="text">															
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">상위 시리즈 명</label>
															<div class="controls">
																<input id="parent-series-id" name="parent_series_id" type="hidden">
																<input id="parent-series-name" name="parent_series_nm" type="text" readonly>
																<button id="modify-parent-series-btn" class="btn btn-info" type="button"> 상위 시리즈 변경</button>
															</div>
														</div>
														<div class="form-actions">
															<button class="btn btn-info" type="submit"> 수정완료</button>
															<button id="delete-series-btn" class="btn" type="button"> 삭제</button>
														</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>

							<script type="text/javascript">
								var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
							</script>

							<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
			
<!-- delete form -->
<form id="delete-series-form" action="${contextPath }/series/delete.do"method="post">
	<input id="delete-series-id" type="hidden" name="series_id">
</form>

<!--  create modal -->			
<div id="creat-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="${contextPath }/series/create.do" class="form-horizontal" method="post">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">시리즈 등록</h3>
		</div>
		<div class="modal-body ">
			<div class="control-group">
				<label class="control-label">시리즈 명</label>
				<div class="controls">
					<input id="create-modal-series-name" name="series_nm" type="text">															
				</div>
			</div>
			<div  class="control-group">
				<label class="control-label">상위 시리즈 명</label>
				<div class="controls">
					<input  id="modal-parent-series-name" name="parent_series_nm" type="text">					
					<button id="parent-cate-search" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div id="parent-series-list" class="control-group">
				<label class="control-label">상위 시리즈 리스트</label>
				<div class="controls">
					<select id="parent-series-select" name="parent_cate_id">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">등록취소</button>
			<button type="submit" class="btn btn-primary">등록하기</button>
		</div>
	</form>
</div>
		
<!--  parent series modify modal -->			
<div id="modify-parent-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">상위 시리즈 변경</h3>
		</div>
		<div class="modal-body">
			<div  class="control-group row-fluid">
				<label class="control-label ">상위 시리즈 명</label>
				<div class="controls">
					<input  id="modify-parent-series-name" name="parent_series_nm" type="text">					
					<button id="modify-parent-series-search-btn" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div id="parent-series-list" class="control-group">
				<label class="control-label">상위 시리즈 리스트</label>
				<div class="controls">
					<select id="modify-parent-series-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-parent-series-submit-btn" type="button" class="btn btn-primary">등록</button>
		</div>
</div>		


		<!--page specific plugin scripts-->
		<script src="${ rootPath }/assets/js/fuelux/fuelux.tree.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
				$(function() {
					
					// infomation layout hide
					$("#series-info").hide();
					$("#parent-series-list").hide();
					
					$("#create-series-btn").click(function(){
						$("#parent-series-select").empty();
						$("#parent-series-list").hide();
						$("#modal-series-level").val('');
						$("#modal-series-name").val('');
						$("#modal-parent-series-name").val('');
						$("#creat-series-modal").modal('toggle');
					});
					
					// modify-parent-series in series information
					$("#modify-parent-series-btn").click(function(){
						$("#modify-parent-series-name").val('');
						$("#modify-parent-series-select").empty();
						$("#modify-parent-series-list").hide();
						$("#modify-parent-series-modal").modal('toggle');
						
					}); // modify-parent-series-modal end
					
					$("#modify-parent-series-submit-btn").click(function(){
						$("#parent-series-name").val($("#modify-parent-series-select option:selected").text());
						$("#parent-series-id").val($("#modify-parent-series-select option:selected").val());
						$("#modify-parent-series-modal").modal('toggle');
					});
					
					
					$("#delete-series-btn").click(function(){
						$("#delete-series-id").val($("#series-id").val());
						$("#delete-series-form").submit();
					}); // delete-series end
					
					$("#modify-parent-series-search-btn").click(function(){
						$("#modify-parent-series-select").empty();
						param = {
							search_name : $("#modify-parent-series-name").val()
						};
						
						$.ajax({
							url: "parentSeriesList.ajax",
							data: param,
							type: 'POST',
							dataType: 'json',
							success : function(response) {
								if(response.data.length == 0){
									alert("검색된 시리즈가 없습니다.");
									return false;
								}else{
									$("#modify-parent-series-list").show();
									$.each(response.data, function(index, series){
										displaySeriesName="";
										if(series.SERIES_LEVEL === 1){
											displaySeriesName = series.CONTENTS_SERIES_NM+"("+series.SERIES_LEVEL+"레벨"+")";
										}else{
											displaySeriesName = series.PARENT_NM+" >> "+series.CONTENTS_SERIES_NM+"("+series.SERIES_LEVEL+"레벨 "+")";
										}
										$("#modify-parent-series-select").append("<option value=\""+series.CONTENTS_SERIES_ID+"\">"+displaySeriesName+"</option>")
									});
								}
							},
							error: function(xhr, status, error) {
								console.log("error="+error);
							}
						}); // ajax end
					}); // create-parent-series-search end
					
					
					// series Tree layout
					var DataSourceTree = function(options) {
						this.url = options.url;
					}
					
					DataSourceTree.prototype.data = function(options, callback) {
						var self = this;
						var $data = null;
						
						var param = null
						if(options.CONTENTS_SERIES_ID){
							param = options.CONTENTS_SERIES_ID; //load the first level data
						}else{
							param=0;
						}

						$.ajax({
							url: this.url,
							data: 'id='+param,
							type: 'POST',
							dataType: 'json',
							success : function(response) {
								callback({ data: response.data })
							},
							error: function(xhr, status, error) {
								alert(error);
							}
						});
					}
				
				$('#series-tree').ace_tree({
					dataSource: new DataSourceTree({url: 'list.ajax'}),
					//multiSelect:true,
					loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
					'open-icon' : 'icon-minus',
					'close-icon' : 'icon-plus',
					'selectable' : true,
					'selected-icon' : 'icon-ok',
					'unselected-icon' : 'icon-remove'
				});
		
				 $('#series-tree').on('loaded', function (evt, data) {
					console.log("load");
				}); 
		
				$('#series-tree').on('opened', function (evt, data) {
					console.log(data);
					seriesInfoSet(data);
					
				});
		
				$('#series-tree').on('closed', function (evt, data) {
					cleanSelected();
					seriesInfoSet(data);
					
				});
		
				$('#series-tree').on('selected', function (evt, data) {
					selectedIdx = data.info.length -1;
					seriesInfo = data.info[selectedIdx];
					
					$(".tree-item-name").each(function(){
						if($(this).text() === seriesInfo.name ){
							console.log("selected cate-name:"+$(this).text());
						}else{
							$(this).parent().attr("class", "tree-item")
							$(this).parent().children(".icon-ok").attr("class", "icon-remove")
						}
					});
					seriesInfoSet(seriesInfo);
				});
			});

			function seriesInfoSet(data){
				$("#series-info").show();
				$("#series-name").val(data.name);
				$("#series-level").val(data.SERIES_LEVEL);
				$("#series-id").val(data.CONTENTS_SERIES_ID);
				$("#parent-series-name").val(data.PARENT_NM);
				$("#parent-series-id").val(data.PARENT_SERIES_ID);
			}// series information set end
				
			function cleanSelected(){
				$(".tree-item-name").each(function(){
					$(this).parent().attr("class", "tree-item")
					$(this).parent().children(".icon-ok").attr("class", "icon-remove")
				});
			}
		</script>		