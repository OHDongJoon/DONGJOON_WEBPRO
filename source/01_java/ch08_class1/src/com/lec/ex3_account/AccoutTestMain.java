package com.lec.ex3_account;

public class AccoutTestMain {
	
	public static void main(String[] args) {
		Account hong = new Account("100-1","ȫ�浿",2200000000L);
		Account shin = new Account("101-1","�ű浿");
		Account acc = new Account();
		acc.setAccountNo("101-2");
		acc.setOwnerName("���浿");
		System.out.println("2�ܾ��� " +hong.getBalance());
		System.out.println(shin.infoPrint());
		System.out.println(acc.infoPrint());
		shin.deposit(2000);
		shin.withdraw(3000);
		hong.withdraw(20000);
		acc.withdraw(10);
		System.out.println(hong.infoPrint());
		System.out.println(shin.infoPrint());
		System.out.println(acc.infoPrint());
	}
	
}
