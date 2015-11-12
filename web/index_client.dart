import 'dart:html';
import'dart:convert' ;
import 'package:sqljocky/sqljocky.dart';

var username;
var password;
var pool;
var results;
InputElement text;
List jsondata=[];

void main() {
  querySelector('#test').text = "hello";
  username = document.getElementById('#user_name');
  password =  document.getElementById('#user_password');
  text=querySelector('user_name');

}


