package rent.ex3.reserve;

import rent.ex3.base.Base;
import rent.ex3.common.DataUtil;

public class Reservelmpl extends Base implements Reserveface {
	String resData;

	public String reserveCar(ResVo vo) {
		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ���� : "
				+ vo.useBeginDate + ", " + "�� �ݳ� ���� : " + vo.returnDate;

		DataUtil.encodeData(resData);
		System.out.println("����ī ����ð�" + showTime());
		System.out.println("���� �����մϴ�.");
		DataUtil.decodeData(resData);

		return resData;
	}

	public void modReserveInfo(ResVo vo) {
		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ���� : "
				+ vo.useBeginDate + ", " + "�� �ݳ� ���� : " + vo.returnDate;

		DataUtil.encodeData(resData);
		System.out.println("����ī ���� ���� ���� �ð�" + showTime());
		System.out.println("���� �����մϴ�.");
	}

	public void cancelReserveInfo(ResVo vo) {
		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ���� : "
				+ vo.useBeginDate + ", " + "�� �ݳ� ���� : " + vo.returnDate;

		DataUtil.decodeData(resData);
		System.out.println("����ī ����ð�" + showTime());
		System.out.println("���� �����մϴ�.");
	}
}
