import 'dart:html';
import 'dart:convert';
import 'package:cookie/cookie.dart'as cookie;
import 'package:rest_frame/rest_frame.dart';

InputElement  usersex_in;
InputElement userdepartment_in;
InputElement usergrade_in;
InputElement usermajor_in;
InputElement userdorm_in;
InputElement useremail_in;
InputElement usertel_in;

var usersex;
var userdepartment;
var usergrade;
var usermajor;
var userdorm;
var useremail;
var usertel;
List list=[];


void main() {
  var name=cookie.get('name');
  var password =cookie.get('password');
  querySelector('#user_name').text = name.toString();

  list.add(name);
  querySelector("#save").onClick.listen(user_save);
  querySelector("#reset").onClick.listen(user_reset);


}

void user_save(Event e) {
  usersex_in = querySelector('#user_sex');
  userdepartment_in = querySelector('#user_department');
  usermajor_in = querySelector('#user_major');
  usergrade_in = querySelector('#user_grade');
  userdorm_in = querySelector('#user_dorm');
  useremail_in = querySelector('#user_email');
  usertel_in = querySelector('#user_tel');

  usersex = usersex_in.value;
  userdepartment = userdepartment_in.value;
  usermajor = usermajor_in.value;
  usergrade = usergrade_in.value;
  userdorm =  userdorm_in.value;
  useremail =useremail_in .value;
  usertel = usertel_in.value;
  list.add(usersex);
  list.add(userdepartment);
  list.add(usermajor);
  list.add(usergrade);
  list.add(userdorm);
  list.add(useremail);
  list.add(usertel);
  var path = 'http://127.0.0.1:8080/stuform';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(list));
  list=[];

}

void user_reset(Event e) {
  querySelector('#user_sex').text="";
  querySelector('#user_department').text="";
  querySelector('#user_major').text="";
  querySelector('#user_grade').text="";
  querySelector('#user_dorm').text="";
  querySelector('#user_email').text="";
  querySelector('#user_tel').text="";

}