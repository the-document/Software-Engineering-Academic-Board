

function UploadPost() {

	const content = editor.getData();
	console.log(content);
	var title =$("#title").val();
	var intro =$("#intro").val();
	var image =$("#image").val();
	var cata =$("#cata").val();
	var type =$("#type").val();

    $.ajax({
        type : "POST",
        url : "upload",
        data : {
        	title:title,
        	intro:intro,
        	image:image,
        	cata:cata,
        	type:type,
        	content:content
        },
        dataType : 'text',
        timeout : 100000,
        success : function(data) {
            console.log("IN SUCCESS: ", data);
            $("#desc").text(data);
            launch_toast();
            if(data=="Success, the post will be broesed within 24h!")
            	setTimeout(refresh, 5000);
        },
        	error : function(e) {
        		console.log("ERROR: ", e);
                }
       });
        
}