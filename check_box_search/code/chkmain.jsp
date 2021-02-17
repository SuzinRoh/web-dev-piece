<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkboxSearching</title>
 <!-- Ajax구현하기 위해 필요 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- jQuery 사용하기위해서 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
crossorigin="anonymous"></script>
<style>
.container {
	font-family: 'Noto Sans JP', sans-serif;
	font-family: 'Noto Sans', sans-serif;
	display: flex;
	justify-content: center;
	item-align: center;
	flex-direction: column;
/* 	background-color: grey; */
}
ul{
	list-style: none;
	}
.main {
	background-color: white;
	min-width: 800px;
	margin-left:15%;margin-right:15%;
}

.listmenu {
	display: flex;
	justify-content: center;
	item-align: center;
	background-color: pink;
	padding: 10px;
}

.listmenu div {
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
}

.searchjob {
	display: flex;
	justify-content: center;
	item-align: center;
	background-color: white;
	padding: 10px;
}

.searchjob div {
	padding-left: 10px;
	padding-right: 10px;
}
.openinglist{
	display: flex; 
	flex-wrap: wrap; 
	width: 100%; 
	justify-content: center;
}
.openinglist ul{
	list-style: none;
	padding:5px;
	margin:0px;
}
.opening_companyInfo {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	align-content: center;
/* 	box-shadow: 5px 5px 10px 1px rgba(10, 10, 10, 0.1); */
	width: 380px;
	height: 100px;
	background-color: #ffffff; 
	border:solid 1px #282a52;
	padding: 2px;
	border-radius:5px;text-align:center;
}
.countopening {
	display: flex;
	padding:0px;
	margin-top:20px;
	margin-left:30px;margin-right:30px;
	justify-content: space-between;
	item-align: center;
	padding: 10px;
	font-size:12px;
	color:grey;font-weght:700;
	align-items: baseline;
}
.dropbtn{
	width:60px;
}
.search_location_drop{
	position:relative;
	display:inline-block;
	
}
/*location*/
.search_location_drop_con{
	padding:6px;
	display:none;
	position:absolute;
	min-width:60px;
	text-align:left;
	text-size:8px;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
 	z-index: 1;
}
.search_location_drop:hover .search_location_drop_con{
	display:block;
}
/*duty*/
.search_duty_drop{
	position:relative;
	display:inline-block;
	
}
.search_duty_drop_con{
	padding:6px;
	display:none;
	position:absolute;
	min-width:60px;
	text-align:left;
	text-size:8px;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
 	z-index: 1;
}
.search_duty_drop:hover .search_duty_drop_con{
	display:block;
}
/*salary*/
.search_salary_drop{
	position:relative;
	display:inline-block;
	
}
.search_salary_drop_con{
	padding:6px;
	display:none;
	position:absolute;
	min-width:60px;
	text-align:left;
	text-size:8px;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
 	z-index: 1;
}
.search_salary_drop:hover .search_salary_drop_con{
	display:block;
}
#checkedlist , #openinglist {
  transition: transform .2s ease-in-out, opacity 0.3s ease-in-out;
}
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