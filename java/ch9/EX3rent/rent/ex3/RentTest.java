package rent.ex3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import rent.ex3.common.exception.RentException;
import rent.ex3.member.MemberException;
import rent.ex3.member.MemberVo;
import rent.ex3.member.Memberface;
import rent.ex3.member.Memberlmpl;

public class RentTest {

	public static void main(String[] args) {
		String memInfo;
		String carInfo;
		String resInfo;
		int selectltem = 1;

		while (true) {
			System.out.println("����� �����ϼ��� . \n 1.ȸ������, 2.����ī ����, 3.�������, 4.�Ϸ�");
			Scanner scanner = new Scanner(System.in);
			selectltem = Integer.parseInt(scanner.nextLine());
			switch (selectltem) {
			case 1:
				try {
					member();
				} catch (RentException e) {
					e.getRentExceptionInfo();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				System.exit(1);
				break;
			}
		}

	}

	private static void member() throws IOException, RentException, MemberException {
		Memberface member = new Memberlmpl();
		MemberVo memVo = null;
		int selectltem = 1;

		System.out.println("���� ����� �����ϼ���. \n 1.ȸ�� ���, 2.ȸ����ȸ, 3.ȸ�� ����, 4.ȸ�� ����, 5.�ǵ��ư���");

		Scanner scanner = new Scanner(System.in);
		selectltem = Integer.parseInt(scanner.nextLine());
		switch (selectltem) {
		case 1:
			String data = null;
			System.out.println("ȸ�� ������ �Է��ϼ���.");
			memVo = new MemberVo();

			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("���̵� �Է��ϼ��� :");
			data = in.readLine();
			memVo.setId(data);

			System.out.print("��й�ȣ�� �Է��ϼ��� :");
			data = in.readLine();
			memVo.setPassword(data);

			System.out.print("�̸��� �Է��ϼ��� :");
			data = in.readLine();
			memVo.setName(data);

			System.out.print("�ּҸ� �Է��ϼ��� :");
			data = in.readLine();
			memVo.setAddress(data);

			System.out.print("��ȭ��ȣ�� �Է��ϼ��� :");
			data = in.readLine();
			memVo.setPhoneNum(data);

			member.regMember(memVo);
			break;

		case 2:
			String memData = member.viewMember(memVo);
			System.out.println("ȸ������ : ");
			System.out.println("===============");
			System.out.println(memData);
			break;

		case 5:
			break;
		}

	}

}
