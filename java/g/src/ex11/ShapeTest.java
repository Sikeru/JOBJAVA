package ex11;

public class ShapeTest {

	public static void main(String[] args) {
		int width = 10;
		int hight = 20;

		Rectangle rec = new Rectangle();
		rec.calcArea(width, hight);
		rec.printArea();
//		System.out.println("�簢���� ���̴� " + rec.printArea());

		Triangle tri = new Triangle();
		tri.calcArea(width, hight);
		tri.printArea();
//		System.out.println("�ﰢ���� ���̴� " + tri.printArea());
	}

}
