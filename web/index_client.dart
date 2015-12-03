
import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;


List list=[];

InputElement username_in;
InputElement password_in;

var username;
var password;

void main() {
  querySelector('#register').onClick.listen(user_register);
  querySelector('#login').onClick.listen(user_login);
}

void user_register(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username_in =  querySelector('#user_name');//获取用户名
  password_in = querySelector('#user_password');//获取密码
  username=username_in.value;
  password=password_in.value;
  if(username=="") {
    window.alert('用户名为空');
  }
  else if(password==""){;
  window.alert('密码为空');
  }
  else{
    list.add(username);
    list.add(password);//在list上加入用户名和密码的信息
    var path ='http://127.0.0.1:8080/index';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));//将list中的内容以json文件的格式传输给服务器
    cookie.set('name', '${username}', expires: 7);
    cookie.set('password', '${password}', expires: 7);
    cookie.set('check', 'true', expires: 7);
  }

}

void user_login(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username_in =  querySelector('#user_name');//获取用户名
  password_in = querySelector('#user_password');//获取密码
  username=username_in.value;
  password=password_in.value;
  if(username=="") {
    window.alert('用户名为空');
  }
  else if(password==""){;
  window.alert('密码为空');
  }
  else{

    list.add(username);
    list.add(password);//在list上加入用户名和密码的信息
    var path ='http://127.0.0.1:8080/check';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));//将list中的内容以json文件的格式传输给服务器

  }

}