import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    addCorsHeaders(request.response);
    var jsondata = await request.transform(UTF8.decoder).join();
    await check(jsondata);
    request.response.close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

check (var x) async{
  List jsondata=[];
  var s =JSON.decode(x);
  var name=s[0];
  var password=s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340202');
  //var results = await pool.query('select * from user_zl where name like "${name}" and password like "${password}" ');
  var results = await pool.query('select * from user_zl where name = "name1" and password = "101" ');
  results.forEach((row) {
    print('name: ${row[1]},password: ${row[0]}');
    jsondata.add(row[0]);
    print(jsondata);
  });
  if(jsondata!=null) print('ok');
  else print ('error');
}
