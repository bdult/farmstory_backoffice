<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Treeview - Ace Admin</title>

		<meta name="description" content="with selectable items(single &amp; multiple) and custom icons" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="${rootPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${rootPath}/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${rootPath}/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<link rel="stylesheet" href="${ rootPath }/assets/css/ace-fonts.css" />

		<!--ace styles-->

		<link rel="stylesheet" href="${ rootPath }/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ rootPath }/assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${ rootPath }/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	</head>

	<body>

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>


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
							<a href="#">UI Elements</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">Treeview</li>
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
							Treeview
							<small>
								<i class="icon-double-angle-right"></i>
								with selectable items(single &amp; multiple) and custom icons
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="row-fluid">
								<div class="widget-box span6">
									<div class="widget-header header-color-blue2">
										<h4 class="lighter smaller">Choose Categories</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="cate-tree" class="tree"></div>
										</div>
									</div>
								</div>

								<div class="widget-box span6">
									<div class="widget-header header-color-green2">
										<h4 class="lighter smaller">Browse Files</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main padding-8">
											<div id="tree2" class="tree"></div>
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

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9">#438EB9</option>
									<option data-class="skin-1" value="#222A2D">#222A2D</option>
									<option data-class="skin-2" value="#C6487E">#C6487E</option>
									<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ rootPath }/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
			<script type="text/javascript">
			 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
			</script>
			<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ rootPath }/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${ rootPath }/assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<script src="${ rootPath }/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
		<script src="${ rootPath }/assets/js/fuelux/fuelux.tree.min.js"></script>

		<!--ace scripts-->

		<script src="${ rootPath }/assets/js/ace-elements.min.js"></script>
		<script src="${ rootPath }/assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
				$(function() {
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
							type: 'GET',
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
		
				$('#tree2').ace_tree({
					dataSource: treeDataSource2 ,
					loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
					'open-icon' : 'icon-folder-open',
					'close-icon' : 'icon-folder-close',
					'selectable' : false,
					'selected-icon' : null,
					'unselected-icon' : null
				});



				/**
				$('#tree1').on('loaded', function (evt, data) {
				});
		
				$('#tree1').on('opened', function (evt, data) {
				});
		
				$('#tree1').on('closed', function (evt, data) {
				});
		
				$('#tree1').on('selected', function (evt, data) {
				});
				*/
			});
		</script>
	</body>
</html>