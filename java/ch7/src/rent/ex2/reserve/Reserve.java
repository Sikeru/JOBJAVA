//package rent.ex2.reserve;
//
//import rent.ex2.base.Base;
//import rent.ex2.common.DataUtil;
//
//public class Reserve extends Base implements Reserveface {
//	String resData;
//
//	public String reserveCar(ResVo vo) {
//		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ����" + vo.useBeginDate
//				+ ", " + "�� �ݳ� ���� : " + vo.returnDate;
//
//		DataUtil.encodeData(resData);
//		System.out.println("����ī ����ð� : " + showTime());
//		System.out.println("���� �����մϴ�.");
//		DataUtil.decodeData(resData);
//
//		return resData;
//	}
//
//	public String modReserveInfo(ResVo vo) {
//		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ����" + vo.useBeginDate
//				+ ", " + "�� �ݳ� ���� : " + vo.returnDate;
//
//		DataUtil.encodeData(resData);
//		System.out.println("����ī ���� ���� ���� �ð� : " + showTime());
//		System.out.println("���� �����մϴ�.");
//		DataUtil.decodeData(resData);
//
//		return resData;
//
//	}
//
//	public String canlReserveInfo(ResVo vo) {
//		resData = "���� ����ȣ : " + vo.resCarNumber + ", " + "���� ��¥ : " + vo.resDate + ", " + "�̿� ���� ����" + vo.useBeginDate
//				+ ", " + "�� �ݳ� ���� : " + vo.returnDate;
//
//		DataUtil.encodeData(resData);
//		System.out.println("����ī ����ð� : " + showTime());
//		System.out.println("���� �����մϴ�.");
//		DataUtil.decodeData(resData);
//
//		return resData;
//	}
//}
