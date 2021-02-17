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
		String location = request.getParameter("location");
		//System.out.println(location);
		String SearchQuery = "";
		if(location.contains(",") == true) {
			System.out.println("yes");
			String arry[] = location.split(",");
			//System.out.println("1 :" + arry[0]);
			//System.out.println("2 :" + arry[1]);
			for(int i= 0; i< arry.length; i ++) {
				if(i == (arry.length - 1 )) {
					SearchQuery = SearchQuery + "job.opening_location like '%"+ arry[i] +"%' ";
				} else {
					SearchQuery = SearchQuery + "job.opening_location like '%"+ arry[i] +"%' or ";
				}
			}
			SearchQuery = " and ("+SearchQuery +")";
			System.out.println(SearchQuery);
			List<CompanyVO> list = dao.openingListSearch(SearchQuery);
			
			//Gson jar 필요
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			String openinglist = new Gson().toJson(list);
			response.getWriter().write(openinglist);
			
		} else {
			//System.out.println("no");
			SearchQuery = " and job.opening_location like '%" + location + "%' ";
			List<CompanyVO> list = dao.openingListSearch( SearchQuery);
			
			//Gson jar 필요
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			String openinglist = new Gson().toJson(list);
			response.getWriter().write(openinglist);
		}
		
	}

}