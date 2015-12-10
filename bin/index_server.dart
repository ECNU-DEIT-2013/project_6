import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';
import 'package:rest_frame/rest_frame.dart';

Router routerindex = new Router();
Router routerstuform = new Router();
Router routercheck = new Router();
var jsondata;
//全局变量，用于接收客户端传来的数据。
List my_email=[];
var register_check;
var  name_check;
List club_send=[];
List clubuser=[];
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
      /**
          var s = JSON.decode(jsondata);
          var name=s[0];
          print (name);
          //register(jsondata);
          //save(jsondata);
          if (request.uri.path == "/index") {
          print("index page");
          var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
          var string = 'select * from login where name = "${name}" ';
          var results = await pool.query(string);
          await results.forEach((row) {
          print('name: ${row[0]}');
          register_check='${row[0]}';
          });
          if(register_check==null)
          {
          register();
          name_check="true";
          print(name_check);

          }
          else{
          name_check="false";
          print(name_check);
          }
          await request.response
          ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
          List list=[];
          list.add('${name_check}');
          print(list);
          request.response.write(JSON.encode(list));
          request.response.close();
          }
       */
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
    else if (request.uri.path == "/email") {
      await studentpage();
      print("email page");
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.response.write(JSON.encode(my_email));
      request.response.close();
      print("hello");
      print(my_email);
      //my_email=[];
      // routercheck.route(request);
    }

    else if(request.uri.path == "/clubsend"){
      await clubsend();
      print("clubsend page");
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.response.write(JSON.encode(club_send));
      request.response.close();
      print(club_send);
      club_send=[];}

    else if(request.uri.path == "/clubsendstu"){
      if (jsondata!="") {
        await clubsql();
        await request.response
          ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
        await request.response.write("[a.b]");
        request.response.close();
        print(clubuser);
        clubuser=[];
      }
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

studentpage() async{
  var name = JSON.decode(jsondata);
  print("begin connect");
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query('select club_name,club_inf,stu_name from club_inf where stu_name= "${name}" ');
  await results.forEach((row) {
    print('club: ${row[0]},inf: ${row[1]}');
    my_email.add('${row[0]}');
    my_email.add('${row[1]}');
  });
  print (my_email);
  print("connect");
  /** var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
      print("Serving at ${server.address}:${server.port}");
      await for (var request in server) {
      HttpResponse res = request.response;
      addCorsHeaders(res);
      res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(JSON.encode(jsondata))
      ..close();
      }*/

}
clubsend() async{

  print("begin connect");
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query('select distinct club_name from club_user');
  await results.forEach((row) {
    print('clubname: ${row[0]}');
    club_send.add('${row[0]}');
  });
  print (club_send);

}
clubsql() async{
  var sql = jsondata;
  print(sql);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query(sql);
  await results.forEach((row) {
    print('username: ${row[0]}');
    clubuser.add('${row[0]}');
  });

}