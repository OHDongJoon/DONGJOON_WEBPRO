package com.lec.ex01;

//CONSTANT_STRING �߻� method1
//CONSTANT_NUM �߻� method2
// �������� �������մ� Ex1 Ex2 �̷��� �����ӿ� ����
public class InterfaceClass implements InterfaceEX1, InterfaceEx2 {

	@Override
	public String method2() {
		System.out.println("���� ������ implements�� Ŭ���������ؿ�. method2");
		return null;
	}

	@Override
	public void method1() {
		System.out.println("���� ������ implements ���� Ŭ�������� �ؿ� method1");

	}

}