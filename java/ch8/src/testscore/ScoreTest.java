package testscore;

public class ScoreTest {
	public MyStudent calcTotal(String name, int kor, int eng) {
		MyStudent myStudent = new MyStudent();
		myStudent.name = name;
		myStudent.kor = kor;
		myStudent.eng = eng;
		myStudent.total = kor + eng;
		return myStudent;
	}

	public static void main(String[] args) {
		MyStudent lee, hong;
		ScoreTest s = new ScoreTest();
		lee = s.calcTotal("�̼���", 80, 90);
		System.out.println(lee.toString());
		hong = s.calcTotal("ȫ�浿", 70, 83);
		System.out.println(hong.toString());
	}

}
