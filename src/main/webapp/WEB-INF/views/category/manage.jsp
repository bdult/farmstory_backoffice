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
						<li class="active">카테고리 관리</li>
					</ul><!--.breadcrumb-->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							카테고리 관리
							<small>
								<i class="icon-double-angle-right"></i>
								카테고리 생성, 수정, 삭제를 할 수 있습니다.
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
										<h4 class="lighter smaller">Choose Categories</h4>
									<button id="create-category-btn" class="btn btn-info">카테고리 생성</button>
									</div>

									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="cate-tree" class="tree" ></div>
										</div>
									</div>
								</div>
								
								<div class="widget-box span6">
									<div class="widget-header header-color-green2">
										<h4 class="lighter smaller">Category Infomation</h4>
									</div>
							
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="category-info" >
												<form action="${contextPath }/category/modify.do" class="form-horizontal" method="post">
														<input type="hidden" id="category-id" name="cate_id">
														<input type="hidden" id="origin-category-ordering-no" name="origin-category-ordering-no" >		
														<div class="control-group">
															<label class="control-label">카테고리 명</label>
															<div class="controls">
																<input id="category-name" name="cate_nm" type="text">															
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">카테고리 순서</label>
															<div class="controls">
																<input id="category-ordering-no" name="category-ordering-no" type="text">															
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">카테고리 레벨</label>
															<div class="controls">
																<input id="category-level" name="cate_level" type="text">															
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">상위 카테고리 명</label>
															<div class="controls">
																<input id="parent-category-name" name="parent_cate_nm" type="text">
															</div>
														</div>
														<div class="form-actions">
															<button class="btn btn-info" type="submit"> 수정</button>
															<button id="delete-category-btn" class="btn" type="button"> 삭제</button>
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
<form id="delete-category-form" action="${contextPath }/category/delete.do"method="post">
	<input id="delete-cate-id" type="hidden" name="cate_id">
</form>

<!--  create modal -->			
<div id="creat-category-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="${contextPath }/category/create.do" class="form-horizontal" method="post">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">카테고리 등록</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label">카테고리 명</label>
				<div class="controls">
					<input id="modal-category-name" name="cate_nm" type="text">															
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">카테고리 레벨 </label>
				<div class="controls">
					<input  id="modal-category-level" name="cate_level" type="text">															
				</div>
			</div>
			<div  class="control-group">
				<label class="control-label">상위 카테고리 명</label>
				<div class="controls">
					<input  id="modal-parent-category-name" name="parent_cate_nm" type="text">					
					<button id="parent-cate-search" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div id="parent-category-list" class="control-group">
				<label class="control-label">상위 카테고리 리스트</label>
				<div class="controls">
					<select id="parent-category-select" name="parent_cate_id">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-series-close" data-dismiss="modal" aria-hidden="true">등록취소</button>
			<button type="submit" class="btn btn-primary">등록하기</button>
		</div>
	</form>
</div>		


		<!--page specific plugin scripts-->
		<script src="${ rootPath }/assets/js/fuelux/fuelux.tree.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
				$(function() {
					// infomation layout hide
					$("#category-info").hide();
					$("#parent-category-list").hide();
					
					
					$("#create-category-btn").click(function(){
						$("#parent-category-select").empty();
						$("#parent-category-list").hide();
						$("#modal-category-level").val('');
						$("#modal-category-name").val('');
						$("#modal-parent-category-name").val('');
						$("#creat-category-modal").modal('toggle');
					});
					
					$("#delete-category-btn").click(function(){
						$("#delete-cate-id").val($("#category-id").val());
						$("#delete-category-form").submit();
					});
					
					$("#parent-cate-search").click(function(){
						$("#parent-category-select").empty();
						param = {
							cate_level :	$("#modal-category-level").val(),
							parent_cate_nm : $("#modal-parent-category-name").val()
						};
						$.ajax({
							url: "parentCateList.ajax",
							data: param,
							type: 'POST',
							dataType: 'json',
							success : function(response) {
								if(response.data.length == 0){
									alert("검색된 상위 카테고리가 없습니다.");
									return false;
								}else{
									$("#parent-category-list").show();
									$.each(response.data, function(index, cate){
										$("#parent-category-select").append("<option value=\""+cate.CATE_ID+"\">"+cate.CATE_NM+"</option>")
									});
								}
							},
							error: function(xhr, status, error) {
								console.log("error="+error);
							}
						});
					})
					
					
					var DataSourceTree = function(options) {
						this.url = options.url;
					}
					
					DataSourceTree.prototype.data = function(options, callback) {
						var self = this;
						var $data = null;
						
						var param = null
						if(options.CATE_ID){
							param = options.CATE_ID;//load the first level data
						}else{
							param=0;
						}
						

						$.ajax({
							url: this.url,
							data: 'id='+param,
							type: 'POST',
							dataType: 'json',
							success : function(response) {
								console.log(response.data);
								callback({ data: response.data })
							},
							error: function(xhr, status, error) {
								alert(error);
							}
						});
					}
				
				$('#cate-tree').ace_tree({
					dataSource: new DataSourceTree({url: 'list.ajax'}),
					multiSelect:true,
					loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
					'open-icon' : 'icon-minus',
					'close-icon' : 'icon-plus',
					'selectable' : true,
					'selected-icon' : 'icon-ok',
					'unselected-icon' : 'icon-remove'
				});
		
				 $('#cate-tree').on('loaded', function (evt, data) {
					console.log("load");
				}); 
		
				$('#cate-tree').on('opened', function (evt, data) {
					console.log(data);
					cleanSelected();
					cateInfoSet(data);
					
				});
		
				$('#cate-tree').on('closed', function (evt, data) {
					cleanSelected();
					cateInfoSet(data);
					
				});
		
				$('#cate-tree').on('selected', function (evt, data) {
					selectedIdx = data.info.length -1;
					categoryInfo = data.info[selectedIdx];
					
					$(".tree-item-name").each(function(){
						if($(this).text() === categoryInfo.name ){
							console.log("selected cate-name:"+$(this).text());
						}else{
							$(this).parent().attr("class", "tree-item")
							$(this).parent().children(".icon-ok").attr("class", "icon-remove")
						}
					});
					cateInfoSet(categoryInfo);
				});
			});

			function cateInfoSet(data){
				$("#category-info").show();
				$("#category-name").val(data.name);
				$("#category-level").val(data.CATE_LEVEL);
				$("#category-ordering-no").val(data.ORDERING_NO);
				$("#origin-category-ordering-no").val(data.ORDERING_NO);
				$("#category-id").val(data.CATE_ID);
				$("#parent-category-name").val(data.PARENT_NM);
			}
				
			function cleanSelected(){
				$(".tree-item-name").each(function(){
					$(this).parent().attr("class", "tree-item")
					$(this).parent().children(".icon-ok").attr("class", "icon-remove")
				});
			}
		</script>

		