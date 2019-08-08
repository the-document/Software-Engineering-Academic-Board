function addCategory(facultyName) {
    $.ajax({
        type : "GET",
        url : "documents/ajax/"+facultyName,
        data : {
           // namescope : facultyName,       
        },
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            console.log("SUCCESS: ", data);
            var result;
            for (var i = data.length - 1; i >= 0; i--) {
                //result+= data[i].name;
                var div = document.createElement('div')
                div.className ="items";
                div.innerHTML = " <a href=\"documents/"+data[i].id+"\">  <div class=\"course-image\">"
                            +"      <img src='"+data[i].avatar +"'/>"
                            +"   </div>"
                            +'   <div class="course-name">'
                            +        data[i].name
                            +"   </div> </a>"  ;
                document.getElementById(facultyName).children[0].children[0].children[0].appendChild(div);
            }
        },
        	error : function(e) {
        		console.log("ERROR: ", e);
                }
       });
        
}
function showFacultyCourses(facultyName) {
    if( !$(`#${facultyName}`).hasClass("active")) {
        $(`#${facultyName}`).addClass("active")
        
        var anchor= document.getElementById(facultyName).children[0].children[0].children[0].children[0];
        if(anchor=='undefined'||anchor==null)
        	addCategory(facultyName);
    }
    else {

        $(`#${facultyName}`).removeClass("active")

    }
}

function showUploadModal () {
    console.log('click')
    if($('#upload-modal').hasClass('active')) 
    {
        $('#btn-upload').removeClass('active')
        $('#upload-modal').removeClass('active')

    }
    else {
        $('#upload-modal').addClass('active')
        $('#btn-upload').addClass('active')

    }
}

function closeModal(modalId) {
    $(`#${modalId}`).removeClass('active')
    $('#btn-upload').removeClass('active')

}

//here==================================================

function SetFocusRow(idrow){
	console.log("in click");
	   var current_count=$(`#count_select_doc`).attr("value");
	   
	    if($(`#${idrow}`).hasClass('selected-row'))
	    {
	        $(`#${idrow}`).removeClass('selected-row')
	        current_count=current_count-1;

	    }
	    else
	    {
	        $(`#${idrow}`).addClass(`selected-row`);
	        current_count=Number(current_count)+1;
	       
	    }
	    $(`#count_select_doc`).attr("value",current_count);
	    $(`#count_select_doc`).text(current_count);
	}

function focusMenuDocument(idBtnDocument,space) {
    $(`#dethibtn`).removeClass('active');
    $(`#trainingbtn`).removeClass('active');
    $(`#videobtn`).removeClass('active');
    $(`#sachbtn`).removeClass('active');
    $(`#baigiangbtn`).removeClass('active');
    $(`#${idBtnDocument}`).addClass('active');

    //show data
    $(`#dethi`).addClass('hidespacedoc');
    $(`#baigiang`).addClass('hidespacedoc');
    $(`#training`).addClass('hidespacedoc');
    $(`#video`).addClass('hidespacedoc');
    $(`#sach`).addClass('hidespacedoc');
    $(`#${space}`).removeClass('hidespacedoc');
    
    
    //ajax to load realdata
    if($(`#${space}`).children().length <= 0)
    {

       //ajax to loading data
       //ajax here
        var subject=$(`#subjectID`).attr("value");
        $.ajax({
    		type: "GET",
    		url: "http://localhost:8080/Software-Engineering-Academic-Board/documents/"+subject+"/ajax/"+space+"",
    		
    		data: {
    			
    		},
    		dataType: "json",
    		timeout:100000,
    		success: function (data) {
    			//if have data
    			if(data.length!=0)
    			{
    				$("#desc").text("Loading...");
    				launch_toast();
    				for (var i = data.length - 1; i >= 0; i--) {
	    				var tr=document.createElement('tr');
	        	        tr.className="doc-row";
	        	        tr.id=data[i].id;
	        	        
	        	        //tr.onclick = SetFocusRow(data[i].id+"");
	        	        tr.innerHTML=" <td >"+ data[i].name+"</td> "
	        	                    +" <td>"+ data[i].author.name+"</td> "
	        	                    +" <td>"+ data[i].dowloads+"</td> ";
	        	        document.getElementById(space).appendChild(tr);
	        	        //$(`#${data[i].id}`).click(SetFocusRow(data[i].id));
	        	        var myEl = document.getElementById(data[i].id);
	        	        
	        	        myEl.addEventListener('click', function() {
	        	        	SetFocusRow($(this).attr("id"));
	        	        }, false);
    				}
    			}
    			else
    				{
	    				//don't have data
    				 	$("#desc").text("data empty");
	        	        launch_toast();
	        	        var div=document.createElement('tr');
	        	        div.className="infor-donot-have-data";
	        	        div.innerHTML="<td> Phần này chưa có người đóng góp</td> "
	        	                    +" <td>Quay lại sau</td> "
	        	                     +" <td>Hoặc đóng góp</td> ";
	        	        document.getElementById(space).appendChild(div);
	        	       
    				}

    		},
    		error: function (e){
    			console.log("ERROR:",e);
    		}
    	});

    }
}



