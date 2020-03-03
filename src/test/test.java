package test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class test {

	public static void main(String[] args) {
		LocalDateTime rightNow = LocalDateTime.now();
		System.out.println("当前时刻:" + rightNow);
		System.out.println("当前年份:" + rightNow.getYear());
		System.out.println("当前月份:" + rightNow.getMonth());
		System.out.println("当前日份:" + rightNow.getDayOfMonth());
		
		String date = rightNow.format(DateTimeFormatter.ISO_DATE);
		String date1 = rightNow.format(DateTimeFormatter.ofPattern("yyy/MM/dd/hh/mm/ss"));
		System.out.println(date1);
		System.out.println(date);
	}

}
