package calendar_ex02;

import java.util.Calendar;

public class CalendarTest2 {

	public static void main(String[] args) {

		int year, month;
		int firstDay, dayOfMonth;
		Calendar c = Calendar.getInstance();
		int daysOfWeek = 0;

		if (args.length != 2) {
			System.out.println("[����] java CalendarTest �� ��");
			year = 2021;
			month = 1;
		} else {
			year = Integer.parseInt(args[0]);
			month = Integer.parseInt(args[1]);
		}

		c.set(year, month - 1, 1);
		firstDay = c.get(Calendar.DAY_OF_WEEK);
		dayOfMonth = c.getActualMaximum(Calendar.DATE);
		System.out.println("\t" + year + "��" + month + "��");
		System.out.println(" �� �� ȭ �� �� �� ��");
		System.out.println("==================");
		for (int i = 1; i < firstDay; i++) {
			System.out.print(" ");
			daysOfWeek++;
		}
		for (int i = 1; i <= dayOfMonth; i++) {
			System.out.printf("%4d", i);
			daysOfWeek++;
			if (daysOfWeek % 7 == 0) {
				System.out.println();
			}
		}
	}

}
