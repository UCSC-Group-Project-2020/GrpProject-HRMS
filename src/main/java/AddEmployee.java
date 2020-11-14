import user.EmployeeDao;
import user.UserBean;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AddEmployee extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empId, fName, lName, NIC, dob, address, email, password, contact, confirmPassword;
        int totLeaves, remLeaves, empAddDB, empDelDB, postAddDB, postDelDB, postViewDB, chatSysDB, applyLeaveDB, decisionLeaveDB, salaryManageDB, customizeDataDB, editPersonalDetailsDB, giveComSugDB, viewComSugDB, viewMyAttendDB, viewAllAttendDB, viewMyLeavesDB, viewAllLeavesDB, viewMySalaryDB, viewAllSalaryDB, genReportDB;;
        float basicSal, otRate;
        String res;

        empId = request.getParameter("empid");
        fName = request.getParameter("first_name");
        lName = request.getParameter("last_name");
        NIC = request.getParameter("nic");
        dob = request.getParameter("dob");
        address = request.getParameter("address");
        contact = request.getParameter("phone");
        email = request.getParameter("email");
        password = request.getParameter("password");
        confirmPassword = request.getParameter("confirm_password");


        if (fName.isEmpty() || lName.isEmpty() || NIC.isEmpty() || dob.isEmpty()|| address.isEmpty()||
                confirmPassword.isEmpty()||email.isEmpty()||password.isEmpty() || confirmPassword.isEmpty() ||
        Integer.valueOf(request.getParameter("leaves")).equals(null)||
                Float.valueOf(request.getParameter("bSalary")).equals(null) ||
                Float.valueOf(request.getParameter("otRate")).equals(null)){

            String  result="Unsuccessful";
            request.setAttribute("result",result);
            request.getRequestDispatcher("/addEmployee.jsp").forward(request, response);

        }else {

            totLeaves = Integer.valueOf(request.getParameter("leaves"));

            remLeaves = Integer.valueOf(request.getParameter("leaves"));

            basicSal = Float.valueOf(request.getParameter("bSalary"));
            otRate = Float.valueOf(request.getParameter("otRate"));


            empAddDB = Integer.valueOf(request.getParameter("employeeAdd"));
            empDelDB = Integer.valueOf(request.getParameter("employeeRemove"));
            postAddDB = Integer.valueOf(request.getParameter("postAdd"));
            postDelDB = Integer.valueOf(request.getParameter("postDelete"));
            postViewDB = Integer.valueOf(request.getParameter("postView"));
            chatSysDB = Integer.valueOf(request.getParameter("chatSystemUse"));

            applyLeaveDB = Integer.valueOf(request.getParameter("leaveApply"));
            viewMyLeavesDB = Integer.valueOf(request.getParameter("myLeaveHistoryView"));

            if (applyLeaveDB == 1) {
                viewMyLeavesDB = 1;
            } else if (applyLeaveDB == 0) {
                viewMyLeavesDB = 0;
            }

            decisionLeaveDB = Integer.valueOf(request.getParameter("ApproveOrRejectLeave"));
            salaryManageDB = Integer.valueOf(request.getParameter("salaryManagement"));
            customizeDataDB = Integer.valueOf(request.getParameter("dataCustomize"));
            editPersonalDetailsDB = Integer.valueOf(request.getParameter("personalDetailsEdit"));
            giveComSugDB = Integer.valueOf(request.getParameter("complain_suggestionGive"));
            viewComSugDB = Integer.valueOf(request.getParameter("complain_suggestionView"));
            viewMyAttendDB = Integer.valueOf(request.getParameter("myAttendanceHistoryView"));
            viewAllAttendDB = Integer.valueOf(request.getParameter("othersAttendanceHistoryView"));
            viewAllLeavesDB = Integer.valueOf(request.getParameter("otherLeaveHistoryView"));
            viewMySalaryDB = Integer.valueOf(request.getParameter("mySalary"));
            viewAllSalaryDB = Integer.valueOf(request.getParameter("otherSalary"));
            genReportDB = Integer.valueOf(request.getParameter("generationReport"));

            UserBean newEmp = new UserBean();

            newEmp.setEmpId(empId);
            newEmp.setFName(fName);
            newEmp.setLName(lName);
            newEmp.setNIC(NIC);
            newEmp.setDOB(dob);
            newEmp.setAddress(address);
            newEmp.setContact(contact);
            newEmp.setEmail(email);
            newEmp.setPassword(password);
            newEmp.setConfirmPassword(confirmPassword);

            newEmp.setTotalLeaves(totLeaves);
            newEmp.setRemLeaves(remLeaves);

            newEmp.setBasicSal(basicSal);
            newEmp.setOtRate(otRate);

            newEmp.setEmpAdd(empAddDB);
            newEmp.setEmpDel(empDelDB);
            newEmp.setPostAdd(postAddDB);
            newEmp.setPostDel(postDelDB);
            newEmp.setPostView(postViewDB);
            newEmp.setChatSys(chatSysDB);
            newEmp.setApplyLeave(applyLeaveDB);
            newEmp.setDecisionLeave(decisionLeaveDB);
            newEmp.setSalaryManage(salaryManageDB);
            newEmp.setCustomizeData(customizeDataDB);
            newEmp.setEditPersonalDetails(editPersonalDetailsDB);
            newEmp.setGiveComSug(giveComSugDB);
            newEmp.setViewComSug(viewComSugDB);
            newEmp.setViewMyAttend(viewMyAttendDB);
            newEmp.setViewAllAttend(viewAllAttendDB);
            newEmp.setViewMyLeaves(viewMyLeavesDB);
            newEmp.setViewAllLeaves(viewAllLeavesDB);
            newEmp.setViewMySalary(viewMySalaryDB);
            newEmp.setViewAllSalary(viewAllSalaryDB);
            newEmp.setGenReport(genReportDB);

            EmployeeDao regEmp = new EmployeeDao();

            res = regEmp.addEmployee(newEmp);
            request.setAttribute("result", res);

            if (res.equals("ErrPass") || res.equals("ErrLength") || res.equals("Unsuccessful")) {
                request.getRequestDispatcher("/addEmployee.jsp").forward(request, response);
            } else if (res.equals("Successful")) {
                request.getRequestDispatcher("/addEmployeeFingerPrint.jsp").forward(request, response);

            }
        }
    }
    }

