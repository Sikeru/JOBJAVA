package calendar_ex01;

import java.util.Calendar;

public class CalendarTest {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);

		System.out.println("���� ��¥�� >" + year + "��" + month + "��" + day + "��");
		System.out.println("���� ��¥�� >" + hour + "��" + min + "��" + sec + "��");

	}

}
