import "dart:html";
import 'dart:convert';

void main(){
  var path = 'http://127.0.0.1:8080/email';//唯一的地址URL
  var httpRequest = new HttpRequest();//访问web网站的协议（网上请求文件——ftp超文本传输协议）
  httpRequest
    ..open('GET', path)//拨号，打开一条通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send();
}
requestComplete(HttpRequest request) {
  if (request.status == 200) {
    //200代表数据正确拿到
    List<String> my_email = JSON.decode(request.responseText);
    //decode代表解码
    querySelector("#club_name").text=my_email[0].toString();
    querySelector("#theme").text=my_email[0].toString();
    querySelector("#contain").text=my_email[1].toString();
  }
  else {
    querySelector("#theme").text="error";
  }


}