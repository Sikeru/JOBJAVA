package javaextra;

import java.util.ArrayList;
import java.util.List;

public class ForTest2 {

	public static void main(String[] args) {
		List<MyStudent> list = new ArrayList<MyStudent>();
		list.add(new MyStudent());
		list.add(new MyStudent("ȫ�浿", 2));
		list.add(new MyStudent("�Ӳ���", 2));
		list.add(new MyStudent("������", 2));
		list.add(new MyStudent("���θ�", 2));

		for (MyStudent st : list) {
			System.out.println(st);
		}
	}
}
