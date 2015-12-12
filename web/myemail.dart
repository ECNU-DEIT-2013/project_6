import "dart:html";
import 'dart:convert';
import 'package:dialog/dialog.dart';
import 'package:cookie/cookie.dart'as cookie;
var num=0;
List<String> my_email=[];

void main(){
  var name=cookie.get('name');
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
    querySelector("#club_name").text=my_email[0].toString();
    querySelector("#theme").text=my_email[0].toString();
    querySelector("#contain").text=my_email[1].toString();
    var num=my_email.length/2;
    var n=num.toString();
    cookie.set('email', '${n}' , expires: 7);
    var s=cookie.get('email');
    querySelector("#theme").text=s.toString();
  }
  else {
    querySelector("#theme").text="error";
  }
}

void previous_page(Event e){
  if(num==0) {alert('已经是最前页');}
  else{
    num=num-2;
    querySelector("#club_name").text=my_email[num].toString();
    querySelector("#theme").text=my_email[num].toString();
    querySelector("#contain").text=my_email[num+1].toString();
  }
}

void next_page(Event e){
  int n=my_email.length-1;
  if (num<=n-2){
    num=num+2;
    querySelector("#club_name").text=my_email[num].toString();
    querySelector("#theme").text=my_email[num].toString();
    querySelector("#contain").text=my_email[num+1].toString();

  }
  else{
    alert('已经到最后一页');
  }
}