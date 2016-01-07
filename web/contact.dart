import 'dart:html';
import 'dart:convert';
import 'package:dialog/dialog.dart';
TextAreaElement email;
var advice;
var host;
void main(){
  host='http://52.193.36.64';
  querySelector("#reset").onClick.listen(reset);
  querySelector("#send").onClick.listen(send);
  var name=cookie.get('name');
  var password =cookie.get('password');
  //querySelector('#user_name').text = name.toString();
  if(name==null){
    alert('请先登录');
    window.location.href='index.html';}
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
  var path =host+ ':8080/contact';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(advice));
 advice="";

}

