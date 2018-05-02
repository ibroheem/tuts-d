module fs;

import std.stdio : File, writefln, writef, writeln, lines;
import std.file, std.path;
import std.getopt;

/// Emulating Namespace
template fs_()
{
   string to_relative(Param : string)(Param _path)
   {
      return baseName(dirName(_path));
   }
}

alias fs = fs_!();

void usage(ubyte opt)
{
   switch (opt)
   {
      case 1:
      {
         auto dirs = dirEntries("/opt/usr", SpanMode.shallow);
         foreach (string fname;dirs)
         {
            writef("%s\n", fs.to_relative(fname));
            //writeln(baseName(fname));
            //writeln(baseName(dirName(fname)));
         }
      } break;

      case 2:
      {

      } break;

      default:
      break;
   }
}

void exec()
{
   usage(1);
}
