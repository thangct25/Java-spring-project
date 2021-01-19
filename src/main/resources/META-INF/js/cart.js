var DeleteCart={
	delete_cart: function(id) {
			
				var data = {};
			data["maSanPham"] = id;			
			$.ajax({
				url: "/delete-cart-item",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
						setTimeout(function(){ location.reload(); }, 1000);
					
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
			
			}
			
}
function deleteCart(id){
	document.getElementById("accept").addEventListener("click", function(){
  		DeleteCart.delete_cart(id);
	});
}