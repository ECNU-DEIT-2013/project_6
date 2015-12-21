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
List my_stu=[];
List club_send=[];
List clubuser=[];
var  name_check;
var register_check;
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
      await register();
      print("index page");
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.response.write(JSON.encode(name_check));
      request.response.close();
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
      await email();
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
    else if (request.uri.path == "/studentpage") {
      await studentpage();
      print("studentpage page");
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.response.write(JSON.encode(my_stu));
      request.response.close();
      print("hello");
      print(my_email);
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

    else if(request.uri.path == "/clubsendstu"){//根据客户端的查询要求，从数据库选择相应数据并传回客户端
      if (jsondata!="") {
        await clubsql();
        await request.response
          ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
        await request.response.write(JSON.encode(clubuser));
        request.response.close();
        print(clubuser);
        clubuser=[];
      }
    }
    else if(request.uri.path == "/clubsendsql"){//将发送的通知写入数据库
      var sqllist = JSON.decode(jsondata);
      var i;
      print(sqllist);
      var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
      for (i=0;i<sqllist.length;i++){
        await pool.query(sqllist[i].toString());}


    }
    else if(request.uri.path == "/contact"){//将发送的建议写入数据库
      var advice = JSON.decode(jsondata);
      print(advice);
      var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
      var query = await pool.prepare('insert into contact(advice) values (?)');
     await query.execute(['${advice}']);
    }
    else {
      print("error!");
      /**
       * 这行本来在括号下面，逻辑有问题。导致你还没有发送有效的地址请求，服务器就到了最后直接关闭了response。
       */
      request.response.close();
    }

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
  print("hello");
  var s = JSON.decode(jsondata);
  var name = s[0];
  var password = s[1];
  print(name);
  print(password);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var string = 'select * from login where name = "${name}" ';
  var results = await pool.query(string);
  await results.forEach((row) {
    print('name: ${row[0]}');
    register_check='${row[0]}';
  });
  if(register_check==null){
    var query = await pool.prepare('insert into login (password, name) values (?, ?)');
    await query.execute(['${password}', '${name}']);
    print("insert");
    name_check="true";
  }
  else{
    print("已注册");
    name_check="";
  }
  print(name_check);
  print(register_check);
  register_check=null;
  print(register_check);

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

email() async{
  var name = JSON.decode(jsondata);
  print("begin connect");
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query('select club_name,user_name,message from user_message where user_name= "${name}" ');
  await results.forEach((row) {
    print('club: ${row[0]},user: ${row[2]}');
    my_email.add('${row[0]}');
    my_email.add('${row[2]}');
  });
  print (my_email);
  print("connect");
}


studentpage() async{
  var name = JSON.decode(jsondata);
  print("begin connect");
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340210');
  var results = await pool.query('select club_name,user_name,message from user_message where user_name= "${name}" ');
  await results.forEach((row) {
    print('club: ${row[0]},inf: ${row[2]}');
    my_stu.add('${row[0]}');
    my_stu.add('${row[2]}');
  });
  print (my_stu);
  print("connect");
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