package ex07;

public class StudentTest {

	public static void main(String[] args) {
		String sinsang = null;
		String gender = null;
		int age = 0;
		Elementary e = new Elementary("�̼���", 2, "��", 15);
//		University u = new University("ȫ�浿", 3, 20);

		sinsang = e.getStudInfo();
		System.out.println("�л� ����: " + sinsang);
//		sinsang = u.getStudInfo();
		gender = e.getGender();
		age = e.getAge();
		System.out.println("�л��� ���� : " + gender + ", �л��� ���� : " + age);
	}

}
