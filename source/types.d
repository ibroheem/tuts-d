module types;
import std.stdio;

int global = 10;

private
{
   void fn()
   {
      writefln("global: %d", global);
   }

   void inference()
   {
      immutable val = 89;
      auto v = val + 90;
   }

   void reference()
   {
      void fn(int var)
      {
         var *= 10;
      }

      void fnref(ref int var)
      {
         var /= 2;
      }

      void strings()
      {
         /*string s = "test string";
         myfunc(s); // yep, this works
         s = s[2..4]; // this doesn't allocate
         myfunc(s);
         myfunc(s[3..6]); // or this, it doesn't allocate
         myfunc("abc"); // or this, doesn't allocate*/
      }

      void main()
      {
         int x = 90;

         fn(x);
         writef("x: %d\n", x);

         fnref(x);
         writef("x: %d\n", x);

      }

      main();
   }

   void type_properties(T)(T val)
   {
      writeln("Type : ", T.stringof);
      writeln("Length in bytes: ", T.sizeof);
      writeln("Minimum value : ",  T.min);
      writeln("Maximum value : ",  T.max);
      writeln("Initial value : ",  T.init);
   }
}

interface Foo
{
   static void type_properties(T)()
   {
      writeln("Type : ", T.stringof);
      writeln("Length in bytes: ", T.sizeof);
      writeln("Minimum value : ",  T.min);
      writeln("Maximum value : ",  T.max);
      writefln("Initial value : %d\n",  T.init);
   }

   static void main()
   {
      type_properties!int();
      type_properties!long();
      type_properties!ulong();
      writefln("Initial value of dchar : %X\n",  dchar.init);
      writeln("Type Name: ", size_t.stringof);
      //type_properties!float();
   }
}

void run()
{
   //properties();
   Foo.main();
   //reference();
}
