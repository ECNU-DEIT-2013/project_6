import 'dart:html';
import 'dart:convert';

void main(){
  querySelector('#button3').onClick.listen(makeRequest);
}

void makeRequest(Event e) {
  var path = 'http://127.0.0.1:8080/studentpage';//唯一的地址URL
  var httpRequest = new HttpRequest();//访问web网站的协议（网上请求文件——ftp超文本传输协议）
  httpRequest
    ..open('GET', path)//拨号，打开一条通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))//搬运、打开一条异步通道“onloadend”数据搬完 为什么不写onloadstart
    ..send('');//把请求发送到服务器
}
requestComplete(HttpRequest request) {
  if (request.status == 200) {//200代表数据正确拿到
    List<String> portmanteaux = JSON.decode(request.responseText);//decode代表解码
   /** for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text= portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');*/

       }
}