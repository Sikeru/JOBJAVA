package sec07;

import java.util.Scanner;

public class ex9 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int maj = 0, lib = 0, gen = 0;
		int sum = 0;
		String res;

		System.out.print("���� �̼� ���� : ");
		maj = in.nextInt();
		System.out.print("���� �̼� ���� : ");
		lib = in.nextInt();
		System.out.print("�Ϲ� �̼� ���� : ");
		gen = in.nextInt();
		sum = maj + lib + gen;
		res = (sum >= 140 && maj >= 70 && lib >= 30 && gen >= 30 || lib + gen >= 80) ? "���� ����" : "���� �Ұ�";

		System.out.println(res);
	}

}
