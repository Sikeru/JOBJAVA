package ex09;

public class Triangle extends Shape {
//	private float area;
//
//	public void printArea() {
//		System.out.println("�ﰢ���� ���̴� " + this.area + "�Դϴ�.");
//	}

	public void calcTriangle(float width, float height) {
		this.area = width * height / 2.0f;
	}

}
