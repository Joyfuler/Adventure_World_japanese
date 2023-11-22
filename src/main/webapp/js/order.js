/*
함수이름 수정 11-22
*/
function count_check(obj) {
	var chkCnt = 0; // chkCnt 초기값 0 설정
	var chkBox = document.getElementsByName("attraction"); //name값 불러옴	
	for ( var i = 0; i < chkBox.length; i++){
		if (chkBox[i].checked){ // chkBox가 체크 됐을 경우
			chkCnt++; // 1증가
		}	
	}
	if (chkCnt > 3){ // 3개 
		alert("3개까지만 선택 가능합니다."); // 경고문
		obj.checked = false; // 경고 후 체크 되지 않게 설정.
		return false;
	}
	return chkCnt;
}


function toggleAnswer(answerId) {
    var answer = document.getElementById(answerId);
    if (answer.style.display === "none") {
        answer.style.display = "table-row";
    } else {
        answer.style.display = "none";
    }
}

 function increaseNumber(event, result) { // 증가
	event.preventDefault(); // 폼 제출 기본 동작 중지
    var resultInput = document.getElementById(result);
    var currentValue = parseInt(resultInput.value);
    var newValue = currentValue + 1;
    resultInput.value = newValue;
  }

 function decreaseNumber(event, result) {//  감소
	 event.preventDefault();
    var resultInput = document.getElementById(result);
    var currentValue = parseInt(resultInput.value);
    
    if (currentValue > 0) {
      var newValue = currentValue - 1;
      resultInput.value = newValue;
    }
  }
  
	
function increase(event, result) {
  event.preventDefault();
  var resultInput = document.getElementById(result);
  var currentValue = parseInt(resultInput.value);

  if (currentValue === 1) {
	  alert("패스 티켓은 1인당 1개만 구매 가능합니다.")
    return false; 
  }
  
  var otherResult = result === 'result' ? 'result2' : 'result';
  var otherResultInput = document.getElementById(otherResult);
  otherResultInput.value = 0;

  var newValue = currentValue + 1;
  resultInput.value = newValue;
}

function decrease(event, result) {
  event.preventDefault();
  var resultInput = document.getElementById(result);
  var currentValue = parseInt(resultInput.value);

  if (currentValue === 0) {
    return false; 
  }

  var otherResult = result === 'result' ? 'result2' : 'result';
  var otherResultInput = document.getElementById(otherResult);
  otherResultInput.value = 0; 

  var newValue = currentValue - 1;
  resultInput.value = newValue;
}
	
	

	
	
	// 달력 
	
  var today = new Date();
  var year = today.getFullYear();
  var month = today.getMonth() + 1;
var selectedDate;
  function formatDate(year, month, day) {
    month = month.toString().padStart(2, "0");
    day = day.toString().padStart(2, "0");
    return year + "-" + month + "-" + day;
  }

  function displayCalendar(year, month) {
    var monthElement = document.createElement("div");
    monthElement.classList.add("month");
    monthElement.textContent = year + "년 " + month + "월";
    calendarPopup.appendChild(monthElement);

    var closeButton = document.createElement("div");
    closeButton.classList.add("close-btn");
    closeButton.textContent = "X";
    closeButton.addEventListener("click", function() {
      calendarPopup.style.display = "none";
    });
    calendarPopup.appendChild(closeButton);

    var navigatorElement = document.createElement("div");
    navigatorElement.classList.add("navigator");

    var prevButton = document.createElement("button");
    prevButton.classList.add("prev-btn");
    prevButton.addEventListener("click", function() {
      var previousMonth = month === 1 ? 12 : month - 1;
      var previousYear = month === 1 ? year - 1 : year;

      if (previousYear < today.getFullYear() || (previousYear === today.getFullYear() && previousMonth < today.getMonth() + 1)) {
        return; // 현재 달 이전으로 이동하지 않도록 종료
      }

      calendarPopup.innerHTML = ""; 
      displayCalendar(previousYear, previousMonth);
    });
    navigatorElement.appendChild(prevButton);

    var nextButton = document.createElement("button");
    nextButton.classList.add("next-btn");
    nextButton.addEventListener("click", function() {
      calendarPopup.innerHTML = ""; 
      displayCalendar(month === 12 ? year + 1 : year, month === 12 ? 1 : month + 1);
    });
    navigatorElement.appendChild(nextButton);

    calendarPopup.appendChild(navigatorElement);

    var daysElement = document.createElement("div");
    daysElement.classList.add("days");
    calendarPopup.appendChild(daysElement);

    var firstDay = new Date(year, month - 1, 1);
    var lastDay = new Date(year, month, 0);
    var firstDayOfWeek = firstDay.getDay();
    var totalDays = lastDay.getDate();

    var weekdays = ["일", "월", "화", "수", "목", "금", "토"];

    for (var i = 0; i < weekdays.length; i++) {
      var weekday = document.createElement("div");
      weekday.classList.add("day");
      weekday.textContent = weekdays[i];
      daysElement.appendChild(weekday);
    }

    for (var i = 0; i < firstDayOfWeek; i++) {
      var emptyDay = document.createElement("div");
      emptyDay.classList.add("day");
      emptyDay.classList.add("empty-day"); 
      daysElement.appendChild(emptyDay);
    }

    var dayOfWeek = firstDayOfWeek;
    for (var i = 1; i <= totalDays; i++) {
      var day = document.createElement("div");
      day.classList.add("day");
      day.textContent = i;

      if (
        i === today.getDate() &&
        month === today.getMonth() + 1 &&
        year === today.getFullYear()
      ) {
        day.classList.add("selected");
        selectedDate = formatDate(year, month, i);
      }

      day.addEventListener("click", function() {
        var selectedDay = document.querySelector(".day.selected");
        if (selectedDay) {
          selectedDay.classList.remove("selected");
        }
        this.classList.add("selected");
       selectedDate = year + "-" + addLeadingZero(month) + "-" + addLeadingZero(this.textContent);

        var selectedDateElement = document.getElementById("selectedDate");
        //selectedDateElement.textContent =  selectedDate;
		selectedDateElement.value=selectedDate;
        
        calendarPopup.style.display = "none"; 
      });

      daysElement.appendChild(day);

      dayOfWeek++;
      if (dayOfWeek % 7 === 0) {
        dayOfWeek = 0;
      }
    }

    for (var i = dayOfWeek; i < 7; i++) {
      var emptyDay = document.createElement("div");
      emptyDay.classList.add("day");
      emptyDay.classList.add("empty-day"); 
      daysElement.appendChild(emptyDay);
    }

    calendarPopup.style.display = "block";
  }

  function showCalendar() {
    var calendarPopup = document.getElementById("calendarPopup");
    calendarPopup.innerHTML = "";
    displayCalendar(year, month);
  }


function addLeadingZero(value) {
  return value < 10 ? "0" + value : value;
}
