package ppe;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
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


public class Forecasting {

    private BufferedWriter out;
    private static final String FILENAME = "stations.csv";
    private static final String OUTPUT = "../res/csv/temp.csv";

    private FileReader file;
    CSVWriter writer;

    private static List<String[]> csv;
    private static List<double[]> lat_lon;

    private int number_previsions;
    private int first_group;
    private int last_group;
    private int number_groups;

    public void initWriter() throws IOException {
        writer = new CSVWriter(new FileWriter(OUTPUT));
    }

    public void closeWriter() throws IOException {
        writer.close();
    }

    public List<double[]> getLatLon() {
        return lat_lon;
    }

    public void readCSV() throws IOException {

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
    }

    public void clean() throws FileNotFoundException, IOException {
        FileReader fr = new FileReader("../res/csv/temp.csv");
        BufferedReader br = new BufferedReader(fr);
        FileWriter fw = new FileWriter("output2.csv");
        String line;

        int lineNum = 0;
        while((line = br.readLine()) != null)
        {
            if (lineNum > 1) {
                if (line.trim().length() > 0) {
                    line=line.trim().replaceAll("\"", "") + "\n";
                }
            } else {
                line = line.trim().replaceAll("\"", "");
                line = line + "\n";
            }
            fw.write(line);
            lineNum++;
        }
        fr.close();
        fw.close();

        File f = new File("../res/csv/temp.csv");
        f.delete();
    }

    public void fillFile(double lat, double lon) throws IOException, JSONException, ParseException {

        OwmClient owm = new OwmClient ();
        String[][] data = new String[4][100];

        double temp;
        int i;
        double k = 0.0;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

        WeatherForecastResponse forecastWeather = owm.ourForecasts(lat, lon);
        if (forecastWeather.hasForecasts()) {
            for (i=0; i<forecastWeather.getForecasts().size(); i++) {
                temp = forecastWeather.getForecasts().get(i).getTemp();
                long date_sec = forecastWeather.getForecasts().get(i).getCalcDateTime();
                String date = formatter.format(new Date(date_sec*1000));

                data[0][i] = date;
                data[1][i] = String.valueOf(lat);
                data[2][i] = String.valueOf(lon);
                data[3][i] = String.valueOf(temp);
            }
        }

        i = 0;
        while (data[0][i] != null) { /*System.out.println(data[0][i]+" "+data[1][i]+" "+data[2][i]+" "+data[3][i]);*/ i++;}

        int j = 0;
        while (data[0][0].equals(data[0][j])) j++;

        first_group = j;
        number_previsions = i;
        last_group = (i-j)%8;
        number_groups = (number_previsions - first_group - last_group)/8 + 2;
        //System.out.println("number_previsions = " + number_previsions + " first_group = " + first_group + " last_group = " + last_group + " number_groups = " + number_groups);

        csv = new ArrayList<String[]>();

        int cursor = 0;
        int jour;

        Calendar c = Calendar.getInstance();

        for (i=0; i<first_group; i++) k += Double.valueOf(data[3][i]);
        k /= first_group;
        c.setTime(formatter.parse(data[0][0]));
        jour = c.get(Calendar.DAY_OF_WEEK);
        csv.add(new String[] {data[0][0], String.valueOf(lat), String.valueOf(lon), String.valueOf(k-273.15), String.valueOf(correct(jour))});

        cursor += first_group;

        for (i=0; i<number_groups-2; i++) {
            k=0;
            for (j=cursor; j<cursor+8; j++) k += Double.valueOf(data[3][j]);
            k /= 8;
            c.setTime(formatter.parse(data[0][cursor]));
            jour = c.get(Calendar.DAY_OF_WEEK);
            csv.add(new String[] {data[0][cursor], String.valueOf(lat), String.valueOf(lon), String.valueOf(k-273.15), String.valueOf(correct(jour))});
            cursor += 8;
        }

//    if (last_group != 0) {
//    k=0;
//    for (i=number_previsions-last_group; i<number_previsions; i++) k += Double.valueOf(data[3][i]);
//    k /= last_group;
//    c.setTime(formatter.parse(data[0][cursor]));
//    jour = c.get(Calendar.DAY_OF_WEEK);
//    csv.add(new String[] {data[0][cursor], String.valueOf(lat), String.valueOf(lon), String.valueOf(k-273.15), String.valueOf(correct(jour))});
//    }

        writer.writeAll(csv);
    }

    public int correct(int x) {
        x--;
        if (x==0) x=7;
        return x;
    }

}
