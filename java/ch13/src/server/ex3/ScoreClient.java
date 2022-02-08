package server.ex3;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class ScoreClient {
	public static void main(String[] args) throws IOException {

		if (args.length == 0) {
			System.out.println("���� : java SimpleClient [server_name]");
			System.out.println("server_name�� �Է��Ͻ��� �����ż� localhost�� ������ �õ��մϴ�.");
			args = new String[] { "127.0.0.1" };
		}

		List sList = new ArrayList();

		sList.add(new Student("ȫ�浿", 3, "����", 80));
		sList.add(new Student("�̼���", 3, "����", 90));
		sList.add(new Student("�Ӳ���", 3, "����", 78));
		sList.add(new Student("ȫ�浿", 3, "����", 76));
		sList.add(new Student("�Ӳ���", 3, "����", 56));
		sList.add(new Student("ȫ�浿", 3, "����", 70));
		sList.add(new Student("�̼���", 3, "����", 67));
		sList.add(new Student("�Ӳ���", 3, "����", 77));

		try {
			Socket s1 = new Socket(args[0], 5539);
			ObjectOutputStream oos = new ObjectOutputStream(s1.getOutputStream());
			ObjectInputStream ois = new ObjectInputStream(s1.getInputStream());

			oos.writeObject(sList);
			List list = (ArrayList) ois.readObject();

			for (int i = 0; i < list.size(); i++) {
				String str = (String) list.get(i);
				System.out.println(str);
			}

			ois.close();
			s1.close();
		} catch (ClassNotFoundException eof) {
			System.out.println("Server�� ���� ������ ���������ϴ�. �����մϴ�...");
			System.exit(0);
		} catch (IOException io) {
			io.printStackTrace();
		}

	}

}
