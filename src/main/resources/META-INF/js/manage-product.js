var Delete={
	delete_product: function(id) {
				var data = {};
			data["id"] = id;			
			$.ajax({
				url: "/delete-product",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					document.getElementById(id).style.display="none"
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
			
			
		}
}


var DeleteCategory={
	delete_category: function(id) {
				var data = {};
			data["id"] = id;			
			$.ajax({
				url: "/delete-category",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					document.getElementById(id+"-category").style.display="none"
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
}

var AddCategory={
	add_category: function() {
				var newCategory=$("#categoryInput").val();
				var data = {};
			data["name"] = newCategory;			
			$.ajax({
				url: "/add-category",
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



function deleteProduct(id){
	document.getElementById("accept").addEventListener("click", function(){
  		Delete.delete_product(id);
	});
}
function deleteCategory(id){
	document.getElementById("accept").addEventListener("click", function(){
  		DeleteCategory.delete_category(id);
	});
}

var idCat=0;
function getCategoryName(id){
	var categoryName=$("#"+id+"-name").html();
	$(document).on("click", "#"+id+"-name", function() {
  		$("#categoryNamed").val(categoryName);
	});
	
	idCat+=id;
	console.log(idCat)
}

var Change={
	change_category: function() {
				var updateCategory=$("#categoryNamed").val();
				var data = {};
			data["id"]= idCat;	
			data["name"] = updateCategory;			
			$.ajax({
				url: "/change-category",
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




