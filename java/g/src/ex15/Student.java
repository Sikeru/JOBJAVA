package ex15;

public class Student {

	String name;
	int grade;

	public Student() {
		System.out.println("student ������ ȣ��");
	}

	public String getName() {
		return name;
	}

	public int getGrade() {
		return grade;
	}

	public String getStudInfo() {
		System.out.println("Student Ŭ������ getStudInfo() ȣ��");
		return "�̸�: " + name + "�г�: " + grade;
	}

	public void calcScore(Student s) {
		if (s instanceof University) {
			System.out.println("University ���� ���� ���ϱ�");
		} else if (s instanceof Elementary) {
			System.out.println("Elementary ���� ���� ���ϱ�");
		}
	}
}
