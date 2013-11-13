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
						<li class="active">Main</li>
					</ul><!--.breadcrumb-->
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							Main
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->
							<div class="row-fluid">
								<div class="span6">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter smaller">
												<i class="icon-star orange"></i>
												<a href="${contextPath }/user/manage.do">Members Status</a>
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="icon-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>
																<i class="icon-caret-right blue"></i>
																Date
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																New members
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																Paid members
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${memberCurrentData }" var="member">
															<tr>
																<td>${member.REG_DT}</td>
																<td>${member.NEW_MEMBER_COUNT}</td>
																<td>${member.PAY_MEMBER_COUNT}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div><!-- /.span6 -->

								<div class="span6">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter smaller">
												<i class="icon-signal red"></i>
												 Payment Status
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="icon-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>
																<i class="icon-caret-right blue"></i>
																Date
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																Count
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																Price
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${payCurrentData }" var="payInfo">
															<tr>
																<td>${payInfo.REG_DT} </td>
																<td>${payInfo.PAY_COUNT} </td>
																<td>${payInfo.PAY_SUM}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div>
							</div>

							<div class="hr hr32 hr-dotted"></div>

							<div class="row-fluid">
								<div class="span6">
									<div class="widget-box transparent" >
										<div class="widget-header">
											<h4 class="lighter smaller">
												<i class="icon-comment orange"></i>
												<a href="${contextPath }/cscenter/questionManage.do"> Custom Voice</a>
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="icon-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th class="span2">
																<i class="icon-caret-right blue"></i>
																Date
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																Category
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																Title
															</th>
															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																Member ID
															</th>
															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																Status
															</th>
														</tr>
													</thead>

													<tbody>
															<c:forEach items="${csCurrentData }" var="csInfo">
																<tr>
																	<td>${csInfo.REG_DT}</td>
																	<td>${csInfo.CONTENTS_CODE_DESC}</td>
																	<td>${csInfo.TITLE}</td>
																	<td>${csInfo.MEMBER_ID}</td>
																	<td>${csInfo.COMPLETE_DESC}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div><!--/widget-main-->
											</div><!--/widget-body-->
										</div><!--/widget-box-->
									</div><!--/span-->
									<div class="span6">
										<div class="widget-box transparent" >
											<div class="widget-header">
												<h4 class="lighter smaller">
													<i class="icon-signal orange"></i>
													<a href="${contextPath }/contents/manage.do"> Contents Status</a>
												</h4>
	
												<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>
	
											<div class="widget-body">
												<div class="widget-main no-padding">
													<table class="table table-bordered table-striped">
														<thead>
															<tr>
																<th>
																	<i class="icon-caret-right blue"></i>
																	Date
																</th>
	
																<th>
																	<i class="icon-caret-right blue"></i>
																	Count
																</th>
	
																<th class="hidden-phone">
																	<i class="icon-time bigger-110 hidden-phone"></i>
																	Accumulate
																</th>
															</tr>
														</thead>
	
														<tbody>
															<c:forEach items="${contentsCurrentData }" var="contentsInfo">
																<tr>
																	<td>${contentsInfo.REG_DT}</td>
																	<td>${contentsInfo.CONTENTS_COUNT}</td>
																	<td>${contentsInfo.SUM_CONTENTS_COUNT}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div><!--/widget-main-->
											</div><!--/widget-body-->
										</div><!--/widget-box-->
									</div><!--/span-->
							</div><!--/.span-->
						
						<div class="hr hr32 hr-dotted"></div>
						
							<!--PAGE CONTENT ENDS-->
					</div><!--/.span12-->
				</div><!--/.row-fluid-->
			</div><!--/.page-content-->
		</div><!--/.main-content-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		