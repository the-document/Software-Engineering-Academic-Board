function BrowseDocument(docId) {
	var name=$("#docName").val();
	var url=$("#docUrl").val();
	
	$.ajax({
		type: "POST",
		url: "admin/documents/browse",
		data: {
			id: docId,
			docName: name,
			Url: url
		},
		dataType: "text",
		timeout:100000,
		success: function (data) {
			var id="#"+docId;
			if(data=="success")
			{
				console.log("in success:");
				$(id).addClass("success");
			}
				
			else
			{
				console.log("in fail:");
				$(id).addClass("fail");
			}
		},
		error: function (e){
			console.log("ERROR:",e);
		}
	});
}

function BrowsePost(postId) {
	
	$.ajax({
		type: "POST",
		url: "posts/browse",
		data: {
			id: postId,
		},
		dataType: "text",
		timeout:100000,
		success: function (data) {
			var id="#"+postId;
			if(data=="success")
			{
				console.log("in success:");
				$(id).addClass("success");
			}
				
			else
			{
				console.log("in fail:");
				$(id).addClass("fail");
			}
		},
		error: function (e){
			console.log("ERROR:",e);
		}
	});
}