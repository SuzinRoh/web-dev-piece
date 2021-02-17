<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkboxSearching</title>

<script src="/chkSearchJs.js"></script>
 <!-- Ajax구현하기 위해 필요 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- jQuery 사용하기위해서 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
crossorigin="anonymous"></script>

<link rel="stylesheet" href="/chkSearchCss.css">
<style>

</style>
</head>
<body>
	
<!-- search -->
<div class=searchjob>
    <div class=search_location_drop>
        <button class=dropbtn>지역&nbsp;<i class="fas fa-caret-down"></i></button>
        <div class=search_location_drop_con>
            <label><input class=loction type="checkbox" name="location_drop_con" value="tokyo" onclick='getCheckedCnt()'/>도쿄</label>
            <label><input class=loction type="checkbox" name="location_drop_con" value="osaka" onclick='getCheckedCnt()'/>오사카</label>
            <label><input class=loction type="checkbox" name="location_drop_con" value="etc" onclick='getCheckedCnt()'/>그외</label>
        </div>
    </div>
    
    <div class=search_salary_drop>
        <button class=dropbtn>지역&nbsp;<i class="fas fa-caret-down"></i></button>
        <div class=search_salary_drop_con>
            <label><input class=salary type="checkbox" name="salary_drop_con" value="2500" onclick='getCheckedCnt()'/>2500</label>
            <label><input class=salary type="checkbox" name="salary_drop_con" value="3000" onclick='getCheckedCnt()'/>오사카</label>
            <label><input class=salary type="checkbox" name="salary_drop_con" value="3500" onclick='getCheckedCnt()'/>그외</label>
        </div>
    </div>
    
</div>
<!-- search end -->			
<!-- count-->
<div class=countopening >
    <div id=opeingcountsearch style="display:none">hiihi</div>
    <div id=opeingcount style="">${count}개의 공고</div>
    <div>ㅇ</div>
</div>			
<!-- count end-->
			
<span class=search_tag></span>
<!-- list-->
<div class=openinglist id=openinglist style="">
    <c:forEach var="company" items="${list}" begin="0" end="20">
        <ul id=tmp>
            <li><div class=opening_companyInfo onclick="location.href='/Job_opening?cmd=company_job_opening_detail&num=${company.getCom_num()}'">

                    <div class=opening_comimage
                        style="flex-shrink: 0; width: 30px; height: 30px;">
                         <img style="width:30px;height:30px;" src="<%=request.getRealPath("/Company/upload/")%>${company.getCom_image_filename()}"> 
                    </div>
                    <div style="text-align: left; flex-shrink: 1;">
                        <div class=opening_comname
                            style="font-size: 12px; font-weight: 500;">${company.getCom_name()}</div>
                        <div class=opening_comfiled
                            style="width: 200px; font-size: 20px; font-weight: 900;">${company.getOpening_duty()}</div>
                        <div class=opening_comloction
                            style="font-size: 12px; border: soild 1px black;">${company.getCom_location().substring(0,3)}
                        </div>

                        <div class=opening_comfiled
                            style="font-size: 12px; border-radius: 2px; background-color: #d5e2f7; padding: 2px;">${company.getCom_working_field()}<!--jobopening table 에서 가져오기 이따-->
                        </div>
                    </div>
                </div>
                </li>
        </ul>
    </c:forEach>
</div>
<!-- list change bubun -->
<div id=checkedlist style=""></div>
<!-- list end -->
</div>

</div>
<!-- container end -->			
			

</script>
</body>
</html>