package ex05;

public class MyCarTest {

	public static void main(String[] args) {
		Car myCar;
		myCar = new Car();
		myCar.setCarName("�ҳ�Ÿ");
		myCar.setCarColor("����");
		myCar.setCarSize(2000);
		myCar.setVelocity(60);

		String carName = myCar.getCarName();
		String carColor = myCar.getCarColor();
		int carSize = myCar.getCarSize();
		int velocity = myCar.getVelocity();
		myCar.speedUp();
		myCar.speedUp();
		velocity = myCar.getVelocity();

		System.out.println("�� �� ���� ��� : ");
		System.out.println("�� �̸� : " + carName + ", ���� : " + carColor + ", ��ⷮ : " + carSize + "cc" + ", ����ӵ� : "
				+ velocity + "�Դϴ�.");
	}

}
