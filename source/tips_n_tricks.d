import std.file, std.path, std.stdio;

/// Emulating Namespace
template fs_()
{
   string to_relative(Param : string)(Param _path)
   {
      return baseName(dirName(_path));
   }
}

alias fs = fs_!();

void usage(byte opt)
{
   string s = "/tmp";
   writeln(fs.to_relative(s));
}

void exec()
{
   usage(1);
}
