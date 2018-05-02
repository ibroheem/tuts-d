
import std.concurrency;

template concurrency_()
{
   static void test1()
   {
   }
}

alias concurrency = concurrency_!();

void run()
{

}
