import "dart:html";
import 'package:dialog/dialog.dart';
import 'dart:convert';
import 'package:cookie/cookie.dart'as cookie;


ImageElement picture1,picture2,picture3,picture4;
var num=0;
var host;
List<String> club_picture=[];
List<String> club_infor=[];
void main() {
 var name=cookie.get('name');
  if(name==null){
    alert('请先登录');
    window.location.href='index.html';}
   host='http://127.0.0.1';
  var path =host+ ':8080/clubinfor';
  var httprequest = new HttpRequest();
  httprequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httprequest))
    ..send('');



  picture1=querySelector("#picture1");
  picture2=querySelector("#picture2");
  picture3=querySelector("#picture3");
  picture4=querySelector("#picture4");
  picture1.src="club_picture/picture1.jpg";
  picture2.src="club_picture/picture2.jpg";
  picture3.src="club_picture/picture3.jpg";
  picture4.src="club_picture/picture4.jpg";


  for(int i=1;i<9;i++){
    club_picture.add('club_picture/picture'+i.toString()+'.jpg');
    //document.getElementById('test').value=club_picture[0];
  }


  querySelector("#last").onClick.listen(lbutton);
  querySelector("#next").onClick.listen(nbutton);
}
void lbutton(Event e){
  if(num==0) {alert('已经是第一页！');}
  else{
    num=num-4;
    picture1.src=club_picture[num];
    picture2.src=club_picture[num+1];
    picture3.src=club_picture[num+2];
    picture4.src=club_picture[num+3];
    document.getElementById('text1').text=club_infor[num].toString();
    document.getElementById('text2').text=club_infor[num+1].toString();
    document.getElementById('text3').text=club_infor[num+2].toString();
    document.getElementById('text4').text=club_infor[num+3].toString();
  }


}
void nbutton(Event e) {
  if(num!=4){
    num = num + 4;
    picture1.src=club_picture[num];
    picture2.src=club_picture[num+1];
    picture3.src=club_picture[num+2];
    picture4.src=club_picture[num+3];
    document.getElementById('text1').text=club_infor[num].toString();
    document.getElementById('text2').text=club_infor[num+1].toString();
    document.getElementById('text3').text=club_infor[num+2].toString();
    document.getElementById('text4').text=club_infor[num+3].toString();
  }
  else {
    alert('已经是最后一页！');
  }
}
requestComplete(HttpRequest request) {
  if (request.status == 200) {
    club_infor = JSON.decode(request.responseText);


    document.getElementById('text1').text=club_infor[0].toString();
    document.getElementById('text2').text=club_infor[1].toString();
    document.getElementById('text3').text=club_infor[2].toString();
    document.getElementById('text4').text=club_infor[3].toString();


  }}