import 'dart:html';
import'dart:convert' ;
import 'package:dialog/dialog.dart';


var username;
var password;
List list=[];

void main() {
  querySelector('#login').onClick.listen(user_login);
}
void user_login(Event e){
  username = document.getElementById('user_name').value;//获取用户名
  password = document.getElementById('user_password').value;//获取密码
  if(username.length==0) {
    alert('用户名为空');

  }
  else if(password.length==0){;
  alert('密码为空');

}
  else{
    if (username=="admin")
      if(password=="admin")
        window.location.href="clubsend.html";
      else
        alert("密码错误");
    else
      alert("用户名错误");
  }

}