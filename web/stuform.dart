
import 'dart:convert' show UTF8, JSON;
import 'package:cookie/cookie.dart'as cookie;
import 'dart:html';

void main() {
  /**var userlist=new List();
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user:"dec2013stu", password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query('select user_id,user_name, user_email from user_inf');
  results.forEach((row) {
    print('ID:${row[0]},Name: ${row[1]}, E-mail: ${row[2]}');
    userlist.add('"编号${row[0]}","姓名${row[1]}","邮箱${row[2]}"');
    //userlist.add(['"${row[0]}"','"${row[1]}"']);
    // userlist.add ({'"ID"':'"${row[0]}"','"Name"':'"${row[1]}"','"email"':'"${row[2]}"'});
    //IDlist.add('"${row[0]}"');
    //Namelist.add('"${row[1]}"');
  });
  // var query = await pool.prepare('insert into user_inf (user_name,user_email) values (?,?)');
  //var result = await query.execute(['SXJ', 'SXJ@163.com']);
  await for (var request in server) {


    request.response.headers
      ..add("Access-Control-Allow-Origin", "*")
      ..add("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
      ..add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(userlist)
    // ..write('[\n "portmanteau", "fantabulous", "spork", "smog",\n "spanglish", "gerrymander", "turducken", "stagflation",\n "bromance", "freeware", "oxbridge", "palimony", "netiquette",\n "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"\n]\n')
      ..close();

  }*/

    var name=cookie.get('name');
    var password =cookie.get('password');
    List list=[];
    list.add(name);
    list.add(password);
    document.getElementById('input1').value = name.toString();
    //querySelector('#test').text=username.toString();
   /** var path = 'http://127.0.0.1:8080';
    var httprequest=new HttpRequest();
    httprequest
      ..open('POST',path)
      ..send(JSON.encode(list));*/


}