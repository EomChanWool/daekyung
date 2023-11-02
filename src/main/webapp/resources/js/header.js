function printClock() {
		var time = document.getElementById("time");
		var currentDate = new Date();                                     // 현재시간
		var calendar = currentDate.getFullYear() + "-" + addZeros((currentDate.getMonth()+1),2) + "-" + addZeros(currentDate.getDate(),2) + " (" + getTodayLabel() + ")"; // 현재 날짜
		var amPm = '오전'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(),2); 
		var currentMinute = addZeros(currentDate.getMinutes() ,2);
		var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		
		// 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
// 		if(currentHours >= 12){ 
// 			amPm = '오후';
// 			currentHours = addZeros(currentHours - 12,2);
// 		}
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

$(function(){	
	const url = document.location.pathname;
	if(url.split('/')[2] != 'main.do'){
		const requestUrl = url.split('/')[2];
		$('#' + requestUrl).addClass('on');
		
		const requestUrl2 = url.split('/')[3].split('.')[0];
		$('#'+ requestUrl2).addClass('on');
	}
});
function menuSet(menu) {
	sessionStorage.setItem('menu',menu);
	if($('#nav_con').attr('class') == 'nav_on') {
		btn_nav_con();
	}
}