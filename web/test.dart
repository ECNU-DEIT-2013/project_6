import 'dart:html';
import'dart:convert' ;

var username,password;
List list=[];

 main() async{


  //list.add(username.text);
  // list.add(password.text);
  //querySelector('#register').onClick.listen(user_register);
  querySelector('#register').onClick.listen(user_register);



}

void user_register(Event e){
  username=document.getElementById('username').value;
  password=document.getElementById('password').value;
  list.add(username);
  list.add(password);
  querySelector('#test').text=username.toString();
  var path = 'http://127.0.0.1:8080';
  var httprequest=new HttpRequest();
  httprequest
    ..open('POST',path)
    ..send(JSON.encode(list));

}
