var DeleteOrder={
	delete_order: function(id) {
				var data = {};
			data["id"] = id;			
			$.ajax({
				url: "/delete-order-item",
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

function deleteOrder(id){
	document.getElementById("acceptDelete").addEventListener("click", function(){
  		DeleteOrder.delete_order(id);
	});
}