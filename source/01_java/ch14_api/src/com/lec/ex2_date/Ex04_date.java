package com.lec.ex2_date;

import java.util.Date;

public class Ex04_date {
	public static void main(String[] args) {

		Date date = new Date();
		System.out.println(date);//������ ���� 
		int year = date.getYear() + 1900; //  ��� ��????????????????????????
		int month = date.getMonth() +1 ; // 0~11��
		int day = date.getDate(); // ��
		System.out.printf("%d�� %d�� %d��\n", year,month,day);
		// %d(����) %f(�Ǽ�) %s(���ڿ�) %c(����)
				// %ty(��) %tm(��) %td(��) %ta(����) %tp(����/����) %t1(12��) %tm(��) %ts(��)
				System.out.printf("%tY�� %tm�� %td�� %ta���� %tp %tl�� %tM�� %tS��\n", date, date, date, date, date, date, date, date);
				System.out.printf("%1$tY�� %1$tm�� %1$td�� %1$ta���� %1$tp %1$tl�� %1$tM�� %1$tS��", date); // ??
	}
}