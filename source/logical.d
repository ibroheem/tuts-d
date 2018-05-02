
import std.stdio;

interface logical
{
   static void test1()
   {
      int x = 15;
      writef("x is 15: ", (10 < x) < 20); /// => true < 20; Compiles, but wrong
   }

   static void logical()
   {
      writef("2 == 2: %s\n", 2 == 2);

      bool b;
      readf(" %s", b);
      writef("b: %s", b);
   }
}

void run()
{
   logical.logical();
}
