package rent.ex2.car;

import rent.ex2.base.Base;
import rent.ex2.common.DataUtil;

public class Carlmpl extends Base implements Carface {
	String carData;

	public String checkCarInfo(CarVo vo) {
		carData = "����ȣ : " + vo.carNumber + ", " + "���̸� : " + vo.carName + ", " + "��ũ�� : " + vo.carSize + ", "
				+ "������ : " + vo.carColor + ", " + "������ : " + vo.carMaker;

		DataUtil.decodeData(carData);
		System.out.println("����ī ���� ��ȸ�ð� : " + showTime());
		System.out.println("����ī ������ ��ȸ�մϴ�.");

		return carData;
	}

	public void regCarInfo(CarVo vo) {
		carData = "����ȣ : " + vo.carNumber + ", " + "���̸� : " + vo.carName + ", " + "��ũ�� : " + vo.carSize + ", "
				+ "������ : " + vo.carColor + ", " + "������ : " + vo.carMaker;

		DataUtil.encodeData(carData);
		System.out.println("����ī ���� ��Ͻð� : " + showTime());
		System.out.println("����ī ����մϴ�.");
	}

	public void modCarInfo(CarVo vo) {
		carData = "����ȣ : " + vo.carNumber + ", " + "���̸� : " + vo.carName + ", " + "��ũ�� : " + vo.carSize + ", "
				+ "������ : " + vo.carColor + ", " + "������ : " + vo.carMaker;

		DataUtil.decodeData(carData);
		System.out.println("����ī ���� �����ð� : " + showTime());
		System.out.println("����ī ������ �����մϴ�.");

	}

	public void delCarInfo(CarVo vo) {
		carData = "����ȣ : " + vo.carNumber + ", " + "���̸� : " + vo.carName + ", " + "��ũ�� : " + vo.carSize + ", "
				+ "������ : " + vo.carColor + ", " + "������ : " + vo.carMaker;

		DataUtil.decodeData(carData);
		System.out.println("����ī ���� �����ð� : " + showTime());
		System.out.println("����ī ������ �����մϴ�.");
	}
}
