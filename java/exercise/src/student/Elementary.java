package student;

public class Elementary extends Student {

	public static void main(String[] args) {
		System.out.println("Elementary ������ ȣ��");
//		super.name = name;
//		super.grade = grade;
//		super.teacher = teacher;
	}

	public String getTeacher() {
		return "���Ӽ����� : " + super.teacher;
	}
}
