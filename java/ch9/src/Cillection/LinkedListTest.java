package Cillection;

import java.util.LinkedList;

public class LinkedListTest {

	public static void main(String[] args) {
		LinkedList fruitList = new LinkedList();

		fruitList.add("���");
		fruitList.add("�ٳ���");
		fruitList.add("����");
		fruitList.add(2, "����");

		int position = fruitList.indexOf("����");
		System.out.println("������ ��ġ : " + position);
		fruitList.set(0, "������");

		String fruitName = (String) fruitList.get(0);
		System.out.println("�����̸�: " + fruitName);
		fruitList.remove(1);
		fruitList.remove("����");
		int size = fruitList.size();
		System.out.println("���Ḯ��Ʈ �� ����ϱ�");

		for (int cnt = 0; cnt < size; cnt++) {
			fruitName = (String) fruitList.get(cnt);
			System.out.println(fruitName);
		}
	}

}