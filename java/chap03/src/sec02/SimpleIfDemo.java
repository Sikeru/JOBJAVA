package sec02;

import java.util.Scanner;

public class SimpleIfDemo {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		System.out.print("���ڸ� �Է��ϼ��� : ");
		int n = in.nextInt();

		if (n % 2 == 0)
			System.out.println("¦��");
		else
			System.out.println("Ȧ��");

		System.out.println("����");

	}

}
