import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert' ;
import 'dart:async';


/*int count = 0;
String path=Directory.current.path+'\\bin\\notes.txt';//绝对路径
main() async {
  // One note per line.
  try {
    List<String> lines = new File('notes.txt').readAsLinesSync();
    count = lines.length;
  } on FileSystemException {
   // print('Could not open notes.txt.');
    print(count);
    return;
  }
}
void main() {
  new File('clubinfor.txt').readAsString().then((String contents) {
    print(contents);
  });
}

main() {
  final file = new File('clubinfor.txt');
  Stream<List<int>> inputStream = file.openRead();

  inputStream
  .transform(UTF8.decoder)       // Decode bytes to UTF8.
  .transform(new LineSplitter()) // Convert stream to individual lines.
  .listen((String line) {        // Process results.
    print('$line: ${line.length} bytes');
  },
  onDone: () { print('File is now closed.'); },
  onError: (e) { print(e.toString()); });
}*/

main() async {

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    addCorsHeaders(request.response);
    var jsondata = await request.transform(UTF8.decoder).join();
    await register(jsondata);
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
