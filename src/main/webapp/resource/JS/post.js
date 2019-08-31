

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
        var name=$("#nav-user-name").val();
        $("#commment-box").val("");
        if(!name){
            openLoginModal();
            return;
        }
        console.log(message);

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
    }
}

function MakeUpvote() {
    var name=$("#nav-user-name").val();
    if(!name){
        openLoginModal();
        return;
    }

    //if upvoted ==> noaction

    //else
    //upvote and change icon
    var active_icon=document.getElementById('upvote-icon');
    var unactive_icon=document.getElementById('upvote-icon-disable');
    active_icon.style.display="none";
    unactive_icon.style.display="block";

    //query upvote...
}

$("#commment-box").keyup(function(event){
    makeComment();
})

$("#upvote-icon").click(function(){
    MakeUpvote();
})