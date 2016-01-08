import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.text.ParseException;


public class DownloadGas {

	public static void main(String[] args) throws IOException {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		boolean ok = true;

		try {
			format.parse(args[0]);
			format.parse(args[1]);
		} catch (ParseException e) { ok = false; }

		try {
			if (ok) {
				System.out.println("Starting downloading...\n\n");

				String fileName = "gaz_data.csv";


				URL link = new URL("http://www.smart.grtgaz.com/api/v1/fr/consommation/export/Zone.csv?startDate=" + args[0] + "&endDate=" + args[1] + "&range=daily"); //The file that you want to download

				//Code to download
				InputStream in = new BufferedInputStream(link.openStream());
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				byte[] buf = new byte[1024];
				int n = 0;
				while (-1 != (n = in.read(buf))) {
					out.write(buf, 0, n);
					System.out.print("*");
				}
				out.close();
				in.close();
				byte[] response = out.toByteArray();

				FileOutputStream fos = new FileOutputStream(fileName);
				fos.write(response);
				fos.close();
				//End download code

				System.out.println("\n\nFinished");

			}
			else System.out.println("Bad date format, aborting...");
		}catch (Exception e) {e.printStackTrace();}


	}
}