<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Xoom Player Page</title>
		
	<link rel="stylesheet" href="<c:url value="/resources/css/main.css" />" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" type="text/css" />
	
	<script type="text/javascript" src="<c:url value="/resources/js/Winwheel.js" />" ></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.0.min.js"/>" > </script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js" ></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/style.css " />" type="text/css" />


</head>
<body>
<div align="center">
<div class ="banner">
	<img alt="Xoom SPIN & WIN contest" src="<c:url value="/resources/images/banner_img.png" />"><br>
</div>


<br>
<br>

<c:url var="addAction" value="/person/add" ></c:url>


			<table cellpadding="0" cellspacing="0" border="0">
			<th>
                     <p id="plrname" align="left">Welcome player!</p>
            
            </th>           
            
            <tr>
            
                <td>
                    <div class="power_controls">
                        <br />
                        <br />
                        <table class="power" cellpadding="10" cellspacing="0">
                            <tr>
                                <th align="center">Power</th>
                            </tr>
                            <tr>
                                <td width="78" align="center" id="pw3" onClick="powerSelected(3);">High</td>
                            </tr>
                            <tr>
                                <td align="center" id="pw2" onClick="powerSelected(2);">Med</td>
                            </tr>
                            <tr>
                                <td align="center" id="pw1" onClick="powerSelected(1);">Low</td>
                            </tr>
                        </table>
                        <br />
                        <img id="spin_button" src="<c:url value="/resources/images/spin_off.png" />" alt="Spin" onClick="startSpin();" />
                        <br /><br />
                        &nbsp;&nbsp;<a href="#" onClick="resetWheel(); return false;">Play Again</a><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(reset)
                    </div>
                </td>
                <td width="438" height="582" class="the_wheel" align="center" valign="center">
                    <canvas id="canvas" width="434" height="434">
                        <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                    </canvas>
                </td>
            </tr>
        </table>

<br>
<br>
<br>
<br>
<div class="row">
<div class="col-lg-3 col-lg-offset-2" style="padding-left:93px">
<form:form action="${addAction}" commandName="person">
<table class="playerform">
	<tr>
		
		<th colspan="2">Player Info</th>
		
		</tr>
		<tr>
		<td></td>
		</tr>

	<tr>
		<td>
			<form:label path="name">
				<spring:message  text="Paypal CorpID"/>
			</form:label>
		</td>
		<td>
			<form:input  path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label  path="mobileNo">
				<spring:message text=" Mobile No"/>
			</form:label>
		</td>
		<td>
			<form:input path="mobileNo" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label  path="prizeMoney">
				<spring:message text="Prize Money"/>
			</form:label>
		</td>
		<td>
			<form:input path="prizeMoney" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty person.name}">
				<input type="submit"
					value="<spring:message text="Edit Person"/>" />
			</c:if>
			<c:if test="${empty person.name}">
				<input type="submit" class="addwinnerButton" onclick="validate()"
					value="<spring:message text="Add Player "/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<!-- <h3 class="playersHead">Players</h3> -->
<div class="col-lg-6" style="margin-left: -107px;">
<c:if test="${!empty listPersons}">
	<table class="tg">
	<tr>
		
		<th width="120">PP CorpID</th>
		<th width="120">MobileNo</th>
		<th width="120">Prize</th>
		
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listPersons}" var="person">
		<tr>
			
			<td>${person.name}</td>
			<td>${person.mobileNo}</td>
			<td>${person.prizeMoney}</td>
	
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
</div>

</div>

