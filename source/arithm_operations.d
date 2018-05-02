import std.stdio;

interface arithm_operations
{
   static void test1()
   {
      int x = 2 ^^ 3; // 2 raise to power 3
      writefln("2 ^^ 3: %s", x);
   }

   // Overflow and Truncation
   static void test2()
   {
      // OVerflow
      immutable N = 254;
      ubyte u = N;
      int t = 0;

      for (int i = 0; i < 9; ++i)
      {
         t = u + i;
         u += i;
         if (t > 255)
            writef("%s \t->\t%s\n", u, t);
         else
            writef("%s\n", u);
         u = N;
      }
   }
}

void run()
{
   //arithm_operations.test1();
   arithm_operations.test2();
}
