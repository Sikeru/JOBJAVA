package sec07;

import java.util.Scanner;

public class que01 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int age;

		System.out.print("���̸� �Է����ּ��� : ");
		age = in.nextInt();

		if (age >= 19)
			System.out.println("����");
		else
			System.out.println("�̼���");
	}

}
