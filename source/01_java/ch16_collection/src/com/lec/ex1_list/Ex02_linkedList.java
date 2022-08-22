package com.lec.ex1_list;

import java.util.ArrayList;
import java.util.LinkedList;

public class Ex02_linkedList {
	public static void main(String[] args) {
		ArrayList<String> arrayList = new ArrayList<String>(); 
		LinkedList<String> linkedList = new LinkedList<String>();
		linkedList.add("str0"); // 0�� �ε���
		linkedList.add("str1"); // 1�� �ε���
		linkedList.add("str2"); // 2�� �ε���
		linkedList.add("str3"); // 3�� �ε���
		System.out.println(linkedList);
		for(String list : linkedList) {
			System.out.println(list);
			
		}
		linkedList.clear();
		System.out.println(linkedList.isEmpty()? "�����Ͱ� �����ϴ�" : "�����Ͱ� �ֽ��ϴ�");
	} 
}