package ex17;

public class StudentTest {

	public static void main(String[] args) {
		String sinsang = null;
		Person p1 = new Elementary("ȫ�浿", 2, "��", 15);
		Person p2 = new University("ȫ�浿", 3, 22, "��", 22);

		sinsang = ((Student) p1).getStudInfo();
		System.out.println("�л����� : " + sinsang);

		sinsang = ((Student) p2).getStudInfo();
		int courses = ((University) p2).getCourses();
		System.out.println("�л�����: " + sinsang + ", ����: " + courses + "��");
	}

}
