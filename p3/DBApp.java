import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

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

    public int createBill() {
        Integer oid;

        try {
            System.out.print("Order ID: ");
            oid = tryParseInt(tryReadLine());

            if (oid == null) {
                System.out.println("Invalid order ID");
                return 1;
            }

            String createBillQuery = "INSERT INTO Bills (oid, total) SELECT oid, sum ( MenuItems.price * OrderMenuItems.quantity) as item_total FROM OrderMenuItems INNER JOIN MenuItems ON OrderMenuItems.item_name = MenuItems.item_name AND OrderMenuItems.oid = " + oid + " GROUP BY OrderMenuItems.oid ORDER BY OrderMenuItems.oid;";
            String generatedColumns[] = { "bid", "total" };
            PreparedStatement stmtCreateBill = conn.prepareStatement(createBillQuery, generatedColumns);
            stmtCreateBill.executeUpdate();

            ResultSet rs = stmtCreateBill.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("Bill ID: " + rs.getInt(1) + ", Total: $" + rs.getString(2));
            }

            stmtCreateBill.close();

            return 0;

        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }
    }

    public int viewOrder() {
        Integer oid;

        try {
            System.out.print("Order id: ");
            oid = tryParseInt(tryReadLine());

            if (oid == null) {
                System.out.println("Invalid order ID");
                return 1;
            }

            String orderQuery = "SELECT order_date, order_time FROM orders WHERE oid = " + oid + ";";
            PreparedStatement stmtOrder = conn.prepareStatement(orderQuery);
            ResultSet rsOrder = stmtOrder.executeQuery();

            if (rsOrder.next()) {
                System.out.println("Date: " + rsOrder.getString(1) + ", Time: " + rsOrder.getString(2));
                stmtOrder.close();
            } else {
                stmtOrder.close();
                System.out.println("This order id does not exist");
                return 1;
            }

            String oidQuery = "SELECT item_name, quantity FROM ordermenuitems WHERE oid = " + oid + ";";
            PreparedStatement stmtOid = conn.prepareStatement(oidQuery);
            ResultSet rsOrderItems = stmtOid.executeQuery();
            int count = 0;

            while (rsOrderItems.next()) {
                System.out.println(rsOrderItems.getString(2) + " x " + rsOrderItems.getString(1));
                count++;
            }

            if (count == 0) {
                System.out.println("There are no order items for order id " + oid);
            }

            stmtOid.close();

            return 0;

        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }
    }

    public int addItemToOrder() {
        Integer oid;

        try {
            String oidQuery = "SELECT * FROM tableorders WHERE tableorders.oid NOT IN (SELECT bills.oid FROM bills);";
            PreparedStatement oidList = conn.prepareStatement(oidQuery);

            ResultSet rs = oidList.executeQuery();
            System.out.println("Enter active order id from the list below: \n");
            System.out.println("table | oid");
            System.out.println("-----------");
            ArrayList<Integer> oids = new ArrayList<Integer>();
            while (rs.next()) {
                System.out.println(rs.getInt(2) + "     | "+ rs.getInt(1));
                oids.add(rs.getInt(1));
            }
            oidList.close();
            System.out.print("choose oid: ");
            oid = tryParseInt(tryReadLine());

            if (oid == null) {
                System.out.println("Invalid order ID");
                return 1;
            }

            if (!oids.contains(oid)) {
                System.out.println("Invalid order ID");
                return 1;
            }

            String itemQuery = "SELECT item_name FROM menutomenuitems INNER JOIN menus ON menus.menu_name = menutomenuitems.menu_name WHERE menus.is_active = true;";
            PreparedStatement itemList = conn.prepareStatement(itemQuery);
            rs = itemList.executeQuery();
            System.out.println("Enter item name to add to order: \n");
            System.out.println("items");
            System.out.println("-------------------");
            ArrayList<String> items = new ArrayList<String>();
            while (rs.next()) {
                System.out.println(rs.getString(1));
                items.add(rs.getString(1));
            }
            System.out.print("choose item name: ");
            String item = tryReadLine();

            if (!items.contains(item)) {
                System.out.println("Invalid item");
                return 1;
            }
            System.out.print("Enter quantity: ");
            int quant = tryParseInt(tryReadLine());

            String add = "INSERT INTO ordermenuitems VALUES (?,?,?);";
            PreparedStatement addStm = conn.prepareStatement(add);
            addStm.setInt(1, oid);
            addStm.setString(2, item);
            addStm.setInt(3, quant);
            addStm.executeUpdate();

            System.out.println(item + " added to order " + oid + " successfully");

            return 0;

        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }
    }

    public int newOrder() {
        Integer tableNum, count = 0;

        System.out.print("Enter table number: ");
        tableNum = tryParseInt(tryReadLine());

        if (tableNum == null) {
            System.out.println("Error: Invalid Table Number");
            return 1;
        }

        try {
            String tableQuery = "SELECT COUNT(*) FROM tables WHERE table_number = ?";

            PreparedStatement tableCheck = conn.prepareStatement(tableQuery);
            tableCheck.setInt(1, tableNum);

            ResultSet resultSet = tableCheck.executeQuery();
            if(resultSet.next()) {
                count = resultSet.getInt(1);
            } 
            if (count != 1) {
                System.out.println("Error: Table does not exist");
                return 1;
            }

            tableCheck.close();
            Time currTime = new Time(System.currentTimeMillis());
            
            String orderString = "INSERT INTO orders (order_time) VALUES ('" + currTime.toString() + "');";
            String generatedColumns[] = { "oid" };

            PreparedStatement insertOrder = conn.prepareStatement(orderString, generatedColumns);
            insertOrder.executeUpdate();
            resultSet = insertOrder.getGeneratedKeys();
            int oid = 0;

            if (resultSet.next()) {
                oid = resultSet.getInt(1);
            } else {
                System.out.println("Failed to insert order");
                return 1;
            }
            insertOrder.close();
            String TOstring = "INSERT INTO tableorders VALUES (?, ?);";
            PreparedStatement TOstm = conn.prepareStatement(TOstring);
            TOstm.setInt(1, oid);
            TOstm.setInt(2, tableNum);

            TOstm.executeUpdate();
            TOstm.close();

            System.out.println("Order ID " + oid + " created successfully for Table " + tableNum);
            return 0;
        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }
    }

    public int findReservation(){
        Integer year, month, day;
        String name;
        System.out.print("Year: ");
        // Get year of reservation
        year = tryParseInt(tryReadLine());
        if (year == null || year < 2000 || year > 9999) {
            System.out.println("Invalid Year");
            return 1;
        }
        // Get month
        System.out.print("Month: ");
        month = tryParseInt(tryReadLine());
        if (month == null || month > 12 || month < 1) {
            System.out.println("Invalid Month");
            return 1;
        }

        // Get day
        System.out.print("Day: ");
        day = tryParseInt(tryReadLine());
        if (day == null || day > 31 || day < 1) {
            System.out.println("Invalid Day");
            return 1;
        }

        String date = year + (month > 9 ? "-" : "-0") + month + "-" + day;
        Date dateSql = Date.valueOf(date);

        try {
            int counter =0;
            String selectReservation = "SELECT ConfirmedReservations.res_id, Reservations.res_time FROM Reservations INNER JOIN ConfirmedReservations ON ConfirmedReservations.res_id = Reservations.res_id WHERE res_date = '" + dateSql.toString() + "'";
            PreparedStatement stmtRes = conn.prepareStatement(selectReservation);
            ResultSet rs = stmtRes.executeQuery();
            System.out.println("Reservation details:");
            while(rs.next()){
                counter++;
                int res_id = rs.getInt(1);
                String res_time = rs.getString(2);

                System.out.println("res_id: " + res_id + " at " + res_time);
            }
            stmtRes.close();
            System.out.println("There are " + counter + " reservations on "+ date);
        }

        catch(SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }

        return 0;
    }

    public int getBill() {
        Integer order_id;
        
        System.out.print("Order Id: ");
        order_id = tryParseInt(tryReadLine());
        if (order_id == null) {
            return 1;
        }

        try {
            String selectBill = "SELECT bid, total FROM Bills WHERE oid = " + order_id;
            PreparedStatement stmtBill = conn.prepareStatement(selectBill);
            ResultSet rs = stmtBill.executeQuery();

            if(rs.next()) {
                int total = rs.getInt("total");
                int bid = rs.getInt("bid");
                System.out.println("Bill id: " + bid);
                System.out.println("Total: $" +  total);
            }  else {
                System.out.println("No bill has been created for this order id");
            }

            stmtBill.close();
        }

        catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }

        return 0;
    }

    public int addReservation() {
        try {
            String hostessQuery = "SELECT count(*) FROM Hostesses WHERE eid = " + eid + ";";
            PreparedStatement stmtHostess = conn.prepareStatement(hostessQuery);
            ResultSet rs = stmtHostess.executeQuery();

            if (rs.next() && rs.getInt("count") == 0) {
                System.out.println("Hostess id does not exist. Please log in as a Hostess");
                stmtHostess.close();
                return 1;
            }

            stmtHostess.close();

        } catch (SQLException e) {
            System.out.println("Error: Failed to create and execute statement");
            e.printStackTrace();
            return 1;
        }

        Integer year, month, day, hour, minute, tableNum;

        // Get year
        System.out.print("Year: ");
        year = tryParseInt(tryReadLine());
        if (year == null || year < 2000 || year > 9999) {
            System.out.println("Error: Invalid Year");
            return 1;
        }

        // Get month
        System.out.print("Month: ");
        month = tryParseInt(tryReadLine());
        if (month == null || month > 12 || month < 1) {
            System.out.println("Error: Invalid Month");
            return 1;
        }

        // Get day
        System.out.print("Day: ");
        day = tryParseInt(tryReadLine());
        if (day == null || day > 31 || day < 1) {
            System.out.println("Error: Invalid Day");
            return 1;
        }

        // Get hour
        System.out.print("Hour: ");
        hour = tryParseInt(tryReadLine());
        if (hour == null || hour > 23 || hour < 0) {
            System.out.println("Error: Invalid Hour");
            return 1;
        }

        // Get minute
        System.out.print("Minute: ");
        minute = tryParseInt(tryReadLine());
        if (minute == null || minute > 59 || minute < 0) {
            System.out.println("Error: Invalid Minute");
            return 1;
        }

        // Get reserved table number
        System.out.print("Requested Table Number: ");
        tableNum = tryParseInt(tryReadLine());
        if (tableNum == null) {
            System.out.println("Error: Invalid Table Number");
            return 1;
        }

        String date = year + (month > 9 ? "-" : "-0") + month + "-" + day;
        String time = (hour > 9 ? "" : "0") + hour + (minute > 9 ? ":" : ":0") + minute + ":00";

        Date dateSql = Date.valueOf(date);
        Time timeSql = Time.valueOf(time);

        Date currDate = new Date(System.currentTimeMillis());
        Time currTime = new Time(System.currentTimeMillis());

        try {
            // Check if table exists
            String tableQuery = "SELECT COUNT(*) FROM tables WHERE table_number = ?";

            PreparedStatement tableCheck = conn.prepareStatement(tableQuery);
            tableCheck.setInt(1, tableNum);

            ResultSet resultSet = tableCheck.executeQuery();
            if(resultSet.next() && resultSet.getInt(1) != 1) {
                System.out.println("Error: Table does not exist");
                tableCheck.close();
                return 1;
            }

            tableCheck.close();

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
            System.out.println("    Reservation id: " + res_id);
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
                
                case "addRes" :
                    app.addReservation();
                    break;

                case "newOrder" :
                    app.newOrder();
                    break;
                    
                case "addToOrder" :
                    app.addItemToOrder();
                    break;   
                    
                case "viewOrder" :
                    app.viewOrder();
                    break;    

                case "findReservation" : 
                    app.findReservation();
                    break;

                case "createBill" :
                    app.createBill();
                    break;

                case "getBill" :
                    app.getBill();
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
        System.out.println("   quit             Terminate the program");
        System.out.println("   help             List the available commands");
        System.out.println("   addRes           Create a new reservation");
        System.out.println("   newOrder         Create a new order");
        System.out.println("   addToOrder       Add an item to an order");
        System.out.println("   viewOrder        View the contents of an order");
        System.out.println("   findReservation  See number of reservations on a given day");
        System.out.println("   createBill       Create the bill for a given order id");
        System.out.println("   getBill          Get the bill total for an order");
    }
}