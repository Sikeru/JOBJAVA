package rent.ex3.car;

import rent.ex3.base.Base;
import rent.ex3.common.DataUtil;

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
