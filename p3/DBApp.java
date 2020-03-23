import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.sql.Time;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBApp {

    private final String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
    private final String username = "cs421g34";
    private final String password = "c42!g34$$";
    private Integer eid;

    private Connection conn;

    public Connection connect() {
        Connection conn = null;
        System.out.println("Establishing connection to database...");
        try {
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
 
        return conn;
    }

    public int addReservation() {
        Integer year, month, day, hour, minute, tableNum;

        // Get year
        System.out.print("Year: ");
        year = tryParseInt(tryReadLine());
        if (year == null || year < 2000 || year > 9999) {
            return 1;
        }

        // Get month
        System.out.print("Month: ");
        month = tryParseInt(tryReadLine());
        if (month == null || month > 12 || month < 1) {
            return 1;
        }

        // Get day
        System.out.print("Day: ");
        day = tryParseInt(tryReadLine());
        if (day == null || day > 31 || day < 1) {
            return 1;
        }

        // Get hour
        System.out.print("Hour: ");
        hour = tryParseInt(tryReadLine());
        if (hour == null || hour > 23 || hour < 0) {
            return 1;
        }

        // Get minute
        System.out.print("Minute: ");
        minute = tryParseInt(tryReadLine());
        if (minute == null || minute > 59 || minute < 0) {
            return 1;
        }

        // Get reserved table number
        System.out.print("Requested Table Number: ");
        tableNum = tryParseInt(tryReadLine());
        if (tableNum == null) {
            return 1;
        }

        String date = year + (month > 9 ? "-" : "-0") + month + "-" + day;
        String time = (hour > 9 ? "" : "0") + hour + (minute > 9 ? ":" : ":0") + minute + ":00";

        Date dateSql = Date.valueOf(date);
        Time timeSql = Time.valueOf(time);

        Date currDate = new Date(System.currentTimeMillis());
        Time currTime = new Time(System.currentTimeMillis());

        try {
            String insertRes = "INSERT INTO Reservations (res_date, res_time) VALUES ('" + dateSql.toString() + "', '" + timeSql.toString() + "')";
            String insertConfirmRes = "INSERT INTO ConfirmedReservations VALUES (?, ?, '" + currDate.toString() + "', '" + currTime.toString() +"')";
            String insertTableRes = "INSERT INTO TableReservations VALUES (?, ?);";
            String generatedColumns[] = { "res_id" };

            // Insert into Reservations
            PreparedStatement stmtRes = conn.prepareStatement(insertRes, generatedColumns);

            stmtRes.executeUpdate();

            ResultSet rs = stmtRes.getGeneratedKeys();
            int res_id = 0;

            if (rs.next()) {
                res_id = rs.getInt(1);
            } else {
                System.out.println("Failed to insert reservation");
            }
            stmtRes.close();

            // Insert into ConfirmedReservations
            PreparedStatement stmtConRes = conn.prepareStatement(insertConfirmRes);
            stmtConRes.setInt(1, res_id);
            stmtConRes.setInt(2, eid);

            stmtConRes.executeUpdate();
            stmtConRes.close();

            // Insert into TableReservations
            PreparedStatement stmtTabRes = conn.prepareStatement(insertTableRes);
            stmtTabRes.setInt(1, res_id);
            stmtTabRes.setInt(2, tableNum);

            stmtTabRes.executeUpdate();
            stmtTabRes.close();

            System.out.println("Reservation successfully created. Details:");
            System.out.println("    Date: " + dateSql.toString());
            System.out.println("    Time: " + timeSql.toString());
            System.out.println("    Table Number: " + tableNum);

        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }

        return 0;
    }

    public static void main(String[] args) {

        DBApp app = new DBApp();

        String line = "";
        BufferedReader reader;

        // Load the postgresql driver
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error: loading postgresql driver");
            System.exit(1);
        }

        // Create connection to the databse
        app.conn = app.connect();
        if (app.conn == null) {
            return;
        }

        System.out.println("Please enter your employee id:");
        System.out.println("  hint: 1 for type waiter, 5 for type hostess");
        app.eid = tryParseInt(tryReadLine());

        // Print welcome text
        System.out.println("Welcome to Group 34's Restaurant Management System!");
        help();

        while (!line.equals("quit")) {
            // read line from stdin
            System.out.print("=> ");
            reader = new BufferedReader(new InputStreamReader(System.in));
            try {
                line = reader.readLine();
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("Error: I/O Exception");
                break;
            }

            // match input against available commands
            switch(line)
            {
                case "help" :
                    help();
                    break;
                
                case "res" :
                    app.addReservation();
                    break;
                
                default : 
                    break;
            }
        }

        System.out.println("Goodbye!");

        // Close connection to database
        try {
            app.conn.close();
            System.out.println("Connection closed.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to close db connection");
            System.exit(1);
        }
    }

    private static String tryReadLine() {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String line = "";
        try {
            line = reader.readLine();
        } catch (IOException e) {
            System.out.println("Error: I/O Exception");
            line = null;
        }
        return line;
    }

    private static Integer tryParseInt(String text) {
        try {
            return Integer.parseInt(text);
        } catch (NumberFormatException e) {
            System.out.println("Error: Not an integer");
            return null;
        }
      }

    private static void help() {
        System.out.println("Available Commands:");
        System.out.println("   quit         Terminate the program");
        System.out.println("   help         List the available commands");
        System.out.println("   res          Create a new reservation");
        System.out.println("   cmd2         Placeholder text for cmd2");
        System.out.println("   cmd3         Placeholder text for cmd3");
        System.out.println("   cmd4         Placeholder text for cmd4");
    }
}