<div id="user_register" style="display:none">
				<form>
					<div class="form-group">
					<label>CorpId</label>
					<input id="corpid" type="text" class="form-control" />
					</div>
					<br />
					<div class="form-group">
					<label>Password</label>
					<input id="password" type="password" class="form-control" />
					</div>
					<div class="form-group">
					<label>Prepaid Mobile No</label>
					<input type="text" id="plyrmobile" class="form-control" />
					</div>
					<br />

					<div class="action_btns">
						<div class="one_half"><a id="cancelbtn" href="#" class="btn btn-danger"><i class="fa fa-angle-double-left"></i> Cancel</a></div>
						<div class="one_half last"><a id="playbtn" href="#" class="btn btn_red">Play</a></div>
					</div>
				</form>
			</div>



			
		<script>
			// Create new wheel object specifying the parameters at creation time.
			var theWheel = new Winwheel({
				'numSegments'  : 8,
				'outerRadius'  : 212,
				'textFontSize' : 32,
				'segments'     :
				[
				   {'fillStyle' : '#eae56f', 'text' : '00'},
				   {'fillStyle' : '#89f26e', 'text' : '20'},
				   {'fillStyle' : '#7de6ef', 'text' : '00'},
				   {'fillStyle' : '#e7706f', 'text' : '20'},
				   {'fillStyle' : '#eae56f', 'text' : '20'},
				   {'fillStyle' : '#89f26e', 'text' : '30'},
				   {'fillStyle' : '#7de6ef', 'text' : '00'},
				   {'fillStyle' : '#e7706f', 'text' : '50'}
				],
				'animation' :
				{
					'type'     : 'spinToStop',
					'duration' : 5,
					'spins'    : 8,
					'callbackFinished' : 'alertPrize()'
				}
			});
			
			// Vars used by the code in this page to do power controls.
			var wheelPower    = 0;
			var wheelSpinning = false;
			
			// -------------------------------------------------------
			// Function to handle the onClick on the power buttons.
			// -------------------------------------------------------
			function powerSelected(powerLevel)
			{
				// Ensure that power can't be changed while wheel is spinning.
				if (wheelSpinning == false)
				{
					// Reset all to grey incase this is not the first time the user has selected the power.
					document.getElementById('pw1').className = "";
					document.getElementById('pw2').className = "";
					document.getElementById('pw3').className = "";
					
					// Now light up all cells below-and-including the one selected by changing the class.
					if (powerLevel >= 1)
					{
						document.getElementById('pw1').className = "pw1";
					}
						
					if (powerLevel >= 2)
					{
						document.getElementById('pw2').className = "pw2";
					}
						
					if (powerLevel >= 3)
					{
						document.getElementById('pw3').className = "pw3";
					}
					
					// Set wheelPower var used when spin button is clicked.
					wheelPower = powerLevel;
					
					// Light up the spin button by changing it's source image and adding a clickable class to it.
					document.getElementById('spin_button').src = "<c:url value="/resources/images/spin_on.png" />";
					document.getElementById('spin_button').className = "clickable";
				}
			}
			
			// -------------------------------------------------------
			// Click handler for spin button.
			// -------------------------------------------------------
			function startSpin()
			{
				// Ensure that spinning can't be clicked again while already running.
				if (wheelSpinning == false)
				{
					// Based on the power level selected adjust the number of spins for the wheel, the more times is has
					// to rotate with the duration of the animation the quicker the wheel spins.
					if (wheelPower == 1)
					{
						theWheel.animation.spins = 3;
					}
					else if (wheelPower == 2)
					{
						theWheel.animation.spins = 8;
					}
					else if (wheelPower == 3)
					{
						theWheel.animation.spins = 15;
					}
					
					// Disable the spin button so can't click again while wheel is spinning.
					document.getElementById('spin_button').src       = "<c:url value="/resources/images/spin_off.png" />";
					document.getElementById('spin_button').className = "";
					
					// Begin the spin animation by calling startAnimation on the wheel object.
					theWheel.startAnimation();
					
					// Set to true so that power can't be changed and spin button re-enabled during
					// the current animation. The user will have to reset before spinning again.
					wheelSpinning = true;
				}
			}
			
			// -------------------------------------------------------
			// Function for reset button.
			// -------------------------------------------------------
			function resetWheel()
			{
				theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
				theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
				theWheel.draw();                // Call draw to render changes to the wheel.
				
				document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
				document.getElementById('pw2').className = "";
				document.getElementById('pw3').className = "";
				
				wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
				
				$("#user_register").dialog({"modal":"true","height":"550","width":"640px"});
			}
			
			// -------------------------------------------------------
			// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters.
			// -------------------------------------------------------
			function alertPrize()
			{
				// Get the segment indicated by the pointer on the wheel background which is at 0 degrees.
				var winningSegment = theWheel.getIndicatedSegment();
				
				// Do basic alert of the segment text. You would probably want to do something more interesting with this information.
				if(winningSegment.text > 0){
					$("<div/>").html("<h3>XOOOOM! Congratulations!! <br/> You have won " + winningSegment.text +" Rupees recharge<br/>  We will recharge you by EOD <br/><br/> Thanks for visting XOOM stall</h3>").dialog({
						 modal : true,
						 width:600,
						 height:400,
						 buttons: {
				                "Close Dialog" : function(){
				                    $( this ).dialog( "close" );
				                }
				            },
				            close : function(ev, ui) {
				               
				                return true;    
				            }
					});
					document.getElementById('prizeMoney').value = winningSegment.text;
				}else{
					
					$("<div/>").html("<h3>Better luck next time. <br/><br/>Thanks for visting XOOM stall</h3>").dialog({
						 modal : true,
						 width:600,
						 height:400,
						 buttons: {
				                "Close Dialog" : function(){
				                    $( this ).dialog( "close" );
				                }
				            },
				            close : function(ev, ui) {
				                return true;    
				            }
					});
					document.getElementById('prizeMoney').value = winningSegment.text;
				}
				
			}
			$(document).ready(function(){
				$("#playbtn").click(function(data){
					corpid=$("#corpid").val();
					password=$("#password").val();
					mobileno=$("#plyrmobile").val();
							$.ajax({
								
								  "crossDomain": true,
								  "url": "http://psg.paypalcorp.com/ldap3.php",
								  "method": "POST",
								  "headers": {
								   
								    "content-type": "application/x-www-form-urlencoded"
								  },
								  "data": {
								    "corpid": corpid,
								    "password": password
								  },success:function(data){
									  res=JSON.parse(data)
									  if(res.auth > 0){
										  $("#plrname").html("Welcome "+ res.name);
										  $("#user_register").dialog("close");
										  $("#name").val(res.corpid);
										  $("#mobileNo").val(mobileno);
									  }else{
										  alert("Invalid corpid/ password");
									  }
								  }
							});
				});
			});
			
		</script>
		
		
</body>
</html>
