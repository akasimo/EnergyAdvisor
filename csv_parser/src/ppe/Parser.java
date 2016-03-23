/**
 * Created by guillaume on 19/02/2016.
 */
package ppe;

import com.opencsv.*;

import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class Parser {

    private BufferedWriter out;
    private List<String[]> rows;


    /**
     * Create a Parser object that bind a CSV to java object
     * @param filename CSV file downloaded from GRTgaz
     */
    public Parser(String filename, String output){
        try{
            out = new BufferedWriter(new FileWriter(output, true));
            rows = new CSVReader(new FileReader(filename), ';').readAll();

        } catch(Exception e){e.printStackTrace();}

    }

    /**
     * Append the recieved data to the zone matrix
     * @param zone
     */
    public void appendtoMatrix(String zone){

        SimpleDateFormat grtformat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat algoformat = new SimpleDateFormat("yyyyMMdd");
        for(String[] row : rows) {
            if(row[1].equalsIgnoreCase(zone) && !row[2].equals("")){ //get conso set for a given zone if temp and conso are set
                try{
                    String tmp = algoformat.format(grtformat.parse(row[0]));
                    System.out.println("Date is " + tmp);
                    Calendar c = Calendar.getInstance();
                    c.setTime(grtformat.parse(row[0]));
                    int jour = c.get(Calendar.DAY_OF_WEEK);

                    System.out.println("Adding " + tmp + "," + row[2] + "," + row[82] + "," + jour + "\n");
                    out.write(tmp + "," + row[2] + "," + row[82] + "," + jour + "\n");
                }catch(IOException io){io.printStackTrace();}
                catch (ParseException e) {
                   System.out.println("Unrecognized date format");
                }

            }

        }
    }

    public void clear(){
        try{
            out.close();
            rows.clear();
        }catch(Exception e){e.printStackTrace();}

    }

    /*public void meteoFrance(){

        SimpleDateFormat grtformat = new SimpleDateFormat("ddMMyyyy");
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
        for(String[] row : rows) {
            // add the data of global zone -- have to be refined later

                try{
                    row[1] = sf.format(grtformat.parse(row[1]));

                    out.write(row[0] + ";" + row[1] + ";" + row[2] + "\n");
                }catch(IOException io){io.printStackTrace();} catch (ParseException e) {
                    e.printStackTrace();
                }


            //else break;

        }
    }

    public List<String[]> getRows() {
        return rows;
    }


    public static void main(String[] args){

        Parser p = new Parser("meteo.csv", "meteofinal.csv");
        p.meteoFrance();
        p.clear();
        System.out.println("Done!");

    }*/
}
