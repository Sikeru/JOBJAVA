package sec07;

import java.util.Scanner;

public class ex3 {

	public static void main(String[] args) {
		final double PI = 3.14159;
		double r = 0.0, h = 0.0, v = 0.0;
		Scanner in = new Scanner(System.in);

		System.out.print("������� �ظ��� ��������? ");
		r = in.nextDouble();
		System.out.print("������� �ظ��� ���̴�? ");
		h = in.nextDouble();
		v = PI * r * r * h;

		System.out.print("������� �ظ��� ���Ǵ�? " + v);

	}

}
