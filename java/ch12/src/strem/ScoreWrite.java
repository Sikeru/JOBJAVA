package strem;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class ScoreWrite {

	public static void main(String[] args) {
		int count = 1;
		String scoreDate = "";
		String s = null;
		File file = new File("scoreData.txt");
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			PrintWriter out = new PrintWriter(new FileWriter(file, false));
			do {
				System.out.println(count + " ��° ������ �Է��ϼ���");
				s = in.readLine();
				if (isRealNumber(s)) {
					if (count != 10) {
						scoreDate += s + ",";
					} else {
						scoreDate += s;
					}
					count++;
				} else {
					System.out.println("���ڸ� �Է� �����մϴ�.");
				}
			} while (count <= 10);

			out.println(scoreDate);
			in.close();
			out.close();
		} catch (IOException e) {
			System.out.println("IOException");
		}
		System.out.println("���������� ���Ϸ� ����մϴ�.");
	}

	public static boolean isRealNumber(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

}
