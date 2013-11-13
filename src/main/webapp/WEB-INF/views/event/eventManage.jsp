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
			<h3 class="header smaller lighter blue">Event List</h3>
			<!-- /. table-header -->
			
				<form class="form-horizontal well" id="searchForm">
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
   								<label class="control-label">Title</label>
    							<div class="controls">
    								<input type="hidden" name="search_type" value="title">
									<input class="input-xxlarge span10" type="text" name="search" >
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group" style="margin: 0;">
   								<label class="control-label">Status</label>
    							<div class="controls">
									<select class="span12" name="status">
									  <option value="">All</option>
									  <option value="0">Ready</option>
									  <option value="1">Doing</option>
									  <option value="2">Done</option>
									</select>
								</div>
							</div>
						</div>
						<div class="span8 text-right">
							<a class="btn btn-success input-small" id="reset" style="line-height: 20px;">Reset</a>
							<a class="btn btn-info input-small" id="search">Searching..</a>
						</div>
					</div>
				</form>
				
			<div class="table-header" align="right">
				<a class="btn btn-info btn-success" href="${ contextPath }/event/eventInfo.do">Add</a>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>Title</th>
						<th>Statys</th>
						<th>Event Date</th>
						<th>Date</th>
						<th>View Count</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="eventList" items="${ eventList }" varStatus="status">
					<tr>
						<td><a href="${ contextPath }/event/eventInfo.do?board_contents_id=${ eventList.CONTENTS_ID }">${ eventList.CONTENTS_ID }</a></td>
						<td><a href="${ contextPath }/event/eventInfo.do?board_contents_id=${ eventList.CONTENTS_ID }">${ eventList.TITLE }</a></td>
						<td>${ eventList.STATUS_DESC }</td>
						<td>${ eventList.EVENT_START_DT } ~ ${ eventList.EVENT_END_DT }</td>
						<td>${ eventList.REG_DT }</td>
						<td>${ eventList.HITS }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="row-fluid">
			<div class="span12 text-center">
				<div class="paging_bootstrap pagination">
					<ul>
						<c:choose>
							<c:when test="${pageInfo.blockPage == 1}">
								<li class="prev disabled"><a href="#null" ><i class="icon-double-angle-left"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="prev"><a href="eventManage.do?blockPage=${pageInfo.preBlockPage}"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${pageList }" var="page">
							<c:choose>
								<c:when test="${pageInfo.pageNum == page.pageNum}">
									<li class="active"><a href="eventManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.BlockPage}&search_type=title&search=${pageInfo.search}&status=${pageInfo.status}">${page.pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="eventManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.BlockPage}&search_type=title&search=${pageInfo.search}&status=${pageInfo.status}">${page.pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.blockPage == pageInfo.totalBlockPage}">
								<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="next"><a href="eventManage.do?blockPage=${pageInfo.nextBlockPage}"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div><!--  page-link -->
		
	</div>
</div>

<script type="text/javascript">

//side active
$("#side-event").addClass("open active");
	$("#side-event-event").addClass("active");

	//page init
	$("#searchForm input[name=search").val("${ pageInfo.search }");
	$("#searchForm select[name=status]").val("${ pageInfo.status }").attr("selected", "selected");

	$("#reset").click(function(){
		$("#searchForm input[name=search").val("");
		$("#searchForm select[name=status]").val("").attr("selected", "selected");
	});
	
	$("#search").click(function(){
		$("#searchForm").attr({
			method: 'post',
			action: '${ contextPath }/event/eventManage.do'
		}).submit();	
	});
</script>