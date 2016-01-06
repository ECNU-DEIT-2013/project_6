import 'dart:html';
import 'dart:convert';
import 'package:cookie/cookie.dart'as cookie;
import 'package:rest_frame/rest_frame.dart';
import 'package:dialog/dialog.dart';

InputElement  user_for;
InputElement userhobby_in;
InputElement userhonor_in;
InputElement userthink_in;
InputElement userfut_in;


var userfor;
var userhobby;
var userhonor;
var userthink;
var userfut;
var host;

List list=[];


void main() {
  host='http://127.0.0.1';
  var name=cookie.get('name');
  var password =cookie.get('password');
  //querySelector('#user_name').text = name.toString();
  if(name==null){
    alert('请先登录');
    window.location.href='index.html';}
//  document.getElementById('user_name').value = name.toString();
  querySelector("#save").onClick.listen((_) async{

    var myConfirm1 = await confirm("是否提交报名表？");

    if (myConfirm1.toString()=='true'){
      user_save();
      alert('\n保存成功！');
    }
    else {alert('\n请继续填写！');}
  });
  querySelector("#reset").onClick.listen((_) async{
    var myConfirm2 = await confirm("是否重置报名表？");
    if (myConfirm2.toString()=='true'){
      user_reset();
      alert('\n重置成功！');

    }
    else {alert('\n请继续填写报名表！');}
  });;


}

void user_save(){
  var value="";
  var radio=document.getElementsByName("for");
  for(var i=0;i<radio.length;i++){
    if(radio[i].checked==true){
      value=radio[i].value;
      break;
    }
  }
  // user_for = querySelector('#for');
  userhobby_in = querySelector('#user_hobby');
  userhonor_in = querySelector('#user_honor');
  userthink_in = querySelector('#user_think');
  userfut_in= querySelector('#user_fut');


  userfor = value.toString();
  userhobby = userhobby_in.value;
  userhonor = userhonor_in.value;
  userthink = userthink_in.value;
  userfut =  userfut_in.value;

  var name=cookie.get('name');

  list.add(userfor);
  list.add(userhobby);
  list.add(userhonor);
  list.add(userthink);
  list.add(userfut);
  list.add(name);

  var path = host+':8080/stusign';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(list));
  list=[];

}

void user_reset() {

  document.getElementById('user_hobby').value="";
  document.getElementById('user_think').value="";
  document.getElementById('user_honor').value="";
  document.getElementById('user_fut').value="";

}