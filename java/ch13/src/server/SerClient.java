package server;

import java.io.InputStream;
import java.io.ObjectInputStream;
import java.net.ConnectException;
import java.net.Socket;

public class SerClient {

	public static void main(String[] args) {
		try {
			Socket s1 = new Socket("127.0.01", 5430);
			InputStream is = s1.getInputStream();
			ObjectInputStream dis = new ObjectInputStream(is);
			Employee p = (Employee) dis.readObject();
			System.out.println("�̸� : " + p.getName());
			System.out.println("�ּ� : " + p.getAddr());
			System.out.println("�ֹι�ȣ : " + p.getJumin());
			System.out.println("��ȭ��ȣ : " + p.getPhone());

			dis.close();
			s1.close();
		} catch (ConnectException connExc) {
			System.out.println("�������");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
