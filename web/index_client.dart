import 'dart:html';
import'dart:convert' ;
import 'dart:isolate';



var username;
var password;
List list=[];


void main() {
  querySelector('#register').onClick.listen(user_register);

}

void user_register(Event e) {
 // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//获取用户名
  password = document.getElementById('user_password').value;//获取密码
  if(username.length==0) {
    window.alert('用户名为空');
  }
  else if(password.length==0){;
      window.alert('密码为空');
    }
  else{
      list.add(username);
      list.add(password);//在list上加入用户名和密码的信息
      var path = 'http://127.0.0.1:8080';
      var httprequest = new HttpRequest();
      httprequest
        ..open('POST', path)
        ..send(JSON.encode(list));//将list中的内容以json文件的格式传输给服务器
    }

}
