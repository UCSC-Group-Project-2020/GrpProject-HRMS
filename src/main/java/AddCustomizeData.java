import Customize.CustomizeBean;
import Customize.CustomizeDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCustomizeData  extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startTime,endTime,empId;
        int salaryCalculation;
        String fromDate,fromMonth;

        empId = request.getParameter("empId");
        startTime=request.getParameter("startTime");
        endTime=request.getParameter("endTime");
        salaryCalculation= Integer.parseInt(request.getParameter("salaryCalculation"));
        fromDate=request.getParameter("fromDate");
        fromMonth= request.getParameter("fromMonth");
        String resetDate=fromDate +"-"+ fromMonth;


        CustomizeBean cb=new CustomizeBean();

        cb.setstartTime(startTime);
        cb.setEmpId(empId);
        cb.setendTime(endTime);
        cb.setsalaryCalculation(salaryCalculation);
        cb.setreset(resetDate);

        CustomizeDao cusDao=new CustomizeDao();
        String result=cusDao.addData(cb);

        if (result.equals("Successful")){
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/customization.jsp").forward(request, response);
        }



    }
}