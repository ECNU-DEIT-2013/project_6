import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
<<<<<<< HEAD

var n;

void main(){
  //var n=cookie.get('email');
  querySelector('#test').text="sds";
  //document.getElementById('test').value=n.toString();

}

=======
void main(){
  var s=document.getElementById('test');
  var string=cookie.get('email');
    s.value=string;
  print("qs");
}
>>>>>>> refs/remotes/origin/10130340202
