

function getCheckedCnt()  {
	// 선택된 목록 가져오기
	//alert('hi');
	const query = 'input[name="location_drop_con"]:checked';
	const selectedElements =  document.querySelectorAll(query);
		  
	// 선택된 목록의 갯수 세기
	const selectedElementsCnt = selectedElements.length;
	//alert(selectedElementsCnt);
	
	// document.getElementById('result').innerText  = selectedElementsCnt;
    if(selectedElementsCnt <= 0 ){
        //count
        document.getElementById("opeingcountsearch").style.display="none";
        document.getElementById("opeingcount").style.display="block";
        //list
        document.getElementById("checkedlist").style.display="none";
        document.getElementById("openinglist").style.display="flex";
    } else{
        //count
        document.getElementById("opeingcount").style.display="none";
        document.getElementById("opeingcountsearch").style.display="block";
        //list
        document.getElementById("checkedlist").style.display="flex";
        document.getElementById("openinglist").style.display="none";
    }	  
}

$(".loction").ready(function() {
    $(".loction").change(function() {//checkbox 클릭시동작
        var location = [];
        $('input:checkbox[name=location_drop_con]:checked').each(function () {
            location.push($(this).val());
        });
        $.ajax({
            url : "/Job_opening?cmd=company_job_opening_search&location="+location,
            type : "post",
            datatype:"json",
            success : function(openinglist){
                $("#checkedlist").html("");//div초기화
                $.each(openinglist ,function(i , val){
                    //opeing count 아직구현안됨
                    $("#opeingcountsearch").html("d")
                    //div에 html추가
                    $("#checkedlist").append("<div>"+
                                                "<ul>"+	
                                                    "<li><div class=opening_companyInfo onclick=\"location.href='/Job_opening?cmd=company_job_opening_detail&num="+val.com_num +"'\">"+
                                                            "<div class=opening_comimage style=\"flex-shrink: 0; width: 30px; height: 30px;\"><img style=\"width:30px;height:30px;\" src=\"val.com_file_name\"></div>"+
                                                                "<div style=\"text-align: left; flex-shrink: 1;\">"+
                                                                "<div class=opening_comname style=\"font-size: 12px; font-weight: 500;\">"+val.com_name+"</div>"+
                                                                "<div class=opening_comfiled style=\"width: 200px; font-size: 20px; font-weight: 900;\">"+val.opening_duty+"</div>"+
                                                                "<div class=opening_comloction style=\"font-size: 12px; border: soild 1px black;\">"+val.com_location.substring(0,3)+"</div>"+
                                                                "<div class=opening_comfiled style=\"font-size: 12px; border-radius: 2px; background-color: #d5e2f7; padding: 2px;\">"+val.com_working_field+"</div>"+
                                                            "</div>"+
                                                        "</div>"+
                                                    "</li>"+
                                                "</ul>"+
                                            "</div>");
                });
            },
            error : function(request, status , error){ alert("no"); }
        });   
    });
});
	