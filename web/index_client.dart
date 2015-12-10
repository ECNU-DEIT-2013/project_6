
import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';


var username;
var password;
List list=[];
List s=[];

void main() {
  querySelector('#register').onClick.listen(user_register);
  querySelector('#login').onClick.listen(user_login);
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
    list.add(username);
    list.add(password);//在list上加入用户名和密码的信息
    var path ='http://127.0.0.1:8080/index';
    var httprequest = new HttpRequest();
    httprequest
      ..open('GET', path)//拨号，打开一条通道
      ..onLoadEnd.listen((e) => requestComplete(httprequest))
      ..open('POST', path)
      ..send(JSON.encode(list));//将list中的内容以json文件的格式传输给服务器

  }

}

void user_login(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//获取用户名
  password = document.getElementById('user_password').value;//获取密码
  if(username.length==0) {
    alert('用户名为空');
  }
  else if(password.length==0){
    alert('密码为空');
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

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    //200代表数据正确拿到
    s = JSON.decode(request.responseText);
    print("hello");
    print(s);
    //decode代表解码
    if (s[0]=="flase"){
      alert('用户名已经存在');
    }
    else
    {
      window.location.href="stu.html";
      alert('注册成功！');
      cookie.set('name', '${username}', expires: 7);
      cookie.set('password', '${password}', expires: 7);
      //cookie.set('check', 'true', expires: 7);
    }
  }
}