package project.service.jobopening;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import project.controller.Action;
import project.domain.company.CompanyVO;
import project.domain.jobopening.JobOpeningDAO;

public class JobOpeningSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JobOpeningSearchAction");
		
		JobOpeningDAO  dao = JobOpeningDAO.getInstanceof();
		//String location =null;String salary = null;
		
		String location = request.getParameter("location");
		String salary = request.getParameter("salary");
		String duty = request.getParameter("duty");
		
		System.out.println(salary);
		System.out.println(location);
		
		String SearchQuery = "";
		String tmp1 ="",tmp2 ="",tmp3 ="";
		
		System.out.println("yes");
		
		String arry_lo[] = location.split(",");
		String arry_sal[] = salary.split(",");
		String arry_du[] = duty.split(","); 
		
		//System.out.println("1 :" + arry_lo[0]);
		//System.out.println("1 :" + arry_sal[0]);
		//System.out.println("2 :" + arry_sal[1]);
		
		System.out.println("lenth :" + arry_lo.length);
		
		if(arry_sal.length >= 1 && arry_sal[0] != "" ) {
			for(int i= 0; i< arry_sal.length; i ++) {
				
				if(i == (arry_sal.length - 1 )) {
					tmp1 = tmp1 + "job.opening_salary like '"+ arry_sal[i] +"' ";
				} else {
					tmp1 = tmp1 + "job.opening_salary like '"+ arry_sal[i] +"' or ";
				}
			}
			tmp1 = " and ("+ tmp1 +")";
		}
		
		if(arry_lo.length >= 1 && arry_lo[0] != "" ) {
			for(int i= 0; i< arry_lo.length; i ++) {
				if(i == (arry_lo.length - 1 )) {
					tmp2 = tmp2 + "job.opening_location like '%"+ arry_lo[i] +"%' ";
				} else {
					tmp2 = tmp2 + "job.opening_location like '%"+ arry_lo[i] +"%' or ";
				}
			}
			tmp2 = " and ("+ tmp2 +")";
		}
		
		if(arry_du.length >= 1 && arry_du[0] != "" ) {
			for(int i= 0; i< arry_du.length; i ++) {
				if(i == (arry_du.length - 1 )) {
					tmp3 = tmp3 + "job.opening_duty like '%"+ arry_du[i] +"%' ";
				} else {
					tmp3 = tmp3 + "job.opening_duty like '%"+ arry_du[i] +"%' or ";
				}
			}
			tmp3 = " and ("+ tmp3 +")";
		}
		
		SearchQuery = tmp1 + tmp2 + tmp3;
		System.out.println(SearchQuery);
		List<CompanyVO> list = dao.openingListSearch(SearchQuery);
		
		//Gson jar 필요
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String openinglist = new Gson().toJson(list);
		response.getWriter().write(openinglist);
			
			
			

		

	}

}
