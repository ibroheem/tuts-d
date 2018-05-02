module cli;

import std.getopt;
import std.stdio;
import std.file, std.path;

void test1(string[] args)
{
   int length;
   string dirname;

   enum color  { no, yes }
   enum colors { blue, red, green, black, white }
   enum pdu : ubyte { bind = 0x21 }

   auto fn = () { writeln("Closure"); };

   auto help = getopt(
                  args,
                  "length", &length,
                  //"pdu::bind", pdu.bind,
                  "closure", "Run a closure", fn,
                  "dirname", "Source directory name", &dirname
               );

   writef("length: %s\ndirname: %s\npdu::bind: %#x\n", length, dirname, cast(ubyte)pdu.bind);

   if (help.helpWanted)
   {
      defaultGetoptPrinter("Some information about the program.", help.options);
   }
}

struct data_t
{
   string dir_src /* Dir to read log files from*/, dir_dest /*Directory to save log files to*/,
          file_out /* Output File name */;
   bool generate_out_file;
   int  threads = 1;
}

void print_dirs(T)(T args)
{
   auto dirs = dirEntries(args.dir_src, SpanMode.shallow);
   foreach (string dir ; dirs)
   {
      writeln(dir);
   }
}

void test2(string[] args)
{
   data_t data;
   GetoptResult cli;

   auto run = ()
   {
      writef("\nthreads: %s\ndir_src: %s\ndir_dest: %s\n",
             data.threads, data.dir_src, data.dir_dest);
   };

   void myHandler(string option)
   {
      if (option == "quiet")
      {
      }
      else
      {
      }
   }

   try
   {
      cli = getopt(
               args,
               "o", "Name of output file", &data.file_out,
               "dir_src", "Source directory name", &data.dir_src,
               "dir_dest", "Destination directory name", &data.dir_dest,
               "threads", "Number of worker threads", &data.threads,
            );

      if (cli.helpWanted)
      {
         defaultGetoptPrinter("Some information about the program.", cli.options);
      }
      //run();
      print_dirs!(data_t)(data);
   }
   catch(GetOptException e)
   {
      writef("Error: %s\n", e.msg);
   }
}

void exec(string[] args)
{
   try
   {
      //test1(args);
      test2(args);
   }
   catch(GetOptException e)
   {
      writef("Exception: %s\n", e.msg);
   }
   catch(Exception e)
   {
      writef("Exception1: %s\n", e.msg);
   }
}
