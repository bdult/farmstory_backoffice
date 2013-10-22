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
						<li class="active">메인화면</li>
					</ul><!--.breadcrumb-->
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							메인화면
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->
							<div class="row-fluid">
								<div class="span6">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter">
												<i class="icon-star orange"></i>
												<a href="${contextPath }/contents/manage.do?pageNum=1&pageNum=1"> 컨텐츠</a>
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
																컨텐츠 ID
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																컨텐츠 명
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																생성일
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${contentsTop5 }" var="contents">
															<tr>
																<td><a href="${contextPath }/contents/detail.do?pageNum=1&contents_id=${contents.CONTENTS_ID}">${contents.CONTENTS_ID}</a> </td>
																<td><a href="${contextPath }/contents/detail.do?pageNum=1&contents_id=${contents.CONTENTS_ID}">${contents.CONTENTS_NM}</a> </td>
																<td>${contents.REG_DT}</td>
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
											<h4 class="lighter">
												<i class="icon-signal"></i>
												<a href="${contextPath }/user.do?pageNum=1&pageNum=1"> 회원</a>
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
																아이디
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																이름
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																가입일
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${userTop5 }" var="user">
															<tr>
																<td><a href="${contextPath }/user/detail.do?pageNum=1&member_id=${user.MEMBER_ID}">${user.MEMBER_ID}</a> </td>
																<td><a href="${contextPath }/user/detail.do?pageNum=1&member_id=${user.MEMBER_ID}">${user.MEMBER_NM}</a> </td>
																<td>${user.REG_DT}</td>
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
												<i class="icon-rss orange"></i>
												<a href="${contextPath }/brand/manage.do?pageNum=1&pageNum=1"> 출판사</a>
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
																출판사 ID
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																출판사 명
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																생성일
															</th>
														</tr>
													</thead>

													<tbody>
															<c:forEach items="${brandTop5 }" var="brand">
																<tr>
																	<td><a href="${contextPath }/brand/detail.do?pageNum=1&brand_id=${brand.BRAND_ID}">${brand.BRAND_ID}</a> </td>
																	<td><a href="${contextPath }/brand/detail.do?pageNum=1&brand_id=${brand.BRAND_ID}">${brand.BRAND_NM}</a> </td>
																	<td>${brand.REG_DT}</td>
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
													<i class="icon-rss orange"></i>
													<a href="${contextPath }/series/manage.do"> 시리즈 </a>
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
																	시리즈 ID
																</th>
	
																<th>
																	<i class="icon-caret-right blue"></i>
																	시리즈 명
																</th>
	
																<th class="hidden-phone">
																	<i class="icon-time bigger-110 hidden-phone"></i>
																	생성일
																</th>
															</tr>
														</thead>
	
														<tbody>
															<c:forEach items="${seriesTop5 }" var="series">
																<tr>
																	<td><a href="${contextPath }/series/detail.do?pageNum=1&series_id=${series.CONTENTS_SERIES_ID}">${series.CONTENTS_SERIES_ID}</a></td>
																	<td><a href="${contextPath }/series/detail.do?pageNum=1&series_id=${series.CONTENTS_SERIES_ID}">${series.CONTENTS_SERIES_NM}</a></td>
																	<td>${series.REG_DT}</td>
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
						
						<div class="row-fluid">
								<div class="span6">
									<div class="widget-box transparent" >
										<div class="widget-header">
											<h4 class="lighter smaller">
												<i class="icon-rss orange"></i>
												
												<a href="${contextPath }/board/manage.do?pageNum=1&pageNum=1"> 게시판</a>
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
																게시판 ID
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																게시판 명
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																생성일
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${boardTop5 }" var="board">
															<tr>
																<td><a href="${contextPath }/board/detail.do?pageNum=1&board_id=${board.BOARD_ID}">${board.BOARD_ID}</a> </td>
																<td><a href="${contextPath }/board/detail.do?pageNum=1&board_id=${board.BOARD_ID}">${board.BOARD_NM}</a> </td>
																<td>${board.REG_DT}</td>
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
												<i class="icon-rss orange"></i>
												<a href="${contextPath }/category/manage.do"> 카테고리</a>
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
																카테고리 ID
															</th>

															<th>
																<i class="icon-caret-right blue"></i>
																카테고리 명
															</th>

															<th class="hidden-phone">
																<i class="icon-time bigger-110 hidden-phone"></i>
																생성일
															</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${categoryTop5 }" var="category">
															<tr>
																<td>${category.CATE_ID}</td>
																<td>${category.CATE_NM}</td>
																<td>${category.REG_DT}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div><!--/span-->
						</div><!--/.span-->
							<!--PAGE CONTENT ENDS-->
					</div><!--/.span12-->
				</div><!--/.row-fluid-->
			</div><!--/.page-content-->
		</div><!--/.main-content-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		