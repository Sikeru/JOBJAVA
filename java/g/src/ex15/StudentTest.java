package ex15;

public class StudentTest {

	public static void main(String[] args) {
		University u = new University("ȫ�浿", 2, 24);
		Elementary e = new Elementary("������", 23);

		u.calcScore(u);
		e.calcScore(e);
	}

}
