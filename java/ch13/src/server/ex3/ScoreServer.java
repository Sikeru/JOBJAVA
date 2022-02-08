package server.ex3;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class ScoreServer {
	public static ArrayList<String> calcScore(List<Student> list) {

		Student st = null;
		ArrayList<String> _sList = new ArrayList<String>();

		int length = list.size();
		String[] name = new String[length];
		int[] score = new int[length];
		int[] subNum = new int[length];
		String sName = null;
		int point = 0;

		for (int i = 0; i < list.size(); i++) {
			st = (Student) list.get(i);
			sName = st.getName();
			point = st.getPoint();
			for (int j = 0; j < length; j++) {
				if (sName.equals(name[j])) {
					score[j] += point;
					subNum[j]++;
					break;
				} else if (name[j] == null) {
					name[j] = sName;
					score[j] += point;
					subNum[j]++;
					break;
				}
			}

		}

		for (int i = 0; i < length; i++) {
			if (name[i] != null) {
				String res = "�̸� : " + name[i] + "���� : " + score[i] + "�̸� : " + subNum[i] + "�̸� : "
						+ ((float) score[i] / subNum[i]);
				_sList.add(res);
			}
		}
		return _sList;
	}

	public static void main(String[] args) {
		try {
			System.out.println("�����ϱ� ���� �غ����Դϴ�.");
			ServerSocket serverSocket = new ServerSocket(5434);
			System.out.println("������ �������Դϴ�.");

			Socket s1 = serverSocket.accept();

			ObjectInputStream ois = new ObjectInputStream(s1.getInputStream());
			ObjectOutputStream oos = new ObjectOutputStream(s1.getOutputStream());

			List sList = (ArrayList) ois.readObject();
			oos.writeObject(calcScore(sList));

			oos.close();
			s1.close();
		} catch (ClassNotFoundException eof) {
			System.out.println("Client�� ���� ������ ���������ϴ�. �����մϴ�...");
			System.exit(0);
		} catch (IOException io) {
			io.printStackTrace();
		}

	}

}
