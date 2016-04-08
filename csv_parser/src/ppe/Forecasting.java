/**
 * COVERED SOFTWARE IS PROVIDED UNDER THE CDDL LICENSE ON AN AS IS BASIS, 
 * WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, 
 * WITHOUT LIMITATION, WARRANTIES THAT THE COVERED SOFTWARE IS FREE OF DEFECTS, 
 * MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE RISK AS 
 * TO THE QUALITY AND PERFORMANCE OF THE COVERED SOFTWARE IS WITH YOU. SHOULD ANY 
 * COVERED SOFTWARE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY 
 * OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR CORRECTION. 
 * THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE. NO USE OF 
 * ANY COVERED SOFTWARE IS AUTHORIZED HEREUNDER EXCEPT UNDER THIS DISCLAIMER.
 */

package ppe;

import com.opencsv.CSVReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.bitpipeline.lib.owm.*;
import org.json.JSONException;

/**
* @author Guillaume Emery, Côme Arvis
* Class to recover data from OpenMapWeather using OWMClient
*/
public class Forecasting {

    private BufferedWriter out;
    private static final String FILENAME = "../res/csv/stations.csv";
    private static final String OUTPUT = "../res/csv/temp.csv";

    //private static final String FILENAME = "stations.csv";
    //private static final String OUTPUT = "temp.csv";

    private FileReader file;

    private static List<double[]> lat_lon;

    private int number_previsions;
    private int first_group;
    private int last_group;
    private int number_groups;

    public Forecasting() throws IOException {
        file = new FileReader(FILENAME);
        lat_lon = new ArrayList<>();
        CSVReader csvReader = new CSVReader(file);
        String[] row = null;

        while((row = csvReader.readNext()) != null) {
            double[] couple = new double[2];
            couple[0] = Double.valueOf(row[2]);
            couple[1] = Double.valueOf(row[3]);
            lat_lon.add(couple);
        }
        csvReader.close();

        out = new BufferedWriter(new FileWriter(OUTPUT, true));

    }

    public List<double[]> getLatLon() {
        return lat_lon;
    }


    public void clean() throws IOException {
        out.close();
    }

    public void fillFile(double lat, double lon) throws IOException, JSONException, ParseException {

        OwmClient owm = new OwmClient();
        String[][] data = new String[4][100];

        double temp;
        int i;
        double k = 0.0;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");


        WeatherForecastResponse forecastWeather = owm.ourForecasts(lat, lon);

        if (forecastWeather.hasForecasts()) {

            for (i = 0; i < forecastWeather.getForecasts().size(); i++) {
                temp = forecastWeather.getForecasts().get(i).getTemp();
                long date_sec = forecastWeather.getForecasts().get(i).getCalcDateTime();
                String date = formatter.format(new Date(date_sec * 1000));

                data[0][i] = date;
                data[1][i] = String.valueOf(lat);
                data[2][i] = String.valueOf(lon);
                data[3][i] = String.valueOf(temp);
            }
        }
        i = 0;
        while (data[0][i] != null) i++;

        int j = 0;
        while (data[0][0].equals(data[0][j])) j++;

        first_group = j;
        number_previsions = i;
        last_group = (i - j) % 8;
        number_groups = (number_previsions - first_group - last_group) / 8 + 2;

        int cursor = 0;
        int jour;

        Calendar c = Calendar.getInstance();

        for (i = 0; i < first_group; i++) k += Double.valueOf(data[3][i]);

        c.setTime(formatter.parse(data[0][0]));
        cursor += first_group;

        for (i = 0; i < number_groups - 2; i++) {
            k = 0;
            for (j = cursor; j < cursor + 8; j++) k += Double.valueOf(data[3][j]);
            k /= 8;
            c.setTime(formatter.parse(data[0][cursor]));
            jour = c.get(Calendar.DAY_OF_WEEK);
            out.write(data[0][cursor] + "," + String.valueOf(lat) + "," + String.valueOf(lon) + "," + String.valueOf(k - 273.15) + "," + String.valueOf(correct(jour)) + "\n");
            cursor += 8;
        }

    }

    public int correct(int x) {
        x--;
        if (x==0) x=7;
        return x;
    }

}
