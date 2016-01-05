import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';

void main(){
  var name=cookie.get('name');
  if(name==null){
   alert('请先登录');
   window.location.href='index.html';//使用cookie方法判断用户有无登录，如果没有登录，则会跳转到登录页面
  }
}