package Shape;

public class ShapeTest {

	public static void main(String[] args) {
		float area = 0.0f;
		int width = 20;
		int height = 30;

		Shape s = new Rectangle();
		area = s.calcArea(width, height);
		System.out.println("�簢���� ���̴�" + area);

		s = new Triangle();
		area=s.calcArea(width, height);
		System.out.println("�ﰢ���� ���̴�"+area);
	}

}
