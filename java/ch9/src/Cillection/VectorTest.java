package Cillection;

import java.util.Vector;

import javaextra.MyStudent;

public class VectorTest {
	public static void main(String[] args) {
		Vector v = new Vector();
		v.add("ȫ�浿");
		v.addElement("�̼���");
		v.addElement(new Integer(123));
		v.addElement("ȫ�浿");
		v.addElement(new Integer(123));
		v.addElement(new MyStudent());

		for (int i = 0; i < v.size(); i++) {
			System.out.println(v.get(i));
		}
		System.out.println(v);
	}

}
