package sec06;

public class IncrementDemo {

	public static void main(String[] args) {
		int x = 0;
		System.out.println("increment() �޼��带 ȣ���ϱ� ���� x��" + x);
		x = increment(x);
		System.out.println("increment() �޼��带 ȣ���ϱ� ���� x��" + x);
	}

	public static int increment(int n) {
		System.out.println("increment() �޼��带 ȣ���ϱ� ���� n��" + n);
		n++;
		System.out.println("increment() �޼��带 ȣ���ϱ� ���� n��" + n);
		return n;
	}
}
