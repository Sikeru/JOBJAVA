package sec04;

import java.util.Scanner;

public class ScannerDemo2 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		System.out.print("���ڿ� �Է�: ");
		String str = in.nextLine();
		System.out.println(str);

		System.out.print("���� �Է�: ");
		int i = in.nextInt();
		System.out.println(i);

		System.out.print("�Ǽ� �Է�: ");
		double j = in.nextDouble();
		System.out.println(j);

	}

}
