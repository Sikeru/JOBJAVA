package rent.ex3.member;
//package rent.ex2.member;
//
//import rent.ex2.base.Base;
//import rent.ex2.common.DataUtil;
//
//public class Member extends Base {
//	String memData;
//
//	public void regMember(MemberVo vo) {
//		memData = "ȸ�� ���̵� : " + vo.id + "'  " + "ȸ�� ��� : " + vo.password + "'  " + "ȸ�� �̸� : " + vo.name + "'  "
//				+ "ȸ�� ��ȭ��ȣ : " + vo.phoneNum;
//		DataUtil.encodeData(memData);
//		System.out.println("ȸ�� ��Ͻð� : ");
//		System.out.println("ȸ�� �����մϴ�.");
//	}
//
//	public String viewMember(MemberVo vo) {
//		memData = vo.id + "' " + vo.name + "' " + vo.password + "' " + vo.phoneNum;
//		DataUtil.decodeData(memData);
//		System.out.println("ȸ�� ��ȸ�ð� : " + showTime());
//		return memData;
//	}
//
//	public void modMember(MemberVo vo) {
//		memData = vo.id + "' " + vo.name + "' " + vo.password + "' " + vo.phoneNum;
//
//		DataUtil.encodeData(memData);
//		System.out.println("ȸ�� �����ð� : " + showTime());
//		System.out.println("ȸ�� ������ �����մϴ�.");
//	}
//
//	public void delMember(MemberVo vo) {
//		memData = vo.id + "' " + vo.name + "' " + vo.password + "' " + vo.phoneNum;
//		DataUtil.decodeData(memData);
//
//		System.out.println("ȸ�� �����ð� : " + showTime());
//		System.out.println("ȸ�� ������ �����մϴ�.");
//	}
//}
