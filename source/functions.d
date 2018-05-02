import std.stdio;

void foo(double function() func)
{
   // ...
}

void test1()
{
   foo(function double() { return 42.42; });
}

int abc(int i, int delegate(int i) fn)
{
   writeln("i: ", i);
   return 12;
}

void test2()
{
   int b = 3;
   int fn(int c) { return 6 + b; }

   abc(b, &fn);
   abc(b, (int c) { return 6 + b; });
}

void run()
{
   //test1();
   test2();
}
