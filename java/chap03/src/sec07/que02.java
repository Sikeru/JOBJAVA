package sec07;

import java.util.Scanner;

public class que02 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int rank = 0;

		System.out.print("����� �Է����ּ��� ");
		rank = in.nextInt();

		switch (rank) {
		case 1 -> System.out.println("�������߽��ϴ�.");
		case 2, 3 -> System.out.println("���߽��ϴ�.");
		case 4, 5, 6 -> System.out.println("�����Դϴ�.");
		default -> System.out.println("����� �ʿ��մϴ�.");
		}

	}

}
