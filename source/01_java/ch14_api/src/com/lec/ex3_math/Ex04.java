package com.lec.ex3_math;

import java.util.Random;

// �ζǹ�ȣ 6�� �̱�
public class Ex04 {
	public static void main(String[] args) {
		int [] lotto = new int[6];
		Random random = new Random();
		for(int idx = 0 ; idx<lotto.length; idx++) {
			lotto[idx] = random.nextInt(45)+1;
		}
		for(int i = 0 ; i < lotto.length ; i ++) {
			for(int j = i+1 ; j < lotto.length ; j ++) {
				if(lotto[i] > lotto[j]) {// i ��°���� j��° ������ ũ�� �ٲ�
					int temp = lotto[i];//
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}//�������� ��
		}
		for(int l : lotto) {
			System.out.print(l+" ");
		}
	}
}