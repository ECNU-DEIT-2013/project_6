import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
void main(){
  var s=document.getElementById('test');
  var string=cookie.get('email');
    s.value=string;
  print("qs");
}