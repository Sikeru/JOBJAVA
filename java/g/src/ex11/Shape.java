package ex11;

public class Shape {
	protected float area;

	public void printArea() {
		System.out.println("������ ���̴� " + area + "�Դϴ�.");
	}

	public void calcArea(float width, float height) {
		this.area = width * height;
	}
}
