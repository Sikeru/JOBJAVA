package sec07;

import java.util.Scanner;

public class que07 {

	public static void main(String[] args) {
		String c = input("ö��");
		String y = input("����");
		whosWin(c, y);
	}

	public static String input(String p) {
		Scanner in = new Scanner(System.in);

		System.out.print(p + " : ");
		return in.nextLine();
	}

	public static void whosWin(String p1, String p2) {
		if (p1.equals(p2))
			System.out.println("�����ϴ�.");
		else if (p1.equals("����")) {
			if (p2.equals("����"))
				System.out.println("����, ��!");
			else
				System.out.println("ö��, ��!");
		} else if (p1.equals("����")) {
			if (p2.equals("����"))
				System.out.println("ö��, ��!");
			else
				System.out.println("����, ��!");
		} else if (p1.equals("��")) {
			if (p2.equals("����"))
				System.out.println("����, ��!");
			else
				System.out.println("ö��, ��!");
		}
	}

}
