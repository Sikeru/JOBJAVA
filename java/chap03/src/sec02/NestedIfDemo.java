package sec02;

import java.util.Scanner;

public class NestedIfDemo {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		System.out.print("������ �Է��ϼ��� ");
		int s = in.nextInt();

		if (s >= 90)
			System.out.println("����� ������ A");
		else {
			if (s >= 80)
				System.out.println("����� ������ B");
			else {
				if (s >= 70)
					System.out.println("����� ������ C");
				else {
					if (s >= 60)
						System.out.println("����� ������ D");
					else
						System.out.println("����� ������ F");
				}
			}
		}
	}

}
