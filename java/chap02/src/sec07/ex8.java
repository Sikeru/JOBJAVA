package sec07;

import java.util.Scanner;

public class ex8 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int n = 0;
		int a = 0, b = 0, c = 0;
		int sum = 0;

		System.out.print("0~999 ������ ���ڸ� �Է��ϼ��� : ");
		n = in.nextInt();

		a = n / 100;
		b = (n - a * 100) / 10;
		c = n - b * 10 - a * 100;
		sum = a + b + c;

		System.out.println("�� �ڸ����� �� = " + sum);
	}

}
