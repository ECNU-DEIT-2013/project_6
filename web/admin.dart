import 'dart:html';
import 'package:dialog/dialog.dart';
import 'package:cookie/cookie.dart'as cookie;
var username;
var password;
List list=[];
void main() {
  querySelector('#login').onClick.listen(user_login);//点击登录按钮之后执行user_login函数
}
 user_login(Event e) async{
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
      if(password=="admin")//设置默认的用户名和密码（用户名：admin; 密码：admin）
      {
        var confirm1=await confirm ('是否保存用户名和密码');
        if(confirm1.toString()=='true'){
          cookie.set('name', '${username}', expires: 7);
          cookie.set('password', '${password}', expires: 7);//用户名和密码保存7天
        }
        else
        {
          cookie.set('name', '${username}', expires: 1/24);
          cookie.set('password', '${password}', expires: 1/24);//用户名和密码保存1个小时
        }
        await alert('登录成功');
        window.location.href="clubsend.html";//登录成功之后跳转到clubsend。html
      }
      else
        alert("密码错误");
    else
      alert("用户名错误");
  }
}