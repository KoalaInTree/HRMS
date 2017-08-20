$(document).ready(function(){
	$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
	$('.datepicker').datepicker();
	$("#ename").blur(function (){
		validateEname();
	});
	$("#ename").focus(function (){
		validateEname();
	});
	$("#lname").blur(function (){
		validateLname();
	});
	$("#lname").focus(function (){
		validateLname();
	});
	$("#lpass").blur(function (){
		validateLpass();
	});
	$("#lpass").focus(function (){
		validateLpass();
	});
	$("#birthday").blur(function (){
		validateBirthday();
	});
	$("#birthday").focus(function (){
		validateBirthday();
	});
	$("#hiredate").blur(function (){
		validateHiredate();
	});
	$("#hiredate").focus(function (){
		validateHiredate();
	});
	$("#salary").blur(function (){
		validateSalary();
	});
	$("#salary").focus(function (){
		validateSalary();
	});
	$("#sex").change(function (){
		validateSex();	
	});
	$("#power").change(function (){
		validatePower();	
	});
	$("#dept").change(function (){
		validateDept();	
	});
	$("#job").change(function (){
		validateJob();	
	});
	$("#headimg").blur(function (){
		validateHeadimg();
	});
	$("#headimg").focus(function (){
		validateHeadimg();
	});
	
	$("#eform").submit(function (){
		var flag = true;
		flag = validateEname() && flag;
		flag = validateLname() && flag;
		flag = validateLpass() && flag;
		flag = validateSex() && flag;
		flag = validateBirthday() && flag;
		flag = validateHiredate() && flag;
		flag = validateSalary() && flag;
		flag = validatePower() && flag;
		flag = validateDept() && flag;
		flag = validateJob() && flag;
		flag = validateHeadimg() && flag;
		return flag;
	});
});

function validateEname(){
	var v = $("#ename").val();
	if(v == ""){
		$("#info1").removeClass("success");
		$("#info1").addClass("error");
		return false;
	}else{
		$("#info1").removeClass("error");
		$("#info1").addClass("success");
		return true;
	}	
}
function validateLname(){
	var v = $("#lname").val();
	if(v == ""){
		$("#info2").removeClass("success");
		$("#info2").addClass("error");
		return false;
	}else{
		$("#info2").removeClass("error");
		$("#info2").addClass("success");
		return true;
	}	
}
function validateLpass(){
	var v = $("#lpass").val();
	if(v == ""){
		$("#info3").removeClass("success");
		$("#info3").addClass("error");
		return false;
	}else{
		$("#info3").removeClass("error");
		$("#info3").addClass("success");
		return true;
	}	
}
function validateSex(){
	var v = $("#sex").val();
	if(v == -1){
		$("#info4").removeClass("success");
		$("#info4").addClass("error");
		return false;
	}else{
		$("#info4").removeClass("error");
		$("#info4").addClass("success");
		return true;
	}	
}
function validateBirthday(){
	var v = $("#birthday").val();
	if(v == ""){
		$("#info5").removeClass("success");
		$("#info5").addClass("error");
		return false;
	}else{
		$("#info5").removeClass("error");
		$("#info5").addClass("success");
		return true;
	}	
}
function validateHiredate(){
	var v = $("#hiredate").val();
	if(v == ""){
		$("#info6").removeClass("success");
		$("#info6").addClass("error");
		return false;
	}else{
		$("#info6").removeClass("error");
		$("#info6").addClass("success");
		return true;
	}	
}
function validateSalary(){
	var v = $("#salary").val();
	if(v == ""){
		$("#info7").removeClass("success");
		$("#info7").addClass("error");
		return false;
	}else{
		$("#info7").removeClass("error");
		$("#info7").addClass("success");
		return true;
	}	
}
function validatePower(){
	var v = $("#power").val();
	if(v == -1){
		$("#info8").removeClass("success");
		$("#info8").addClass("error");
		return false;
	}else{
		$("#info8").removeClass("error");
		$("#info8").addClass("success");
		return true;
	}	
}
function validateDept(){
	var v = $("#dept").val();
	if(v == -1){
		$("#info9").removeClass("success");
		$("#info9").addClass("error");
		return false;
	}else{
		$("#info9").removeClass("error");
		$("#info9").addClass("success");
		return true;
	}	
}
function validateJob(){
	var v = $("#job").val();
	if(v == -1){
		$("#info10").removeClass("success");
		$("#info10").addClass("error");
		return false;
	}else{
		$("#info10").removeClass("error");
		$("#info10").addClass("success");
		return true;
	}	
}
function validateHeadimg(){
	var v = $("#headimg").val();
	if(v == ""){
		$("#info11").removeClass("success");
		$("#info11").addClass("error");
		return false;
	}else{
		$("#info11").removeClass("error");
		$("#info11").addClass("success");
		return true;
	}	
}

