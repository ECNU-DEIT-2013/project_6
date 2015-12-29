import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';


void main(){
  var name=cookie.get('name');
  document.getElementById('test').value=name;
  if(name==null){
   alert('请先登录');
   window.location.href='index.html';
  }
}