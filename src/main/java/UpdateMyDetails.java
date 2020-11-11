import user.EmployeeDao;
import user.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateMyDetails extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String empId,fName,lName,NIC,dob,address,email,currentPassword,confirmPassword,password,contact;

        empId = request.getParameter("empId");
        fName = request.getParameter("first_name");
        lName = request.getParameter("last_name");
        NIC = request.getParameter("nic");
        dob = request.getParameter("dob");
        address = request.getParameter("address");
        contact = request.getParameter("phone");
        email = request.getParameter("email");
        currentPassword=request.getParameter("current_password");
        password = request.getParameter("password");
        confirmPassword = request.getParameter("confirm_password");

        UserBean newEmp = new UserBean();
        newEmp.setEmpId(empId);
        newEmp.setFName(fName);
        newEmp.setLName(lName);
        newEmp.setNIC(NIC);
        newEmp.setDOB(dob);
        newEmp.setAddress(address);
        newEmp.setContact(contact);
        newEmp.setEmail(email);
        newEmp.setCurrentpassword(currentPassword);
        newEmp.setPassword(password);
        newEmp.setConfirmPassword(confirmPassword);
        System.out.println(newEmp.getEmpId());
        EmployeeDao regEmp = new EmployeeDao();
        String res = regEmp.updateMyDetails(newEmp);
        request.setAttribute("result", res);
        request.getRequestDispatcher("/editAccountDetails.jsp").forward(request, response);
    }
}
