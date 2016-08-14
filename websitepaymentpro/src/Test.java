import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import java.text.SimpleDateFormat;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GregorianCalendar now = new GregorianCalendar();
		now.setTime(new Date());
		
		TimeZone tz = TimeZone.getTimeZone("America/Los_Angeles");
		System.out.println("Now:" + now.getTime());
		
		SimpleDateFormat sdfPayPalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		//Current timezone
		System.out.println("Currrent time: " + sdfPayPalFormat.format(now.getTime()));
		//GMT timezone
		sdfPayPalFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
		System.out.println("Time in GMT:" + sdfPayPalFormat.format(now.getTime()));
		//Merchant timezone
		sdfPayPalFormat.setTimeZone(TimeZone.getTimeZone("GMT-8"));
		System.out.println("Time in GMT-8:" + sdfPayPalFormat.format(now.getTime()));
		
		//Mechant timezone2
		sdfPayPalFormat.setTimeZone(TimeZone.getTimeZone("America/Los_Angeles"));
		System.out.println("Time in Pacific Time:" + sdfPayPalFormat.format(now.getTime()));		
	}

}
