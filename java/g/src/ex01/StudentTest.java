package ex01;

public class StudentTest {

	public static void main(String[] args) {
		Student s = new Student("ȫ�浿");
		Student s2 = new Student("�̼���", 3);
		Student s3 = new Student("�ƹ���", 5, "��󤿤����");

		String name = s.getName();
		int grade = s.getGrade();

//		s.setName("�̼���");
		System.out.println("�л��� �̸��� " + name + " �г���" + grade);

		name = s2.getName();
		grade = s2.getGrade();
		System.out.println("�л��� �̸��� " + name + " �г���" + grade);

		name = s3.getName();
		grade = s3.getGrade();
		String address = s3.getAddress();
		System.out.println("�л��� �̸��� " + name + " �г���" + grade + " �ּҴ� " + address);
	}

}
