package com.lec.condition;

import java.util.Scanner;

public class Quiz6 {
	public static void main(String[] args) {
		Scanner  scanner = new Scanner (System.in);
		System.out.print("���� ����Դϱ�?:");
		int month = scanner.nextInt();
		//�� �Է¹ޱ�
		switch(month) {
		//�ܿ�
		case 12 : case 1: case 2:
			System.out.println("�ܿ��̳׿�"); break;
		//��
		case 3 : case 4: case 5:
			System.out.println("���̳׿�"); break;
		// ����
		case 6 : case 7: case 8:
			System.out.println("�����̳׿�"); break;
		// ����
		case 9 : case 10: case 11:
			System.out.println("�����̳׿�"); break;
		default:
			System.out.println("����");
		}
	}

}