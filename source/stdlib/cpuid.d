module cpuid;

import std.stdio : writefln;
import core.cpuid;

private
{
   void test1()
   {
      writefln("CPU Vendor:\t%s\n" ~
               "PRocessor:\t%s",
               cpuid.vendor(), cpuid.processor());

      writefln("\nCPU Cores:\t%d\n" ~
               "Cache Levels:\t%d\n"
               , coresPerCPU, cacheLevels);

      writefln("Support\n\t" ~
               "mmx:\t%d\n\tsse2:\t%d",
               cpuid.mmx, cpuid.sse2);

      CacheInfo cache_info;
      writefln("\nCache Info\n\tSize:\t%d\n\tLine Size:\t%d", cache_info.size, cache_info.lineSize);
   }
}

void run()
{
   test1();
}
