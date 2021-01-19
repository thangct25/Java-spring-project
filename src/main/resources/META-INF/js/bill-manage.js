var Accept={
	 accept : function acceptOrder(id){
				var data = {};
			data["id"] = id;			
			$.ajax({
				url: "/accept-order",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					setTimeout(function(){ location.reload(); }, 3000);
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
}
}
var Delete={
	 delete_bill : function deleteOrder(id){
				var data = {};
			data["id"] = id;			
			$.ajax({
				url: "/delete-order",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					setTimeout(function(){ location.reload(); }, 3000);
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
	}
}

function AcceptOrder(id){
	document.getElementById("accept").addEventListener("click", function(){
  		Accept.accept(id);
	});
}

function deleteOrder(id){
	document.getElementById("accept").addEventListener("click", function(){
  		Delete.delete_bill(id);
	});
}