import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';

var username;
var password;
var host;
List list=[];
List s=[];
List check=[];
void main() {
  host='http://127.0.0.1';
  querySelector('#register').onClick.listen(user_register);
  querySelector('#login').onClick.listen(user_login);
}
void user_register(Event e) {
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
    var path =host+':8080/index';
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
    var path =host+':8080/check';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list))//将list中的内容以json文件的格式传输给服务器
      ..onLoadEnd.listen((e) => requestComplete_login(httprequest));

  }
}
requestComplete(HttpRequest request)async {
  if (request.status == 200) {
    //200代表数据正确拿到
    s = JSON.decode(request.responseText);
    //decode代表解码
    if (s==""){
      await alert('用户名已经存在');
    }
    else
    {
      var confirm2=await confirm ('是否保存用户名和密码');
      if(confirm2.toString()=='true'){
        cookie.set('name', '${username}', expires: 7);
        cookie.set('password', '${password}', expires: 7);//用户名和密码保存7天
      }
      else{
        cookie.set('name', '${username}', expires: 1/24);
        cookie.set('password', '${password}', expires: 1/24);//用户名和密码保存1小时
      }
      await alert('注册成功！');
      window.location.href="stu.html";//注册成功之后跳转到stu.html
    }
  }
}
requestComplete_login(HttpRequest request) async {
  if (request.status == 200) {
    check = JSON.decode(request.responseText);
    if(check=="ok"){
     //alert();
     var confirm1=await confirm ('是否保存用户名和密码');
     if(confirm1.toString()=='true'){
       cookie.set('name', '${username}', expires: 7);//用户名和密码保存7天
       cookie.set('password', '${password}', expires: 7);
     }
     else{
       cookie.set('name', '${username}', expires: 1/24);
       cookie.set('password', '${password}', expires: 1/24);//用户名和密码保存1小时
     }
    await  alert("success");
     window.location.href="stu.html";
    }
    else{
      alert("登录失败");
    }
  }
}