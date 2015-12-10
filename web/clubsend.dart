import "dart:html";
import 'dart:convert';

var clubname;
var nametest;

void main(){
  clubname = querySelector('#clubname');
  nametest = querySelector('#nametest');
  var path1 = 'http://127.0.0.1:8080/clubsend';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path1)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send();

  querySelector('#search').onClick.listen(searchbutton);
}

void searchbutton(Event e){
  var clubname = document.getElementById('clubname').value;
  var state = document.getElementById('state').value;
  var sql='SELECT user_name FROM club_user WHERE club_name="'+clubname.toString()+'" AND state="'+state.toString()+'"';
  document.getElementById('test').value=sql.toString();
  var path = 'http://127.0.0.1:8080/clubsendstu';
  var httprequest = new HttpRequest();
  httprequest
    ..open('POST', path)
    ..send(sql);
  var path1 = 'http://127.0.0.1:8080/clubsendstu';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path1)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest))
    ..send();
}
requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> clubsend = JSON.decode(request.responseText);
    for (int i = 0; i < clubsend.length; i++) {
      var myclub = new Element.html('<option value="'+clubsend[i]+'">'+clubsend[i]+'</option>');
      clubname.children.add(myclub);
    }
    clubsend = [];
  }
  else {
    querySelector("#theme").text="error";
  }
}
requestComplete1(HttpRequest request) {
  if (request.status == 200) {
    List<String> clubuser = JSON.decode(request.responseText);
    for (int i = 0; i < clubuser.length; i++) {
      nametest.children.add(new LIElement()..text =  clubuser[i]);
    }
    clubuser = [];
  }
  else {
    querySelector("#theme").text="error";
  }
}