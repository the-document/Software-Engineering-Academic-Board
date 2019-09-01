

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

function makeComment() {
    if (event.keyCode === 13) {
        var message = $("#commment-box").val();
        var name=$("#nav-user-name").text();
        $("#commment-box").val("");
        //console.log(name);
        if(!message){
        	return;
        }
        if(name){
            //console.log(message);

            var div= document.createElement('div'); 
            div.className="box-view-one-cmt";
            //div.innerHTML = '<div style=" margin-top: 20px;">'
            div.innerHTML =     '<div id="header-reply-comment">'
                +   '<div style="display: flex;">'
                +       '<img class="post-avatar" src="">'
                +            '<div id="author-comment">'+name+'</div>'
                +   "</div>"

                +        '<div id="time-comment">just now</div>'
                +    "</div>"

                +    '<div id="content-reply-comment">'
                +        message
                +    "</div>"
                +"</div>"

            document.getElementById("post-temlate").appendChild(div);
            //query insert here
            //===========================================================================
            var postID=$("#idPost").attr('value');
            $.ajax({
        		type: "POST",
        		url: "/posts/comment",
        		data:{
        			parent:postID,
        			content:message
        		},
        		dataType: 'text',
        		timeout:100000,
        		success: function (data) {
        			if(data!='Success')
        				div.className="box-view-one-cmt-err";
        			
        		},
        		error: function (e){
        			div.className="box-view-one-cmt-err";
        			console.log("ERROR:",e);
        		}
        	});
            
        }
        else
        openLoginModal();
    }
}

function MakeUpvote() {
    var name=$("#nav-user-name").text();
    if(!name){
        openLoginModal();
        return;
    }

    
    var active_icon=document.getElementById('upvote-icon');
    var unactive_icon=document.getElementById('upvote-icon-disable');
    
    //if upvoted ==> noaction
    if(active_icon.dislay=="none"){
    	return;
    }
    //else
    //upvote and change icon
    active_icon.style.display="none";
    unactive_icon.style.display="block";

    //query upvote...
    var postID=$("#idPost").attr('value');
    $.ajax({
		type: "POST",
		url: "/posts/upvote",
		data:{
			parent:postID,
		},
		dataType: 'text',
		timeout:100000,
		success: function (data) {
			console.log(data);
			if(data!='Success')
				{
					active_icon.style.display="block";
				    unactive_icon.style.display="none";
				    $("#desc").text("Lỗi, không thể upvote bây giờ!");
			        launch_toast();
				}
			else
				{
					var counttag=$("#count_upvote");
					var count=counttag.text();
					count=parseInt(count, 10)+1;
					counttag.text(count);
				}
				
		},
		error: function (e){
			console.log("ERROR:",e);
			active_icon.style.display="block";
		    unactive_icon.style.display="none";
		    $("#desc").text("Lỗi, không thể upvote bây giờ!");
	        launch_toast();
		}
	});
}

$("#commment-box").keyup(function(event){
    makeComment();
})

$("#upvote-icon").click(function(){
    MakeUpvote();
})

$("#upvote-icon-disable").click(function(){
	$("#desc").text("Bạn đã vote bài viết rồi!");
    launch_toast();
})
