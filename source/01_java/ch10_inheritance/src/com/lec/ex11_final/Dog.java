package com.lec.ex11_final;
//Animal�� ���� speed , running() , stop() ��� ����
public class Dog extends Animal {
	@Override
	public void running() {
		//speed += 10; �̰� ��
		setSpeed(getSpeed()+10);
		System.out.println("�������� ������ ���� �پ��. ����ӵ� :"+getSpeed());
 	} 
	
}