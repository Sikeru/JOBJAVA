package product;

public class ProductArray1 {

	public static void main(String[] args) {
		String code = null;
		String name = null;
		String color = null;
		int qty = 0;
		String[] str = new String[3];
		Product[] product = new Product[3];

		Product prod0 = new Product();
		Product prod1 = new Product("0002", "����Ʈ TV", "���", 200);
		Product prod2 = new Product("0003", "��Ʈ��", "����", 100);

		str[0] = "ȫ�浿";
		str[1] = "�̼���";
		str[2] = "�Ӳ���";

		product[0] = prod0;
		product[1] = prod1;
		product[2] = prod2;
		System.out.println("�迭�� ������ ��ǰ ���� ���");
		System.out.println();

		for (int i = 0; i < product.length; i++) {
			Product prod = product[i];
			code = prod.getCode();
			name = prod.getName();
			color = prod.getColor();
			qty = prod.getQty();
			System.out.println("��ǰ��ȣ" + code);
			System.out.println("��ǰ�̸�" + name);
			System.out.println("��ǰ����" + color);
			System.out.println("��ǰ����" + qty);
			System.out.println();
		}
	}

}
