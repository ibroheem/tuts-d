module main;

import std.stdio;
import core.cpuid;

import types;
import cpuid;
import io;
import arrays;
import templates/*, logical, arithm_operations*/;
//import vibe.d;
import functions;
import cli;
import fs;
import xml;
/**
Keyword:
abstract , alias , align , asm , assert , auto ,
body , bool , break , byte , case , cast , catch , cdouble , cent , cfloat , char , class ,
const , continue , creal , dchar , debug , default , delegate , delete , deprecated ,
do , double , else , enum , export , extern , false , final , finally , float , for ,
foreach , foreach_reverse , function , goto , idouble , if , ifloat , immutable ,
import , in , inout , int , interface , invariant , ireal , is , lazy , long , macro ,
mixin , module , new , nothrow , null , out , override , package , pragma , private ,
protected , public , pure , real , ref , return , scope , shared , short , static ,
struct , super , switch , synchronized , template , this , throw , true , try ,
typedef , typeid , typeof , ubyte , ucent , uint , ulong , union , unittest , ushort ,
version , void , volatile , wchar , while , with , __FILE__ , __FILE_FULL_PATH__ ,
__MODULE__ , __LINE__ , __FUNCTION__ , __PRETTY_FUNCTION__ , __gshared ,
__traits , __vector , and __parameters .
*/

class time_t
{
      //
}

int opComp(time_t)
{
   return 0;
}

void test1()
{
   string data = `{"name": "asdf", "level": 42}`;
   writefln("Hello World %s \n", 0.09);
   writefln(data);
}

int main(string[] args)
{
   import std.algorithm;
   try
   {
      //types.run();
      //cpuid.run();
      //io.run();
      //templates.run();
      //arrays.run();
      //logical.run();
      //arithm_operations.run();
      //int[] t = [3,5,1,2];
      //writefln("Test: %s", remove(t, a => a == 1));
      //functions.run();
      //cli.exec(args);
      //fs.exec();
      xml.exec();
   }
   catch (Exception e)
   {
      writeln(e.msg);
   }
   return 0;
}
