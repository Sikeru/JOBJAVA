package Cillection;

import java.util.Iterator;
import java.util.TreeSet;

public class TreeSetTest {

	public static void main(String[] args) {
		TreeSet ts = new TreeSet();
		ts.add("ȫ�浿");
		ts.add("������");
		ts.add("���缮");
		ts.add("���缮");
		ts.add("�ڸ��");
		ts.add("������");
		ts.add("ȫ�浿");

		Iterator ite = ts.iterator();
		System.out.println("������������ ����ϱ�");
		while (ite.hasNext()) {
			System.out.println(ite.next());
		}

		System.out.println("\n������������ ����ϱ�");
		Iterator ite2 = ts.descendingIterator();
		while (ite2.hasNext()) {
			System.out.println(ite2.next());
		}
		System.out.println(ts);
	}

}
