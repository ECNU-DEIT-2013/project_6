import "dart:html";
import 'dart:convert';
import 'package:dialog/dialog.dart';
import 'package:cookie/cookie.dart'as cookie;
var num=0;
var number;
var n;
List<String> my_email=[];


void main(){
  var name=cookie.get('name');
  if(name==null){
    alert('请先登录');
    window.location.href='index.html';
  }
  var path = 'http://127.0.0.1:8080/email';//唯一的地址URL
  var httpRequest = new HttpRequest();//访问web网站的协议（网上请求文件——ftp超文本传输协议）
  httpRequest
    ..open('GET', path)//拨号，打开一条通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..open('POST', path)
    ..send(JSON.encode(name));
  querySelector('#button1').onClick.listen(previous_page);
  querySelector('#button').onClick.listen(next_page);

}
requestComplete(HttpRequest request) {
  if (request.status == 200) {
    //200代表数据正确拿到
    my_email = JSON.decode(request.responseText);
    //decode代表解码
     n=my_email.length.toInt();
     number=n/2;
    querySelector("#theme").text=number.toString();
  }
  else {
    querySelector("#theme").text="0";
  }
  num=n;
  querySelector("#club_name").text=my_email[num-2].toString();
  querySelector("#contain").text=my_email[num-1].toString();
  num=n-2;
}

void previous_page(Event e){
  if(num==n) {alert('已经是最前页');}
  else{
    num=num+2;
    querySelector("#club_name").text=my_email[num].toString();
    querySelector("#contain").text=my_email[num+1].toString();
    querySelector("#theme").text=number.toString();
  }
}

void next_page(Event e){
  if (number!=0){
    if(num>0){
      num=num-2;
      number=number-1;
      querySelector("#club_name").text=my_email[num].toString();
      querySelector("#theme").text=number.toString();
      querySelector("#contain").text=my_email[num+1].toString();
    }
    else{
      alert('已经到最后一页');
      querySelector("#theme").text="0";
    }
  }
  else{
    querySelector("#theme").text="无未读邮件";
    alert('没有未读邮件');
    querySelector("#contain").text="";
    querySelector("#club_name").text="";
  }

}