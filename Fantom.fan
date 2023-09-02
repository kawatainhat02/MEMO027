// Hello from Fantom!

class HelloWorld
{
  static Void main()
  {
    echo("Hello, World!")
  }
}


true                // Bool literal
123                 // Int literal
0xcafe_babe         // Int hex, can use _ as separator
'\n'                // Int character literal
"hi"                // Str literal
3.4f                // Float literal
3.4d                // Decimal literal
5sec                // Duration literal
`/dir/file.txt`     // Uri literal
[0, 1, 2]           // List literal
[,]                 // List literal for empty list
[1:"one", 2:"two"]  // Map literal
[:]                 // Map literal for empty map
Int#                // Type literal
Int#plus            // Slot literal

obj.toStr()   // call the toStr method
obj.toStr     // parenthesis are optional
obj.field     // access field
x && y        // logical and
x === y       // reference equality
x == y        // shortcut for x.equals(y)
x < y         // shortcut for x.compare(y) < 0
x <=> y       // shortcut for x.compare(y)
x + y         // shortcut for x.plus(y)
x = y         // assignment
a ? b : c     // ternary operator
a is Str      // instance of operator
a isnot Str   // convenience for !(a is Str)
a as Str      // like C# as operator
a?.func()     // safe invoke operator (like Groovy)
a ?: b        // elvis operator for a != null ? a : b

// string interpolation
"$x + $y = ${x+y}"

3 + 4  =>  3.plus(4)



// longhand for above
x.toStr + " + " + y.toStr + " = " + (x+y).toStr

// lookup a locale props value
"$<fwt::err.name>"

// add locale lookup and automatically add default
// key/value to the pod's locale/en.props resource file
"$<fileNotFound=The file was not found>"


Str s := "hello"    // local variable declaration
s := "hello"        // type inference
if (x) {} else {}   // if/else statement
while (x) {}        // while

class Person
{
  Str name
  Int age
}

public class Person
{
  public String name() { return name; }
  public void name(String x) { name = x; }

  public int age() { return age; }
  public void age(int x) { age = x; }

  private String name;
  private int age;
}

class Person
{
  Str name
  Int age { set { checkAge(val); &age = it } }
}


class Person
{
  Int yearsToRetirement(Int retire := 65) { return retire - age }

  Int age
}

class Point
{
  new make(Int x, Int y) { this.x = x; this.y = y; }
  Int x
  Int y
}

// make a point
pt := Point.make(30, 40)   // longhand
pt := Point(30, 40)        // shorthand

class Animal
{
  virtual Void talk() { echo("talk") }
}

class Dog : Animal
{
  override Void talk() { echo("bark") }
}

mixin Audio
{
  abstract Int volume
  Void incrementVolume() { volume += 1 }
  Void decrementVolume() { volume -= 1 }
}

class Television : Audio
{
  override Int volume := 0
}

interface Audio
{
  int volume();
  void volume(int volume);
  void incrementVolume();
  void decrementVolume();
}

class AudioImpl
{
  static void incrementVolume(Audio self) { self.volume(self.volume() + 1); }
  static void decrementVolume(Audio self) { self.volume(self.volume() - 1); }
}

class Television implements Audio
{
  int volume() { return volume; }
  void volume(int x) { volume = x; }

  void incrementVolume() { AudioImpl.incrementVolume(this); }
  void decrementVolume() { AudioImpl.incrementVolume(this); }

  private int volume = 0;
}

// print a list of strings
list := ["red", "yellow", "orange"]
list.each |Str color| { echo(color) }

// print 0 to 9
10.times |Int i| { echo(i) }

10.times |i| { echo(i) }

10.times { echo(it) }

// sort a list of files by timestamp
files = files.sort |a, b| { a.modified <=> b.modified }

// create a function that adds two integers
add := |Int a, Int b->Int| { return a + b }
nine := add(4, 5)

obj->foo         // obj.trap("foo", [,])
obj->foo(2, 3)   // obj.trap("foo", [2, 3])
obj->foo = 7     // obj.trap("foo", [7])

Obj obj
Str s := obj->foo     // Str s := (Str)obj->foo
Int.fromStr(obj)      // Int.fromStr((Str)obj)

Str   // never stores null
Str?  // might store null

@Serializable class Person
{
  Str? name
  Int age
  Person[]? children
}

// built up tree of objects in code (or from file)
homer := Person
{
  name = "Homer Simpson"
  age  = 39
  children =
  [
    Person { name = "Bart";   age = 7 },
    Person { name = "Lisa";   age = 5 },
    Person { name = "Maggie"; age = 1 }
  ]
}

// dump serialized structure to console
Env.cur.out.writeObj(homer, ["indent":2])

const class Point
{
  new make(Int x, Int y) { this.x = x; this.y = y }
  const Int x
  const Int y
}

const static Point origin := Point(0, 0)

vowels := ['a','e','i','o','u'].toImmutable

// spawn actor which aynchronously increments an Int msg
actor := Actor(group) |Int msg->Int| { msg + 1 }

// send some messages to the actor and block for result
for (i:=0; i<5; ++i) echo(actor.send(i).get)


