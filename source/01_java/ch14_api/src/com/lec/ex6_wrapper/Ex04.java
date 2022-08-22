package com.lec.ex6_wrapper;

import java.util.Scanner;

//사용자로부터 정수문자열을("100 ") 입력받아  정수로 수정해서 출력하는 프로그램
public class Ex04 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("정수를 입력하세요");
		String numStr = scanner.nextLine();
		System.out.println("입력하신 문자열은 "+ numStr);
		numStr = numStr.trim();// 좌우 space가 생략된다
		numStr = numStr.replaceAll("[a-zA-Z가-힣]", "");//문자 제거
		int num = Integer.parseInt(numStr);
		System.out.println("변형된 정수는" + num);
		
	}
}
