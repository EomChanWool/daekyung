<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="gnb" style="margin-top: 22px; margin-right: 1350px;">
		<div class="gnb_date">
			<span class="time" id="time"></span>
		</div>
	</div>

<li class="nav-item dropdown no-arrow">
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-gray-600 small">${memberVO.miName}</span>
        <img class="img-profile rounded-circle"
            src="/resources/conf/images/img/undraw_profile.svg">
    </a>
    <!-- Dropdown - User Information -->
    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
        aria-labelledby="userDropdown">
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
            	로그아웃
        </a>
    </div>
</li>

<script>

function printClock() {
	var time = document.getElementById("time");
	var currentDate = new Date();                                     // 현재시간
	var calendar = currentDate.getFullYear() + "-" + addZeros((currentDate.getMonth()+1),2) + "-" + addZeros(currentDate.getDate(),2) + " (" + getTodayLabel() + ")"; // 현재 날짜
	var amPm = '오전'; // 초기값 AM
	var currentHours = addZeros(currentDate.getHours(),2); 
	var currentMinute = addZeros(currentDate.getMinutes() ,2);
	var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	
	// 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
//		if(currentHours >= 12){ 
//			amPm = '오후';
//			currentHours = addZeros(currentHours - 12,2);
//		}
	$('#time').text(calendar + " " + " "+currentHours+ ":" +currentMinute+ ":" + currentSeconds);
	setTimeout("printClock()",1000);
}
function getTodayLabel() {
    
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    
    var today = new Date().getDay();
    var todayLabel = week[today];
    
    return todayLabel;
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
		for (i = 0; i < digit - num.length; i++) {
		  zero += '0';
		}
	  }
	  return zero + num;
}

window.onload = function(){ 
		 printClock();
} 	
function cancel(divId) {
$('#'+divId).hide();
}
//엔터키 제어
/* 
document.addEventListener('keydown', function(event) {
if (event.keyCode === 13) {
	event.preventDefault();
};
}, true);
*/


</script>