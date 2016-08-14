import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;
import java.text.SimpleDateFormat;

public class TimezoneUtil {

	private static final String TIMEZONE_ID_PREFIXES = "^(Africa|America|Asia|Atlantic|Australia|Europe|Indian|Pacific)/.*";

	private static List<TimeZone> timeZones;

	public static List<TimeZone> getTimeZones() {

		if (timeZones == null) {

			timeZones = new ArrayList<TimeZone>();

			final String[] timeZoneIds = TimeZone.getAvailableIDs();

			for (final String id : timeZoneIds) {

				if (id.matches(TIMEZONE_ID_PREFIXES)) {

					timeZones.add(TimeZone.getTimeZone(id));

				}

			}

			Collections.sort(timeZones, new Comparator<TimeZone>() {

				public int compare(final TimeZone t1, final TimeZone t2) {

					return t1.getID().compareTo(t2.getID());

				}

			});

		}

		return timeZones;

	}

	public static String getName(TimeZone timeZone) {

//		return timeZone.getID().replaceAll("_", " ") + " - "
//				+ timeZone.getDisplayName();
		
		return timeZone.getID() + " - "
		+ timeZone.getDisplayName();

	}

	public static void main(String[] args) {

		timeZones = getTimeZones();

		for (TimeZone timeZone : timeZones) {

			System.out.println(getName(timeZone));

		}

	}

}