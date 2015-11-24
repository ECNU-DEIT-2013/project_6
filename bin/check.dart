import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';



List jsondata;



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
  var s =JSON.decode(x);
  var name=s[0];
  var password=s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340202');
  var results = await pool.query('select name, password from user_zl where name=" ${name}" and password="${password}"');
  results.forEach((row) {
    print('name: ${row[0]},password: ${row[1]}');
    jsondata.add('${row[0]}');
    if(jsondata!=null) {
      print('ok');
    }
    else {
      print('error');

    }
  });
}
