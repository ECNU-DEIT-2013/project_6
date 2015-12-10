import 'dart:html';
import 'dart:convert';
import 'package:cookie/cookie.dart'as cookie;
import 'package:rest_frame/rest_frame.dart';
import 'package:dialog/dialog.dart';

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
  //querySelector('#user_name').text = name.toString();
  document.getElementById('user_name').value = name.toString();
  list.add(name);
  querySelector("#save").onClick.listen((_) async{
    var myConfirm1 = await confirm("是否保存基本信息？");
    if (myConfirm1.toString()=='true'){
      user_save();
      alert('\n保存成功！');

    }
    else {alert('\n请继续维护信息！');}
  });
  querySelector("#reset").onClick.listen((_) async{
    var myConfirm2 = await confirm("是否重置基本信息？");
    if (myConfirm2.toString()=='true'){
      user_reset();
      alert('\n重置成功！');

    }
    else {alert('\n请继续维护信息！');}
  });;


}

void user_save(){
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
  var path = 'http://127.0.0.1:8015/stuform';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(list));
  list=[];

}

void user_reset() {
  /*querySelector('#user_sex').text="";
  querySelector('#user_department').text="";
  querySelector('#user_major').text="";
  querySelector('#user_grade').text="";
  querySelector('#user_dorm').text="";
  querySelector('#user_email').text="";
  querySelector('#user_tel').text=""; */
  document.getElementById('user_sex').value="";
  document.getElementById('user_department').value="";
  document.getElementById('user_major').value="";
  document.getElementById('user_grade').value="";
  document.getElementById('user_dorm').value="";
  document.getElementById('user_email').value="";
  document.getElementById('user_tel').value="";
}