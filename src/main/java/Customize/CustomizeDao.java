package Customize;
import java.util.ArrayList;
import java.util.Date;
import DBconnection.DBconn;
import java.util.List;
import java.sql.*;
import java.text.SimpleDateFormat;


public class CustomizeDao
{
    public String addData(CustomizeBean cb){
        Connection con = null;

        String result;
        String startTime,endTime,empId;
        int salaryCalculation;
        String resetDate;

        startTime=cb.getstartTime();
        endTime=cb.getendTime();
        salaryCalculation=cb.getsalaryCalculation();
        resetDate=cb.getreset();
        empId=cb.getEmpId();

        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
        String today= formatter.format(date);

        try {
            PreparedStatement st1 = con.prepareStatement("INSERT INTO customizeddata (dateUpdated,startTime,endTime,salaryCalculationDate,resetDate,changedBy) VALUES(?,?,?,?,?,?)");

            st1.setString(1, today);
            st1.setString(2,startTime);
            st1.setString(3, endTime);
            st1.setInt(4,salaryCalculation);
            st1.setString(5,resetDate);
            st1.setString(6,empId);

            st1.executeUpdate();

            st1.close();
            con.close();
            result="Successful";

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            result = "Unsuccessful";
        }
        return result;
    }
    public List<CustomizeBean> searchAll(){
        List<CustomizeBean> list = new ArrayList<CustomizeBean>();

        Connection con = null;
        Statement statement = null;
        ResultSet rs1 = null;

        String startTime,endTime,changeDate,changeBy;
        int salaryCalculation;
        String resetDate;

        try
        {
            con = DBconn.getConnection();
            statement = con.createStatement();
            rs1 = statement.executeQuery("SELECT * FROM `customizeddata`");

            while (rs1.next()){
                startTime= rs1.getString("startTime");
                endTime= rs1.getString("endTime");
                resetDate= rs1.getString("resetDate");
                salaryCalculation= rs1.getInt("salaryCalculationDate");
                changeDate= rs1.getString("dateUpdated");
                changeBy= rs1.getString("changedBy");


                con = DBconn.getConnection();
                CustomizeBean cb=new CustomizeBean();

                cb.setstartTime(startTime);
                cb.setendTime(endTime);
                cb.setsalaryCalculation(salaryCalculation);
                cb.setreset(resetDate);
                cb.setDate(changeDate);
                cb.setEmpId(changeBy);

                list.add(cb);
            }
            con.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return list;
    }
    public CustomizeBean searchCus(){
        CustomizeBean cb=new CustomizeBean();
        String result = null;
        String startTime,endTime,changeDate,changeBy;
        int salaryCalculation;
        String resetDate;
        Connection con = null;
        Statement statement = null;
        ResultSet rs1 = null;

        con = DBconn.getConnection();
        try {
            statement = con.createStatement();
            rs1 = statement.executeQuery("SELECT * FROM `customizeddata` ORDER BY`ID` DESC LIMIT 1");
            if (rs1.next()){
                startTime= rs1.getString("startTime");
                endTime= rs1.getString("endTime");
                resetDate= rs1.getString("resetDate");
                salaryCalculation= rs1.getInt("salaryCalculationDate");
                changeDate= rs1.getString("dateUpdated");
                changeBy= rs1.getString("changedBy");

                cb.setstartTime(startTime);
                cb.setendTime(endTime);
                cb.setsalaryCalculation(salaryCalculation);
                cb.setreset(resetDate);
                cb.setDate(changeDate);
                cb.setEmpId(changeBy);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  cb;
    }

}