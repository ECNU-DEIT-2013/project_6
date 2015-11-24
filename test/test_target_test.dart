import "dart:async";
import "package:test/test.dart";
import '../bin/test.dart';
Num n1=new Num();

void main(){
  test("test", ()  {
    expect(  n1.add(n1.a,n1.b), equals(3));
  });
}