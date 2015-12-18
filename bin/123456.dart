class Person {
  Person.fromJson(Map data) {/* .fromJosn(Map data):named construvtor*/
print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data): super.fromJson(data)
  {
    print('in Employee');
  }
 // Employee() : super.fromJson(findDefaultData());

}
class Point {
  num _x;
  num y;
}

/*main() {
  //var emp = new Employee.fromJson({});
var point=new Point();
  point._x=5;
assert(point._x == 5); // Use the getter method for x.
assert(point.y == null); // Values default to null.
  // Prints:
  // in Person
  // in Employee
}*/
class Rectangle {
  num left;
  num top;
  num width;
  num height;
Rectangle.fromJson(Map data){print('look');}

  /*Rectangle(this.left, this.top, this.width, this.height);
  // Define two calculated properties: right and bottom.
  num get right             => left + width;
  set right(num value)  => left = value - width;
  num get bottom            => top + height;
  set bottom(num value) => top = value - height;*/
}
class squre extends Rectangle{
  squre.fromJson(Map data): super.fromJson(data) {print('test&test');}
}
main() {
  /*var rect = new Rectangle(3, 4, 20, 15);

  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
 print(rect.left);*/
 var rect =new Rectangle();
}