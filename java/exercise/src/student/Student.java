package student;

public abstract class Student {
	String name;
	int grade;
	String teacher;

	public Student() {
		System.out.println("Student ������ ȣ��");
	}

	public String getName() {
		return name;
	}

	public int getGrade() {
		return grade;
	}

	public String getStudlnfo() {
		System.out.println("Student Ŭ������ getStudInfo() �޼��� ȣ��");
		return "�̸��� : " + name + ", �г���" + grade;
	}

	public abstract String getTeacher();
}
