package ex14;

public class StudentTest2 {

	public static void main(String[] args) {
		Student s = new University("ȫ�浿", 3, 20);

//		System.out.println(s.getCourses);
		University u = (University) s;
		System.out.println("������ >>" + u.getCourses() + "��");
	}

}
