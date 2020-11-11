
import complains.ComplainBean;
import complains.ComplainDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
public class AddComplain extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empId,comId,date,description;

        empId=request.getParameter("empId");
        comId=request.getParameter("comId");
        date=request.getParameter("date");
        description=request.getParameter("description");

        ComplainBean cb=new ComplainBean();
        cb.setcomId(comId);
        cb.setEmpId(empId);
        cb.setDate(date);
        cb.setDescription(description);

        System.out.println(date);


        ComplainDao com=new ComplainDao();
        String result =com.addData(cb);
        request.setAttribute("result",result);

        request.getRequestDispatcher("/addComplains.jsp").forward(request, response);
    }
}