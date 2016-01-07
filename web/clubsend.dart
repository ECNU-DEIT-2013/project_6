import "dart:html";
import 'dart:convert';
import 'package:dialog/dialog.dart';
import 'package:cookie/cookie.dart'as cookie;
var clubname;
var namelist;
var host;
List check_name = [];
List sqllist=[];

void main(){
  host='http://52.193.36.64';
  var name=cookie.get('name');
  if(name==null){
    alert('请先登录');
    window.location.href='admin.html';
  }
  clubname = querySelector('#clubname');
  namelist = querySelector('#namelist');
  var path1 = host+':8080/clubsend';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path1)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send();

  querySelector('#search').onClick.listen(searchbutton);
  querySelector('#send').onClick.listen(sendmessage);
}

void searchbutton(Event e){
  var clubname = document.getElementById('clubname').value;
  var state = document.getElementById('state').value;
  var sql='SELECT user_name FROM club_user WHERE club_name="'+clubname.toString()+'" AND state="'+state.toString()+'"';
  // document.getElementById('test').value=sql.toString();

  var path =  host+':8080/clubsendstu';
  /**
   * comment by feng xiang ：问题：为何两次请求？你第二次请求上没有send(sql)，当然无法获取正确
   * 值。并且你第一个请求没有listen，所以根本无法获取。
   */
  /*httprequest
    ..open('POST', path)
    ..send(sql);*/
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('POST', path)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest))
    ..send(sql);
}

void sendmessage(Event e){

  var obj = document.getElementsByName("category");
  var clubname = document.getElementById('clubname').value;
  var num=obj.length;
  var i;
  for(i=0;i<num;i++) {
    if (obj[i].checked) {
      check_name.add(obj[i].value);
    }
  }//获取checkbox中所选学生的名字
  //alert(check_name);
  var message=document.getElementById("message").value;//获取textarea中所要发送的信息
  for(i=0;i<check_name.length;i++){
    //sqllist.add('UPDATE club_user SET message = "'+message.toString()+'" WHERE user_name="'+check_name[i]+'"');
    sqllist.add('INSERT INTO user_message(user_name,club_name,message) VALUES("'+check_name[i]+'","'+clubname.toString()+'","'+message.toString()+'")');
  }
  var path1 =  host+':8080/clubsendemail';
  var httpRequest1 = new HttpRequest();
  httpRequest1
    ..open('POST', path1)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest1))
    ..send(JSON.encode(check_name));
  var path2 = host+':8080/clubsendmessage';
  var httpRequest2 = new HttpRequest();
  httpRequest2
    ..open('POST', path2)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest2))
    ..send(message);
  var path = host+':8080/clubsendsql';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('POST', path)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest))
    ..send(JSON.encode(sqllist));
  alert("发送成功");
  sqllist=[];
  check_name=[];

}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> clubsend = JSON.decode(request.responseText);

      for (int i = 0; i < clubsend.length; i++) {
        var myclub = new Element.html('<option value="' + clubsend[i] + '">' + clubsend[i] + '</option>');
        clubname.children.add(myclub);
      }
    clubsend = [];
  }
  else {
    alert("error");
  }
}
requestComplete1(HttpRequest request) {
  if (request.status == 200) {
    List<String> clubuser = JSON.decode(request.responseText);
    var elem=new Element.html('<div id="namelist"></div>');
    querySelector('#namelist').replaceWith(elem);
      for (int i = 0; i < clubuser.length; i++) {
        // querySelector('#namelist').children.add(new LIElement()..text =  clubuser[i]);
        var elem1 = new Element.html(' <p><input type="checkbox" name="category" value="' + clubuser[i] + '" />' + clubuser[i] + ' </p>');
        querySelector('#namelist').children.add(elem1);
      }

    clubuser = [];
  }
  else {
    querySelector("#theme").text="error";
  }
}
