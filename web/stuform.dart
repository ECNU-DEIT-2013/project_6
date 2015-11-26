import 'dart:html';
import 'dart:convert';
//import 'package:cookie/cookie.dart'as cookie;


/**var usersex;
var userdepartment;
var usergrade;
var usermajor;
var userdorm;
var useremail;
var usertel;
List list=[];*/

void main() {
  print("tste");
  print("test 2");
  var ele=querySelector("#save");
  querySelector("#save").onClick.listen(user_save);
  querySelector('#save').onClick.listen(user_save);

}

void user_save(Event e) {

 /** usersex = document.getElementById('user_sex').value;
  userdepartment = document.getElementById('user_department').value;
  usermajor = document.getElementById('user_major').value;
  usergrade = document.getElementById('user_grade').value;
  userdorm = document.getElementById('user_dorm').value;
  useremail = document.getElementById('user_email').value;
  usertel = document.getElementById('user_tel').value;
  list.add(usersex);
  list.add(userdepartment);
  list.add(usermajor);
  list.add(usergrade);
  list.add(userdorm);
  list.add(useremail);
  list.add(usertel);*/
  document.getElementById('test').value = "sdadfa";
  // var path = 'http://127.0.0.1:8080';
  // var httprequest = new HttpRequest();
  //httprequest
  // ..open('POST', path)
  // ..send(JSON.encode(list));
  }

