import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
import 'dart:convert';

ImageElement button_3;//���ͼƬ
InputElement todoInput;
List<String> my_email=[];//��Ŵӷ������д�������ֵ
void main(){
  var name=cookie.get('name');
  document.getElementById('test').value=name.toString();
  var path = 'http://127.0.0.1:8080/studentpage';//Ψһ�ĵ�ַURL
  var httpRequest = new HttpRequest();//����web��վ��Э�飨���������ļ�����ftp���ı�����Э�飩
  httpRequest
  //..open('GET', path)//���ţ���һ��ͨ��
    ..open('POST', path)
    ..send(JSON.encode(name))//���û��������������������������û������в������û���ƥ�����Ϣ
    ..onLoadEnd.listen((e) => requestComplete(httpRequest));
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    //200����������ȷ�õ�
    my_email = JSON.decode(request.responseText);
    var num=my_email.length;
    //document.getElementById('test').value=my_email.toString();//�ж��Ƿ�������Ϣ
    button_3=querySelector('#button_3');
    if(num==0) {
      button_3.src="index_picture/button3.png";//��û������Ϣ������£�ʹ��button_3ͼƬ
    }
    else{
      button_3.src="index_picture/button3_1.png";//��������Ϣ֮���ʹ��button_3_1ͼƬ
    }
  }
}