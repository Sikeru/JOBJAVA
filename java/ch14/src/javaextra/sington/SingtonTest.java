package javaextra.sington;

public class SingtonTest {

	public static void main(String[] args) {
		System.out.println("ù ��° getInstance() ȣ��");
		MySingleton a = MySingleton.getInstance();
		System.out.println("�� ��° getInstance() ȣ��");
		MySingleton b = MySingSingleton.getInstance();

		if (a == b) {
			System.out.println("�� �̱����� ������ ��ü�Դϴ�.");
		}
	}

}
