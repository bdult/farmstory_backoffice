<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>			

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="#">Main</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">게시판 관리</li>
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

					<div class="row-fluid">
						<div class="row-fluid">
								<h3 class="header smaller lighter blue">게시판 리스트</h3>

								<table id="board_table" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">
												<label>
													<input type="checkbox" />
													<span class="lbl"></span>
												</label>
											</th>
											<th>게시판 ID</th>
											<th>게시판명</th>
											<th>생성자 ID</th>
											<th>변경자 ID</th>
											<th>댓글 사용여부</th>
											<th>파일 업로드 사용여부</th>
											<th>생성일자</th>
										</tr>
									</thead>

									<tbody>
									<c:forEach items="${boardList }" var="board">
										<tr>
											<td class="center">
												<label>
													<input type="checkbox" />
													<span class="lbl"></span>
												</label>
											</td>

											<td>${board.BOARD_ID }</td>
											<td>${board.BOARD_NM }</td>
											<td>${board.REG_MEMBER_ID }</td>
											<td>${board.MOD_MEMBER_ID }</td>
											<td>${board.COMMENT_USE_YN }</td>
											<td>${board.FILEUPLOAD_USE_YN }</td>
											<td>${board.REG_DT }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->


		<!--page specific plugin scripts-->

		<script src="${rootPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${rootPath}/assets/js/jquery.dataTables.bootstrap.js"></script>


		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				/* var oTable1 = $('#sample-table-2').dataTable( {
				"aoColumns": [
			      { "bSortable": false },
			      null, null,null, null, null,
				  { "bSortable": false }
				] } ); 
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				*/
			})
		</script>

