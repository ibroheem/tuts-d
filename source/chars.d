
interface chars
{
   static void ex()
   {
      char  utf_8  = 'a';
      wchar utf_16 = 'ğ';
      dchar utf_32ğ = 'ğ';
   }

   /// Problem reading chars
   static void ex1()
   {
      import std.stdio : readf;

      char c;
      readf("%s", c); /// Reads nothing when sth like 'ğ' is entered

      char d, e;
      readf("%s", d);
      readf("%s", e);
   }

   static void main()
   {
      ex();
   }
}

void run()
{
   chars.main();
}
