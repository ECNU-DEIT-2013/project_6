import 'dart:html';
import'dart:convert' ;

InputElement username;
InputElement password;
List list;

void main() {
  username =querySelector('#user_name');
  password = querySelector('#user_password');
  //list.add(username.text);
 // list.add(password.text);
  querySelector('#register').onClick.listen(user_register);

}

void user_register(Event e){
  var path = 'http://127.0.0.1:8080';
  var httprequest=new HttpRequest();
    httprequest
      ..open('POST',path)
      ..send(JSON.encode(username.value.toString()));
}
