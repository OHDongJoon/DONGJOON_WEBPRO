package com.lec.ex1_string;

import java.util.Scanner;

// ��ȭ��ȣ �޾�, �Է¹��� ��ȭ��ȣ, ¦����ȣ���� , ���ٷ�, ��ȭ��ȣ ���ڸ�, ��ȭ��ȣ���ڸ�
public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("��ȭ��ȣ�� �Է��ϼ���(010-9898-1234 ����)");
			String tel = sc.next(); // ��Ʈ�� �Է�
			if(tel.equalsIgnoreCase("X")) break;
			System.out.println("�Է��� ��ȭ��ȣ:" + tel);
			System.out.print("¦����° ���ڿ�");
			for (int i = 0; i < tel.length(); i++) {
				if (i % 2 == 0) {
					System.out.print(tel.charAt(i));// ¦����°���ڿ������
				} else {
					System.out.print(' ');// Ȧ�� ��° ���ڿ� ��� ' ' ���
				}
			}
			System.out.println();// ����
			System.out.println("���ڿ� ���ٷ�");
			for (int i = tel.length() - 1; i >= 0; i--) {
				System.out.print(tel.charAt(i));
			}
			System.out.println();
			int first = tel.indexOf('-'); // ù -�� ������ ��ġ
			int last = tel.lastIndexOf('-');// ������ - �� ������ ��ġ
			tel.indexOf('-');
			String pre = tel.substring(0, tel.indexOf('-'));// 010-9898-9898 02-789-1234
			String post = tel.substring(last + 1);
			String mid = tel.substring(first + 1, last);
			System.out.print("���� ���ڸ� : " + pre);
			System.out.print("���� ���ڸ� :" + post);
			System.out.println("���� �߰�:" + mid);
		}
	}
}