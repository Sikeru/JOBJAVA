package ex05;

public class YourCarTest {

	public static void main(String[] args) {
		Car yourCar;
		yourCar = new Car("�׷���", "������", 2500, 60);

//		yourCar.setCarName("�׷���");
//		yourCar.setCarColor("������");
//		yourCar.setCarSize(2500);
//		yourCar.setVelocity(60);

		String carName = yourCar.getCarName();
		String carColor = yourCar.getCarColor();
		int carSize = yourCar.getCarSize();
		int velocity = yourCar.getVelocity();
		yourCar.speedUp();
		yourCar.speedUp();
		velocity = yourCar.getVelocity();

		System.out.println("��� �� ���� ��� : ");
		System.out.println("�� �̸� : " + carName + ", ���� : " + carColor + ", ��ⷮ : " + carSize + "cc" + ", ����ӵ� : "
				+ velocity + "�Դϴ�.");
	}

}
