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
                div.innerHTML = "   <div class=\"course-image\">"
                            +"      <img src='"+data[0].avatar +"'/>"
                            +"   </div>"
                            +'   <div class="course-name">'
                            +        data[i].name
                            +"   </div>"  ;
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

$( document ).ready(function() {
    $('#btn-upload').click(showUploadModal)
});

