  package com.lec.ex1_string;
// String�� new �� �������� �ʰ� " " �� ����� ���ڿ� ����� �̿�. �ڵ����� �������� String ��ü�� �̹� �����ϴ� �� Ȯ���ϰ� 
// �̹� �����ϴ� ���ڿ� ��ü�� ����. �������� ������ String ��ü ����



public class Ex01 {
	public static void main(String[] args) {
		String str1 = "Java"; // str1������ 
		String str2 = "Java";
		String str3 = new String("Java"); // ������ ��ü ����
		if(str1==str2) {
			System.out.println("str1��str2�� ���� �ּҰ��� ����");
		}else {
			System.out.println("str1��str2�� �ٸ� �ּҰ��� ����");
		}
		if(str1.equals(str2)) {
			System.out.println("���� ���ڿ�");
		}
		System.out.println(str1 == str3? "str1��3�� ���� �ּ� ":"str1��3�� �ٸ��ּҰ�!!!"); //�ٸ��ּ�
		System.out.println(str1.equals(str3)? "���� ��Ʈ��" : " �ٸ� ���ڿ�"); // ���� ��Ʈ��
	}
}