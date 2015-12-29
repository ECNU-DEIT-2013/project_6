import "dart:html";
import 'package:dialog/dialog.dart';
import 'dart:async';
import 'dart:io';

ImageElement picture1,picture2,picture3,picture4;
var num=0;
List<String> club_picture=[];

void main(){
  var path = 'http://127.0.0.1:8080/clubinfor';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(JSON.encode(advice));
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
  if(num==0) {alert('已经是最前页�?');}
  else{
    num=num-4;
    picture1.src=club_picture[num];
    picture2.src=club_picture[num+1];
    picture3.src=club_picture[num+2];
    picture4.src=club_picture[num+3];
  }


}
void nbutton(Event e) {
  if(num!=4){
    num = num + 4;
    picture1.src=club_picture[num];
    picture2.src=club_picture[num+1];
    picture3.src=club_picture[num+2];
    picture4.src=club_picture[num+3];
  }
  else {
    alert('已经是最后一页!');
  }
}