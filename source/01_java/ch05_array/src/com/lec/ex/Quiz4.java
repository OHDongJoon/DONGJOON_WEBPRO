package com.lec.ex;

//거스름돈 2680을 500, 100, 50, 10짜리 동전으로 줄 때, 몇개씩 주어야 하나?
public class Quiz4 {
	public static void main(String[] args) {
		int money = 2680 ;
		int[] coinUnit = {500, 100, 50, 10};
		for(int i = 0; i <coinUnit.length ; i++) {
			System.out.println(coinUnit[i] + "원 " + (money/coinUnit[i])+"개");
			money %= coinUnit[i];
		}
		}
}   