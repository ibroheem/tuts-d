module io;
import std.stdio;

interface io
{
   static void output()
   {
      write("Hello ", '\n');
      write("Hellos ", `\n\n`);

      writeln("\n\nHello");

      writef("\nwritef:\t\tHello%s", '\n');
      writefln("writefln:\tHello %s", `world`);

      writeln("I ate ", 5, " apples and ", 2, " burgers.\n");

   }

   static void input()
   {
      try
      {
         int x;
         readf("%s", x);
         writef("x: %d\n", x);

         readf("%s", x);
         writef("x: %d", x);
      }
      catch(Exception e)
      {
         writef("%s\n", e.msg);
      }
   }

   static void input2()
   {
      try
      {
         int x;
         readf("%s", x);
         writef("x: %d\n", x);

         readf("%s", x);
         writef("x: %d", x);
      }
      catch(Exception e)
      {
         writef("%s\n", e.msg);
      }
   }
}

void run()
{
   ///io.output();
   io.input();
}
