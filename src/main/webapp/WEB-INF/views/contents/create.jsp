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

						<li>
							<a href="#">컨텐츠</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">컨텐츠 상세</li>
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
							컨텐츠 상세
							<small>
								<i class="icon-double-angle-right"></i>
								컨텐츠에 대한 상세한 정보를 입력한다
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form name="frm" method="post" action="${contextPath }/contents/createdb.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_id">컨텐츠 ID</label>

									<div class="controls">
										<input readonly="" type="text" id="contents_id" name="contents_id" value="${data.contents_id == null? "자동입력" : data.contents_id}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="contents_nm">컨텐츠 명</label>

									<div class="controls">
										<input type="text" id="form-field-1" id="contents_nm" name="contents_nm" placeholder="contents name" value="${data.contents_nm}"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">STATUS</label>

									<div class="controls">
										<select id="status" name="status">
											<option value="">--</option>
											<option value="1">사용</option>
											<option value="0">사용않함</option>
										</select>
										<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="More details." title="Popover on hover">?</span>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈</label>

									<div class="controls">
										<input type="text" id="contents_series_id" name="contents_series_id" placeholder="series" value="${data.contents_series_id}"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="brand_id">브랜드</label>

									<div class="controls">
										<input type="text" id="brand_id" name="brand_id" placeholder="brand" value=""/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="src_path">동영상</label>

									<div class="controls">
										<input class="span1" type="text" id="src_path" name="src_path" placeholder="file name" />
										<input class="span11" type="text" id="src_path2" name="src_path2" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지</label>

									<div class="controls">
										<input class="span1" type="text" id="form-field-5" placeholder="file name" />
										<input class="span11" type="text" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-input-readonly">등록정보</label>

									<div class="controls">
										<span class="input-icon">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>

										<span class="input-icon input-icon-right">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-input-readonly">수정정보</label>

									<div class="controls">
										<span class="input-icon">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>

										<span class="input-icon input-icon-right">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-info" type="button" id="btn_submit">
										<i class="icon-ok bigger-110"></i>
										Submit
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										Reset
									</button>
								</div>

								<div class="hr"></div>

								
							</form>

							<div class="hr hr-18 dotted hr-double"></div>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
			

<script type="text/javascript">
	var fm = document.frm;

	$("#btn_submit").click(function() {
		if(confirm('저장 하시겠습니까?')) {
			fm.submit();
		}
	});
	
	$("#status").val("${data.status}");
</script>