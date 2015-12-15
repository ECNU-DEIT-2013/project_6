import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;

ImageElement button_3;
ImageElement button_2;
InputElement todoInput;
void main(){
 // var name=cookie.get('name');

 //document.getElementById('button_3').src="index_picture/button2.png";
  todoInput=querySelector('#test');
  todoInput.value="hello";
button_3=querySelector('#button_3');
  button_2=querySelector('#button_2');
button_3.src="index_picture/button3.png";
  button_2.src="index_picture/button2.png";
}