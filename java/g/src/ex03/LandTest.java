package ex03;

public class LandTest {

	public static void main(String[] args) {
		float my_total_tax = 0f;
		int my_land_type = 1;
		int my_land_size = 25000;
		int my_land_own_year = 5;
		float your_total_tax = 0f;
		int your_land_type = 2;
		int your_land_size = 15000;
		int your_land_own_year = 3;

		LandTaxUtil util = new LandTaxUtil();
		my_total_tax = util.calcLandTax(my_land_type, my_land_size, my_land_own_year);
		System.out.println("�� ���� ����������" + my_total_tax + "�Դϴ�");
		System.out.printf("�� ���� ��������>>%5.1f�� �Դϴ�.\n", my_total_tax);

		your_total_tax = util.calcLandTax(your_land_type, your_land_size, your_land_own_year);
		System.out.println("�� ���� ����������" + your_total_tax + "�Դϴ�");
		System.out.printf("�� ���� ��������>>%5.1f�� �Դϴ�.", your_total_tax);
	}

}
