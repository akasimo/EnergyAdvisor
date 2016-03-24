package ppe;

import org.json.JSONException;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by guillaume on 19/02/2016.
 */
public class Downloader {

    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    private URL link;
    private InputStream in;

    public Downloader(String begin, String end){

        try {
            format.parse(begin);
            format.parse(end);
        } catch (ParseException e) { e.printStackTrace(); }

        try{
            link = new URL("http://www.smart.grtgaz.com/api/v1/fr/consommation/export/Zone.csv?startDate=" + begin + "&endDate=" + end + "&range=daily"); //The file that you want to download
            in = new BufferedInputStream(link.openStream());

            System.out.println("Starting downloading a new file...");

            String fileName = "gaz_data.csv";

            ByteArrayOutputStream out = new ByteArrayOutputStream();

            byte[] buf = new byte[1024];
            int n = 0;
            while (-1 != (n = in.read(buf))) {
                out.write(buf, 0, n);
            }

            out.close();
            in.close();

            byte[] response = out.toByteArray();

            FileOutputStream fos = new FileOutputStream(fileName);
            fos.write(response);
            fos.close();

            parsingCall(fileName, "nord");
            parsingCall(fileName, "sud");

        } catch(Exception e){e.printStackTrace();}


    }

    /**
     * Create a parser object and append the content of the csv to existing matrix
     * @param inputFileName
     * @param outputFileName
     */
    public void parsingCall(String inputFileName, String outputFileName){

        Parser p = new Parser(inputFileName, "../res/csv/" + outputFileName + ".csv");
        //Parser p = new Parser(inputFileName, outputFileName + ".csv");
        p.appendtoMatrix(outputFileName);
        p.clear();
        System.out.println("Appended to "+ outputFileName + " matrix!");
    }

    public static Date addDays(Date begin, int days){
        Calendar cal = Calendar.getInstance();
        cal.setTime(begin);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }

    public static void main(String[] args) throws IOException, ParseException, InterruptedException {

        Date begin,today,end;

       // Date date = Calendar.getInstance().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       // String date_today = sdf.format(date);

        Calendar cal = Calendar.getInstance();
        today = Calendar.getInstance().getTime();
        cal.add(Calendar.DATE, -2);
        Date date2 = cal.getTime();
        String date_today = sdf.format(date2);

        cal.add(Calendar.DATE, -1);
        Date date3 = cal.getTime();
        String date_yesterday = sdf.format(date3);
        System.out.println(date_today + " " + date_yesterday);

        try{
            begin = format.parse(date_yesterday);
            //today = format.parse(date_today);
        }catch(ParseException e){
            e.printStackTrace();
            begin = null;
            today = null;
        }

        while(begin.before(date2)){
            end = addDays(begin,1);
            System.out.println("About to download from " + begin.toString() + " to " + end.toString());
            new Downloader(format.format(begin), format.format(end));
            begin = addDays(end,1);
        }

        System.out.println("Done with GRT datas, starting forecast...");


        int i = 0;

        while (i != 62) {

            Forecasting forecasting = new Forecasting();
            System.out.println("Begin fetching...");
            try {
                for(double[] couple : forecasting.getLatLon()){
                    forecasting.fillFile(couple[0], couple[1]);
                    System.out.println(i+1 + "/62 completed!");
                    i ++;
                    Thread.sleep(100);
                }
                forecasting.clean();
            }
            catch (JSONException e) {
                System.out.println(e.getMessage());
            }
        }
    }

}
