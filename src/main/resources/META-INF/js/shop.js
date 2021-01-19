var Shop = {
		
		/**
		 * https://www.w3schools.com/js/js_json_syntax.asp
		 */
		saveContact: function() {
			var data = {};
			data["email"] = $("#exampleInputEmail1").val();			
			$.ajax({
				url: "/subcribe-email",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					
					 $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
}

var Delete={
	delete_product: function(id) {
			var r = confirm("Bạn muốn xóa sản phẩm này ?");
			if(r ==true){
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
}
var DeleteCategory={
	delete_category: function(id) {
			var r = confirm("Bạn muốn xóa danh mục này ?");
			if(r ==true){
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
}




function sortFunction() {
  var url=window.location.href;
  var obj=new URL(url);  
  obj.searchParams.delete('sort');  
  obj.searchParams.append('sort', document.getElementById("sort").value);
  window.location.href=obj; 
}
function load(){
	var url = new URL(window.location.href);
	var c = url.searchParams.get("sort");
	var min=url.searchParams.get("min");
	var max=url.searchParams.get("max");
	if(c != null) {
		document.getElementById("sort").value = c;
	};
	if(min != null) {
		document.getElementById("min").value = min;
	};
	if(max != null) {
		document.getElementById("max").value = max;
	};
}

function searchPrice(){
	var min=document.getElementById("min").value;
	var max=document.getElementById("max").value;
	var url=window.location.href;
  	var obj=new URL(url);  
  	obj.searchParams.delete('min');
  	obj.searchParams.delete('max');  
  	obj.searchParams.delete('page'); 
    obj.searchParams.append('min', min);
    obj.searchParams.append('max', max);
    obj.searchParams.append('page', 1);
    window.location.href=obj;
}
function changePage(page){
	var url=window.location.href;
  	var obj=new URL(url);  
  	obj.searchParams.delete('page');
  	obj.searchParams.append('page', page);
  	window.location.href=obj;
}