function DowloadDocument(idSubject){
	 
	var current_count=$(`#count_select_doc`).attr("value");
	if(current_count=="0")
		{
			console.log("you have select item to dowload document");
	    	$("#desc").text("Bạn phải chọn item để dowload!");
	        launch_toast();
	        return;
		}
	
    var login=document.getElementById('login-btn');
    if(login)
    	{
    		console.log("you have login to dowload document");
	    	$("#desc").text("Bạn phải đăng nhập để dowload!");
	        launch_toast();
	        return;
    	}
        
    console.log("dowloading");
    //get div showing in document space
    $('#table-document-space').children().each(function(){
        if(!$(this).hasClass(`hidespacedoc`)){
            console.log($(this));
            //get all doc selected
            $(this).children().each(function(){
                if($(this).hasClass(`selected-row`))
                {
                    var id=$(this).attr('id');
                    //using ajax to post request
                    $.ajax({
                		type: "GET",
                		url: "http://localhost:8080/Software-Engineering-Academic-Board/documents/"+idSubject+"/download/"+id+"",
                		async: false,
                		data: {
                			
                		},
                		dataType: "text",
                		timeout:100000,
                		success: function (data) {
                			console.log(data);
                			var mess;
                			if(data=="failscore")
                			{
                				mess="Bạn không đủ điểm để dowload";
                			}
                			else
                			if(data=="faillogin")
                			{
                				mess="Bạn phải đăng nhập để dowload";
                			}
                			else
                			{
                				mess="Đang điều hướng...";
                				var win = window.open(data, '_blank');
                			
                			}
                				
                			$("#desc").text(mess);
            		        launch_toast();
                		},
                		error: function (e){
                			console.log("ERROR:",e);
                		}
                	});
                }
            })
        }
    });
}

function ShowSelectSubject() {
    closeModal(`upload-modal`);
    $('#upload-modal2').addClass('active')

}

function UploadDocument() {
    closeModal(`upload-modal2`);
    var typedoc=$(`#typedoc`).val();
    var typeobject=$(`#typesubject`).val();
    var name=$(`#namedoc`).val();
    var link=$(`#linkdoc`).val();
 
    //if no option selected
    if(typedoc=="noselected"||typeobject=="noselected")
    	{
	    	$("#desc").text("Bạn chưa chọn môn học hoặc danh mục. !");
	        launch_toast();
	        return;
    	}

    //start uploading
    $.ajax({
    	type: "POST",
    	url: "http://localhost:8080/Software-Engineering-Academic-Board/documents/upload",
    	data: {
    		type :typedoc,
    		category:typeobject,
    		url:link,
    		name:name
		},
		dataType: "text",
		timeout:100000,
		success: function (data) {
			var mess;
			if(data=="loginerror"){
				mess="Bạn phải đăng nhập để upload !"
			}else
			if(data=="fail"){
				mess="Thêm thất bại, vui lòng thử lại sau !"
			}
			else
				mess="Thêm thành công, tài liệu đang được chờ duyệt !"
				
			$("#desc").text(mess);
	        launch_toast();
		},
		error: function (e){
			console.log("ERROR:",e);
		}
    });
}

$( document ).ready(function() {
//    $('#btn-upload').click(showUploadModal)
});

