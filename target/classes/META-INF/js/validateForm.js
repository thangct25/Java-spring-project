function validateForm() {
  var username = document.getElementById('USERNAME1').value;
  var email = document.getElementById('EMAIL1').value;
  var phone = document.getElementById('SDT1').value;
  var password = document.getElementById('PASSWORD1').value;
  //
  var userNameRGEX = /^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/g;
  var emailRGEX=/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
  var phoneRGEX=/([0-9]{10})\b/g;
  var passwordRGEX=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,10}$/g;
  //
  var resultUserTest = userNameRGEX.test(username);
  var esultEmailTest =emailRGEX.test(email);
  var phoneTest=phoneRGEX.test(phone);
  var passwordTest=passwordRGEX.test(password);
  //
  if(resultUserTest == false) document.getElementById("userLoc").innerHTML = "Nhập lại tài khoản !";
  if(esultEmailTest == false) document.getElementById("emailLoc").innerHTML = "Nhập lại email !";
 if(phoneTest == false) document.getElementById("sdtLoc").innerHTML = "Nhập lại sdt !";
  if(passwordTest == false) document.getElementById("passwordLoc").innerHTML = "Nhập lại mật khẩu !(ít nhất 1 kí tự viết hoa , 1 kí tự số , 1 kí tự đặc biệt và độ dài lớn hơn 8)";
  
  return resultUserTest&&esultEmailTest&&passwordTest&&phoneTest;
}