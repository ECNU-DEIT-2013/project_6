import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';
import 'package:rest_frame/rest_frame.dart';

Router routerindex = new Router();
Router routerstuform = new Router();
Router routercheck = new Router();
var jsondata;
//全局变量，用于接收客户端传来的数据。

main() async {

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (HttpRequest request in server) {
    addCorsHeaders(request.response);
    jsondata = await request.transform(UTF8.decoder).join();
    print(jsondata);
    //register(jsondata);
    //save(jsondata);
    if (request.uri.path == "/index") {
      print("index page");
      register();
      routerindex.route(request);
    }
    else if (request.uri.path == "/stuform") {
      save();
      print("stuform page");
      routerstuform.route(request);
    }
    else if (request.uri.path == "/check") {
      check();
      print("check page");
      routercheck.route(request);
    }
    else {
      print("error!");
    }
    request.response.close();
  }
  routerindex.get(register, "/index");
  routerstuform.get(save, "/stuform");
  routercheck.get(check, "/check");
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

register() async {
  var s = JSON.decode(jsondata);
  var name = s[0];
  var password = s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var query = await pool.prepare('insert into login (password, name) values (?, ?)');
  await query.execute(['${password}', '${name}']);
}

save() async{
  var s = JSON.decode(jsondata);
  var name = s[0];
  var sex = s[1];
  var department = s[2];
  var major = s[3];
  var grade = s[4];
  var dorm = s[5];
  var email = s[6];
  var tel = s[7];
  print(s);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var query = await pool.prepare('insert into user_inf (user_name,user_sex,user_department,user_major,user_grade,user_dorm,user_email,user_tel) values (?, ?, ?, ?, ?, ?, ?, ?)');
  await query.execute(['${name}', '${sex}', '${department}', '${major}', '${grade}', '${dorm}', '${email}', '${tel}']);
}

check() async{
  var a;
  List list = [];
  var s = JSON.decode(jsondata);
  var name = s[0];
  var password = s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var string = 'select * from login where name = "${name}" and password = "${password}" ';
  var results = await pool.query(string);
  await results.forEach((row) {
    print('name: ${row[0]},password: ${row[1]}');
    a = '${row[1]}';
   // print(a);

  });
  //print(a);
  if (a != null) print('ok');
  else print('error');
  // print(list);

}
