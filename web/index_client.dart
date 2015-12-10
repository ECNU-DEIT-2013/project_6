import 'dart:async';

import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';
//import 'dart:io';


var username;
var password;
List list=[];

void main() {
  querySelector('#register').onClick.listen(user_register);
  querySelector('#login').onClick.listen(user_login);
  querySelector('#login').onClick.listen(getrs);
}

void user_register(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//获取用户名
  password = document.getElementById('user_password').value;//获取密码
  if(username.length==0) {
    alert('用户名为空');

  }
  else if(password.length==0){;
    alert('密码为空');

  }
  else{
    window.location.href="stu.html";
    list.add(username);
    list.add(password);//在list上加入用户名和密码的信息
    var path ='http://127.0.0.1:8015/index';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));//将list中的内容以json文件的格式传输给服务器
    alert('注册成功！');
    cookie.set('name', '${username}', expires: 7);
    cookie.set('password', '${password}', expires: 7);
    cookie.set('check', 'first', expires: 7);
  }

}

void user_login(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//获取用户名
  password = document.getElementById('user_password').value;//获取密码
  if (username.length == 0) {
    alert('用户名为空');
  }
  else if (password.length == 0) {
    alert('密码为空');
  }
  else {

    list.add(username);
    list.add(password);//在list上加入用户名和密码的信息
    var path = 'http://127.0.0.1:8015/check';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));
    cookie.set('name', '${username}', expires: 7);
    cookie.set('password', '${password}', expires: 7);
    //将list中的内容以json文件的格式传输给服务器
  }

}
/* 读取储存在json文件中的服务器的判断结果*/
 void getrs(MouseEvent e){
   username = document.getElementById('user_name').value;

  var path = 'http://localhost:63342/project_6/temp.json';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');

}
  requestComplete(HttpRequest request) {
    if (request.status == 200) {
      List<String> portmanteaux = JSON.decode(request.responseText);
      String rs1= portmanteaux[0].toString();
      if(rs1=='o'){window.location.href="stu.html";}
      else alert("登录失败");
      //alert("请重试！");
    } else {
      document.getElementById('user_name').value = 'Request failed, status=${request.status}';
    }
  }

  // if(HttpSession.containsValue('OK')){ window.location.href="stu.html";}

