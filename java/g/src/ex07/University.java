package ex07;

public class University extends Student {
	private int courses;

	public University(String _name, int _grade, int _courses) {
		System.out.println("University ������ ȣ��");
		name = _name;
		grade = _grade;
		courses = _courses;
	}

	public int getCourses() {
		return courses;
	}
}
