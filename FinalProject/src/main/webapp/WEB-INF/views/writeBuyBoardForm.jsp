<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'
	rel='stylesheet' type='text/css'>
<link
	href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./resources/css/writeBuyBoardForm.css" />
<link
	href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/css/bootstrap-switch.css'
	rel='stylesheet' type='text/css'>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/js/bootstrap.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/js/bootstrap-switch.min.js'
	type='text/javascript'></script>
</head>

<script type="text/javascript" src="./resources/js/WriteBuyBoard.js"></script>
<style>
.indent-small {
	margin-left: 5px;
}

.form-group.internal {
	margin-bottom: 0;
}

.dialog-panel {
	margin: 10px;
}

.datepicker-dropdown {
	z-index: 200 !important;
}

.panel-body {
	background: #e5e5e5;
	/* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%,
		color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
	/* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* IE10+ */
	background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e5e5e5',
		endColorstr='#ffffff', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
	font: 600 15px "Open Sans", Arial, sans-serif;
}

label.control-label {
	font-weight: 600;
	color: #777;
}

.box {
	width: 200px; /* 원하는 너비설정 */
}
</style>


<script>
$(document).ready(function() {  
	  /* $('.multiselect').multiselect();
	  $('.datepicker').datepicker();   */
	});

</script>
<body>


	<c:if test="${buylistFromHistory.fishName!=null}">
		<input type="hidden" id="setFishName"
			value="${buylistFromHistory.fishName}">
		<input type="hidden" id="setLoction"
			value="${buylistFromHistory.location}">
		<input type="hidden" id="setSellerId"
			value="${buylistFromHistory.successSellerId}">
	</c:if>






	<div class='container'>
		<div class='panel panel-primary dialog-panel'>
			<div class='panel-heading'
				style="background-color: #3aa9d5; text-align: center; font-size: 3em;">
				ご購入</div>
			<div class='panel-body'>
				<form class='form-horizontal' role='form' action="writeBuyBoard"
					method="post">
					<input type="hidden" id="uploadDate" name="uploadDate" /> <input
						type="hidden" id="deadline" name="deadline" />
					<div class='reservation1'>
						<div class='item1'>
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2 title'
									for='id_accomodation'>魚種</label>
								<div class='col-md-8'>
									<div class='col-md-2'>
										<div class="form-group internal dropdown">
											<input type="text" id="fishName" name="fishName"
												class='form-control' autocomplete="off" />
											<div id="myDropdown" class="dropdown-content"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='item1'>
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2 title'
									for='id_title'>産地</label>
								<div class='col-md-8'>
									<div class='col-md-2'>
										<div class='form-group internal'>
											<select id="location" name="location" class='form-control'>
											</select>
										</div>
									</div>
									<!--  <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
                  <input class='form-control' id='id_first_name' placeholder='First Name' type='text'>
                </div>
              </div> -->
									<!--  <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
                  <input class='form-control' id='id_last_name' placeholder='Last Name' type='text'>
                </div>
              </div> -->
								</div>
							</div>
						</div>
					<!--  
           <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>産地</label>
            <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
               	<select id="location" name="location" class='form-control'> </select>
                </div>
              </div>
           -->
						<div class='item1'>
							<div class='form-group '>
								<label class='control-label col-md-2 col-md-offset-2 title'
									for='id_adults'>重量</label>
								<div class='col-md-8'>
									<div class='col-md-2'>
										<div class='form-group internal'>
											<input type="number" class='form-control' id="weight"
												name="weight" />
										</div>
									</div>
								</div>
								<!-- <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
                  <input  id='id_children' placeholder='2-17 years' type='number'>
                </div>
              </div>
              <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
                  <input class='form-control' id='id_children_free' placeholder='&lt; 2 years' type='number'>
                </div>
              </div> -->
							</div>
						</div>
						<div class='item1'>
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2 title'
									for='id_email'>購入価格</label>
								<div class='col-md-8'>
									<div class='col-md-2'>
										<div class='form-group internal'>
											<input type="number" class='form-control' id="price"
												name="price" />
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					<div><br></div>
					<div><br></div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'
							for='id_checkin'>優先順位</label>
						<div class='col-md-8'>
							<div class='col-md-3'>
								<div class='form-group internal input-group reservation'>
									<div class='item'>
										<select id="priority1" name="priority1" class='form-control'>
											<option value="">未定(1)</option>
											<c:forEach var="buy" items="${buylist}">
												<option value="${buy.successSellerId}">${buy.successSellerId}</option>
											</c:forEach>
										</select>
									</div>

									<div class='item'>
										<select id="priority2" name="priority2" class='form-control'>
											<option value="">未定(2)</option>
											<c:forEach var="buy" items="${buylist}">
												<option value="${buy.successSellerId}">${buy.successSellerId}</option>
											</c:forEach>
										</select>
									</div>

									<div class='item'>
										<select id="priority3" name="priority3" class='form-control'>
											<option value="">未定(3)</option>
											<c:forEach var="buy" items="${buylist}">
												<option value="${buy.successSellerId}">${buy.successSellerId}</option>
											</c:forEach>
										</select>
									</div>



								</div>

							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'
							for='id_pets'>予約可否</label>
						<div class='col-md-8'>
							<div class='col-md-3 '>
								<div class='form-group internal input-group'>
									<div class='make-switch' data-off-label='NO'
										data-on-label='YES' id='id_pets_switch'>
										<input id='id_pets' type='checkbox' value='chk_hydro'>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'
							for='id_pets'>予約日時</label>
						<div class='col-md-8'>
							<div class='col-md-3 '>
								<div class='form-group internal input-group reservation'>
									<div class='item'>
										<select id="loadDate" name="loadDate" class='form-control'>
											<option value="">未定(年)</option>
										</select>
									</div>
									<div class='item'>
										<select id="hour" name="hour" class='form-control'>
											<option value="">未定(時)</option>
											<c:forEach begin="1" end="24" var="x" step="1">
												<c:if test="${x<10}">
													<option value="0${x}">0${x}</option>
												</c:if>
												<c:if test="${x>10}">
													<option value="${x}">${x}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class='item'>
										<select id="minute" name="minute" class='form-control'>
											<option value="">未定(分)</option>
											<option value="00">00</option>
											<option value="30">30</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'
							for='id_pets'> 締め切り時間</label>
						<div class='col-md-8'>
							<div class='col-md-3 '>
								<div class='form-group internal input-group'>
								<select id="finishHour" name="birthDate" class='form-control'>
									<c:forEach begin="1" end="4" var="x" step="1">
										<option value="${x}">${x}時間後</option>
									</c:forEach>
								</select>
							</div>
							</div>
						</div>
					</div>

					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'
							for='id_comments'>コメント</label>
						<div class='col-md-6'>
							<textarea class='form-control' id='id_comments'
								placeholder='Additional comments' name='buyListComment' rows='10'></textarea>
						</div>
					</div>
					<div class='form-group'>
						<div id='submit'>
							<button class='btn-lg btn-danger'
								style="background-color: #3aa9d5; "
								onclick="return check()" id="btn2">登録</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>