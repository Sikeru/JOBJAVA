package exception;

public class ThrowTest {

	public static void main(String[] args) {
		ArrayUtil t = new ArrayUtil();
		try {
			t.call();
			System.out.println("Hello");
		} catch (Exception e) {
			System.out.println("main �޼��忡�� ���� ó��");
		}
		System.out.println("World");
	}

}
