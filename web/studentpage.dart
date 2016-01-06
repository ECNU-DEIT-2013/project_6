import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
import 'dart:convert';
import 'package:dialog/dialog.dart';
ImageElement button_3;//存放图片
InputElement todoInput;
List<String> my_email=[];//存放从服务器中传过来的值
void main(){
  var name=cookie.get('name');
  if(name==null){
   alert('请先登录');
   window.location.href='index.html';
  }
  var path = 'http://127.0.0.1:8080/studentpage';//唯一的地址URL
  var httpRequest = new HttpRequest();//访问web网站的协议（网上请求文件——ftp超文本传输协议）
  httpRequest
    //..open('GET', path)//拨号，打开一条通道
    ..open('POST', path)
    ..send(JSON.encode(name))//把用户名传给服务器，服务器根据用户名进行查找与用户名匹配的信息
    ..onLoadEnd.listen((e) => requestComplete(httpRequest));
}
requestComplete(HttpRequest request) {
  if (request.status == 200) {
    //200代表数据正确拿到
    my_email = JSON.decode(request.responseText);
    var num=my_email.length;
    //document.getElementById('test').value=my_email.toString();//判断是否有新消息
    button_3=querySelector("#button_3");
    if(num==0) {
      button_3.src="index_picture/button3.png";//在没有新消息的情况下，使用button_3图片
    }
    else{
      button_3.src="index_picture/button3_1.png";//有了新消息之后会使用button_3_1图片
    }
  }
}
