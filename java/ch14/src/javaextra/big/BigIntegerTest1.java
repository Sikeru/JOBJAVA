package javaextra.big;

import java.math.BigInteger;

public class BigIntegerTest1 {

	public static void main(String[] args) {
		System.out.println("�ִ� ���� : " + Long.MAX_VALUE);
		System.out.println("�ּ� ���� : " + Long.MIN_VALUE);
		BigInteger bValue1 = new BigInteger("100000000000000000");
		BigInteger bValue2 = new BigInteger("-99999999999999999");

		BigInteger addResult = bValue1.add(bValue2);
		BigInteger mulResult = bValue1.add(bValue2);
		System.out.println("ū ���� ���� ��� : " + addResult);
		System.out.println("ū ���� ���� ��� : " + mulResult);
	}

}
