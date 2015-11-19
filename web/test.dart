import 'dart:html';
import'dart:convert' ;

InputElement username;
InputElement password;
List list;

 main() async{
  username =querySelector('#username');
  password = querySelector('#userpassword');
  // username=document.getElementById('username').value;
  // password=document.getElementById('password').value;
  //list.add(username.text);
  // list.add(password.text);
  //querySelector('#register').onClick.listen(user_register);
  querySelector('#register').onClick.listen(user_register);



}

void user_register(Event e){
  var path = 'http://127.0.0.1:8080';
  var httprequest=new HttpRequest();
  httprequest
    ..open('POST',path)
    ..send(JSON.encode(post()));
  var str1=username.value;
  var str2=password.value;
  String s='${str1}'+','+'${str2}';
  querySelector("#test").text=s.toString();
}

String post(){
  //String a='Lily'+','+'1234';
  var s1=username.value.toString();
  var s2=password.value.toString();
  String s=s1+','+s2;
  return (JSON.encode(s));
}