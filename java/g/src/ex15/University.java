package ex15;

public class University extends Student {
	private int courses;

	public University(String _name, int _grade, int _courses) {
		System.out.println("University ������ ȣ��");
		name = _name;
		grade = _grade;
		courses = _courses;
	}

	public University() {
		this("�̼���", 2, 20);
	}

	public int getCourses() {
		return courses;
	}

	public String getStudInfo() {
		System.out.println("UnivUersity Ŭ������ getStudInfo �޼���ȣ��");
		return "�̸���>>" + name + ", �г���>>" + grade + ", ��û������>>" + courses;
	}
}
