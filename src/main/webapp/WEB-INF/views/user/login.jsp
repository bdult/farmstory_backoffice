<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<body class="login-layout">
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="row-fluid">
					<div class="span12">
						<div class="login-container">
							<div class="row-fluid">
								<div class="center">
									<h1>
										<i class="icon-leaf green"></i>
										<span class="red">Oz World </span>
										<span class="white">Backoffice</span>
									</h1>
									<h4 class="blue">&copy; RNTS</h4>
								</div>
							</div>

							<div class="space-6"></div>

							<div class="row-fluid">
								<div class="position-relative">
									<div id="login-box" class="login-box visible widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header blue lighter bigger">
													<i class="icon-coffee green"></i>
													회원정보를 입력해 주세요
												</h4>

												<div class="space-6"></div>

													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<input type="text" id="member_id" name="member_id" class="span12" placeholder="Username" />
																<i class="icon-user"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<input type="password" id="member_pwd" name="member_pwd" class="span12" placeholder="Password" />
																<i class="icon-lock"></i>
															</span>
														</label>

														<div class="space"></div>

														<div class="clearfix">
														<!-- 
															<label class="inline">
																<input type="checkbox" />
																<span class="lbl"> 로그인 상태 유지</span>
															</label>
														 -->

															<button id="loginBtn" type="button" class="width-35 pull-right btn btn-small btn-primary">
																<i class="icon-key"></i>
																로그인
															</button>
														</div>

														<div class="space-4"></div>
													</fieldset>
											</div><!--/widget-main-->

										</div><!--/widget-body-->
									</div><!--/login-box-->
								</div><!--/position-relative-->
							</div>
						</div>
					</div><!--/.span-->
				</div><!--/.row-fluid-->
			</div>
		</div><!--/.main-container-->
	</body>
<script>

	$(document).ready(function(){
		
		//----------------------
		//테스트 아이디/비밀번호
		$('#member_id').val( "master" );
		$('#member_pwd').val( "123" );
		//----------------------
		
	    $('#member_id').focus();
	    $("#member_pwd ").bind("keydown", function(e) {
	        if (e.keyCode == 13) { // enter key
	        	loginAjax();
	            return false;
	        }
	    });
	});

	$(function(){
		$("#loginBtn").click(function(){
			loginAjax();
		});
		
		
	});
	
	function loginAjax(){
		var loginUrl = "${contextPath}/user/login.ajax";
		param = {
				member_id : $("#member_id").val(),
				member_pwd : $("#member_pwd").val()
		};
		
		console.log(param);
		
		$.ajax({
			url: loginUrl,
			data: param,
			type: 'POST',
			dataType: 'json',
			success : function(response) {
				console.log(response.data);
				if(response.data.code != 200) {
					alert(response.data.msg);
				}else{
					location.href ="${contextPath}/dashboard.do";
				}
			},
			error: function(xhr, status, error) {
				console.log(error);
				console.log(xhr);
				console.log(status);
			}
		});
	}
</script>
