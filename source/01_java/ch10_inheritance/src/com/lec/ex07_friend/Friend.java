package com.lec.ex07_friend;

// this. : �� ��ü�� 
// this(): �� Ŭ������ ������ �Լ�
// super. : 
public class Friend {
	private String name;
	private String tel; //

	public Friend() {
		System.out.println("�Ű� ���� ���� ������ �Լ�");

	}

	public Friend(String name) {
		this();
		this.name = name;
		System.out.println("�Ű����� �ϳ�¥�� ������ �Լ�");
	}

	public Friend(String name, String tel) {
		this(name); // Friend(name) ȣ��
		this.tel = tel;
		System.out.println("�Ű����� �ΰ�¥�� ������ �Լ�");
	}
	public String infoString() {
		return "[�̸�]" + name + " [��ȭ] " + tel;
	}
}