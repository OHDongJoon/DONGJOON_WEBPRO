package com.lec.ex;
// API�� �̿��� �迭 ����  System.arraycopy(�����迭,��������idx,���纻�迭, ���纻idx, �氹��)
public class Ex04_array2 {
	public static void main(String[] args) {
		int[] score = {100,10,20,30,40};
		int[] s = new int[score.length ];
		//�ý��� ���ī�� �ҷ� (����  ,idx,����迭,����idx, �� ����
		//System.arraycopy(�����迭��ü, int ����������ġ, ���纻�迭��ü, int ���纻������ġ, int �������);
		System.arraycopy(score, 0 , s, 0,  score.length);
		s[0] = 999;
		for(int idx=0; idx<score.length ; idx++) {
			System.out.printf("score[%d]=%d\t s[%d]=%d\n", idx, score[idx], idx, s[idx]);
		}
		
	}

}