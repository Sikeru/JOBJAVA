package sec07;

import java.util.Scanner;

public class ex6 {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		double fah = 0.0, cel = 0.0;

		System.out.print("ȭ��(��F) �µ��� �Է����ּ��� : ");
		fah = in.nextDouble();
		cel = 5.0 / 9.0 * (fah - 32);

		System.out.print("ȭ��(��C) �µ��� " + cel);
	}

}
