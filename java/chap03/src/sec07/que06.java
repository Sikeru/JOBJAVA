package sec07;

import java.util.Scanner;

public class que06 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String p1 = null, p2 = null;

		System.out.print("ö�� : ");
		p1 = in.nextLine();
		System.out.print("���� : ");
		p2 = in.nextLine();

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
