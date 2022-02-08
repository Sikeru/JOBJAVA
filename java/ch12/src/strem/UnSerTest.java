package strem;

import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Iterator;

public class UnSerTest {

	public static void main(String[] args) {
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File("serial.ser")));
			ArrayList list = (ArrayList) ois.readObject();

			Iterator ite = list.iterator();
			System.out.println("��� ���� ���\n");
			while (ite.hasNext()) {
				Employee p = (Employee) ite.next();
				System.out.println("�̸�" + p.getName());
				System.out.println("�ֹι�ȣ" + p.getJumin());
				System.out.println("�ּ�" + p.getAddr());
				System.out.println("��ȭ��ȣ" + p.getPhone());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
