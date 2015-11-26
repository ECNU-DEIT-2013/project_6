import 'dart:html';
import'dart:convert' ;

var username;
var password;
List list=[];

void main() {
  querySelector('#register').onClick.listen(user_register);

}

void user_register(Event e) {
  username = document.getElementById('user_name').value;
  password = document.getElementById('user_password').value;
  if(username.length!=0) {
    list.add(username);
    list.add(password);
    var path = 'http://127.0.0.1:8080';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));
  }
  else {
    document.getElementById('test').value="error";
  }

}
