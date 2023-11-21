package com.project.adventure.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

// 어트랙션 운휴일정 계산용 (해당 주의 일요일, 토요일 날짜 계산)
public class WeekDayCalculator {
	public static String getCurrentWeekSchedule() {
		LocalDate currentDate = LocalDate.now();
		int dayOfWeek = currentDate.getDayOfWeek().getValue();		
		LocalDate startOfWeek = currentDate.minusDays(dayOfWeek -1);
        LocalDate endOfWeek = currentDate.plusDays(7 - dayOfWeek);        
        return startOfWeek.format(DateTimeFormatter.ofPattern("MM-dd")) + " ~ " + endOfWeek.format(DateTimeFormatter.ofPattern("MM-dd"));
	}
}
