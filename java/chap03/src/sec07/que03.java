package sec07;

import java.util.Scanner;

public class que03 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int n = 0;
		int sum = 0;

		do {
			System.out.print("���� ������ �Է��ϼ��� : ");
			n = in.nextInt();
			if (n % 2 == 0) {
				sum += n;
			}
		} while (n != 0);

		System.out.println("�Է��� ���� ���� �߿��� ¦���� ���� " + sum);
	}

}
