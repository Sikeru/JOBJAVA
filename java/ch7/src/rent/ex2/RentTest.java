package rent.ex2;

import rent.ex2.base.Base;
import rent.ex2.car.CarVo;
import rent.ex2.car.Carface;
import rent.ex2.car.Carlmpl;
import rent.ex2.member.MemberVo;
import rent.ex2.member.Memberface;
import rent.ex2.member.Memberlmpl;
import rent.ex2.reserve.ResVo;
import rent.ex2.reserve.Reserveface;
import rent.ex2.reserve.Reservelmpl;

public class RentTest {

	public static void main(String[] args) {
		String memInfo;
		String carInfo;
		String resInfo;
		/*
		 * �������̽� ���� �ڵ� MemberVo memVo = new MemberVo("hong", "1234", "ȫ�浿", "����� ���α�",
		 * "010-1111-2222");
		 * 
		 * Member member = new Member(); member.regMember(memVo); memInfo =
		 * member.viewMember(memVo); member.displayData(memInfo);
		 * 
		 * CarVo carVo = new CarVo("1��1111", "�ƹݶ�", "����", 2000, "����"); Car car = new
		 * Car(); car.regCarInfo(carVo); carInfo = car.checkCarInfo(carVo);
		 * car.displayData(carInfo);
		 * 
		 * ResVo resVo = new ResVo("1��1111", "2015-09-09", "2015-09-22", "2015-09-30");
		 * Reserve reserve = new Reserve(); resInfo = reserve.reserveCar(resVo);
		 * reserve.displayData(resInfo);
		 */
		MemberVo memVo = new MemberVo("hong", "1234", "ȫ�浿", "����� ���α�", "010-1111-2222");
		Memberface member = new Memberlmpl();
		member.regMember(memVo);
		memInfo = member.viewMember(memVo);
		((Base) member).displayData(memInfo);

		CarVo carVo = new CarVo("1��1111", "�ƹݶ�", "����", 2000, "����");
		Carface car = new Carlmpl();
		car.regCarInfo(carVo);
		carInfo = car.checkCarInfo(carVo);
		((Base) car).displayData(carInfo);

		ResVo resVo = new ResVo("1��1111", "2015-09-09", "2015-09-22", "2015-09-30");
		Reserveface reserve = new Reservelmpl();
		resInfo = reserve.reserveCar(resVo);
		((Base) reserve).displayData(resInfo);
	}

}
