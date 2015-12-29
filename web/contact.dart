import 'dart:html';
import 'dart:convert';
import 'package:dialog/dialog.dart';
import 'package:cookie/cookie.dart'as cookie;

TextAreaElement email;
var advice;
void main(){
  var name=cookie.get('name');
  if(name==null){
    alert('请先登录');
    window.location.href='index.html';
  }
  querySelector("#reset").onClick.listen(reset);
  querySelector("#send").onClick.listen(send);
}
void reset(Event e){
  document.getElementById('email').value="";
}
void send(Event e){
  email=querySelector('#email');
  if(email.value!=""){
    advice=email.value;
  alert('\n发送成功！\n感谢您的建议和意见！');
    document.getElementById('email').value="" ;}
  else
  {alert('\n发送内容不能为空！');}
  var path = 'http://127.0.0.1:8080/contact';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(advice));
 advice="";

}

