import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';


main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    addCorsHeaders(request.response);
    var jsondata = await request.transform(UTF8.decoder).join();
    await register(jsondata);
    //await save(jsondata);
    request.response.close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

register(var x) async{
  var s =JSON.decode(x);
  var name=s[0];
  var password=s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340202');
  var query = await pool.prepare('insert into user_zl (password, name) values (?, ?)');
  await query.execute(['${password}', '${name}']);
}

save(var x) async{
  var s =JSON.decode(x);
  var sex=s[0];
  var department=s[1];
  var major=s[2];
  var grade=s[3];
  var dorm=s[4];
  var email=s[5];
  var tel=s[6];
  print(s);
  print(sex);
  print(department);
  //var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
 // var query = await pool.prepare('insert into user_inf (user_sex,user_department,user_major,user_grade,user_dorm,user_email,user_tel) values (?, ?, ?, ?, ?, ?, ?)');
 // await query.execute(['${sex}', '${department}']);
}