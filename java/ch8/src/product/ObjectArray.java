package product;

public class ObjectArray {
	public static void main(String args) {
		String code = null;
		String name = null;
		String color = null;
		int qty = 0;

		Object object[] = new Object[5];
		Product prod0 = new Product();
		Product prod1 = new Product();
		Product prod2 = new Product();

		object[0] = "ȫ�浿";
		object[1] = prod0;
		object[2] = prod1;
		object[3] = prod2;
		object[4] = new Integer(123);
		System.out.println("Object �迭�� ������ ��ǰ ���� ���");
		System.out.println();
	}
}
