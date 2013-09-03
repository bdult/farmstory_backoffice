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
						<li class="active">컨텐츠 관리</li>
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
							컨텐츠 관리
							<small>
								<i class="icon-double-angle-right"></i>
								컨텐츠 리스트
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="row-fluid">
								<h3 class="header smaller lighter blue">컨텐츠 리스트</h3>
								<div class="table-header">
									<button id="create-contents-btn" class="btn btn-info">컨텐츠 추가</button>
								</div>
								

								<table id="sample-table-2" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">
												<label>
													<input type="checkbox" />
													<span class="lbl"></span>
												</label>
											</th>
											<th>컨텐츠 ID</th>
											<th>컨텐츠명</th>
											<th>시리즈</th>
											<th>브랜드</th>
											<th>저장위치</th>
											<th>섬네일 위치</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
									<c:forEach var="conlist" items="${list}" varStatus="status">
										<tr>
											<td class="center">
												<label>
													<input type="checkbox" />
													<span class="lbl"></span>
												</label>
											</td>

											<td>
												<a href="${contextPath }detail.do?contents_id=${conlist.CONTENTS_ID}">${conlist.CONTENTS_ID}</a>
											</td>
											<td>${conlist.CONTENTS_NM}</td>
											<td>${conlist.SERIES_NM}</td>											
											<td>${conlist.BRAND_NM}</td>
											<td>${conlist.SRC_PATH}</td>
											<td>${conlist.IMG_PATH}</td>
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="blue" href="detail.do?contents_id=${conlist.CONTENTS_ID}">
														<i id="detail_icon" class="icon-zoom-in bigger-130"></i>
													</a>

													<a class="green" href="detail.do?contents_id=${conlist.CONTENTS_ID}">
														<i id="modify_icon" class="icon-pencil bigger-130"></i>
													</a>

													<a class="red" href="delete.do?contents_id=${conlist.CONTENTS_ID}">
														<i id="delete_icon" class="icon-trash bigger-130"></i>
													</a>
												</div>

												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>

														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																	<span class="blue">
																		<i class="icon-zoom-in bigger-120"></i>
																	</span>
																</a>
															</li>

															<li>
																<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																	<span class="green">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>

															<li>
																<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																	<span class="red">
																		<i class="icon-trash bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
										
									</tbody>
								</table>
							</div>

							</div><!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
		
		<!--basic scripts-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='" + ${contextPath} + "/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
		
		$("#modify_icon").click(function(){
			
		});
		$("#detail_icon").click(function(){
			
		});
		
		</script>
		
		<!-- add jquery -->
		<script type="text/javascript">				
			$("#create-contents-btn").click(function(){
				location.href="${contextPath}/contents/create.do";
			});
		</script>