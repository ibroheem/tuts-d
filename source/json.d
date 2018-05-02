import std.json;
import std.stdio;

interface json
{
   static void test1()
   {
      JSONValue v = parseJSON("{}");
      writeln(v);
   }

   static void main()
   {
      test1();
   }
}

void run()
{
   json.main();
}