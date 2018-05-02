
import std.algorithm : remove;
import std.stdio : write, writeln, writefln;

import include.d.algorithm;

interface arr
{
   static void fn(ref int[3] arr)
   {
      arr[0] = 90;
   }

   static void test1()
   {
      int[3] arr;
      fn(arr);

      writefln("value: %d\n", arr[0]);
   }

   static void ex1()
   {
      int[5] static_arr; // A.K.A fixed-length array
      for (int i = 0; i < static_arr.length; ++i)
         static_arr[i] = i * 3;

      static_arr.write('\n');

      int[] dyn_arr; // Empty Array
      dyn_arr.length = 3; // Size | Len Now 3, can now hold 3 elements

      /// Element Access, Write Only
      for (int i = 0; i < dyn_arr.length; ++i)
         dyn_arr[i] = i * 3;

      // dyn_arr.write;
      writefln("Dynamic Array: %s", dyn_arr);

      /// Element Access, Read Only
      for (int i = 0; i < dyn_arr.length; ++i)
         write(dyn_arr[i], ` `);
   }

   // Initialisation
   static void ex2()
   {
      int[] x; // Element default values are default value of corresponding type
      int[] y = [1, 3, 4];
      writefln("y: %s", y);

      y = [3,5,6];
      writefln("y: %s\n", y);

      //y = 2; // Error: cannot implicitly convert expression `2` of type `int` to `int[]`|

      int[2] a = [6, 7];
      writefln("a: %s", a);

      a = [2, 8];
      writefln("a: %s", a);

      a = 1;
      writefln("a: %s", a);
   }

   // Basic Operations: Removal and Appending
   static void ex3()
   {
      int[2] src = [3, 8];
      int[2] dest = src, d;
      d = src;

      src.write('\n');
      dest.write('\n');
      d.write("\n\n");

      int[] array = [ 10, 42, 20, 30, 42, 40 ];
      array = array.remove!(a => a == 42);    // Assigned back to array
      write(array, "\n\n");

      int[10] first = 1;
      int[10] second = 2;
      int[] result, res = first ~ second;

      result = first ~ second ;
      writeln(result.length);     // prints 20

      res = first ~ second ~ first;
      writeln(res.length);     // prints 30

      result ~= first;
      writeln(result.length, '\n');

      int[12] err;
      err = first ~ second;
      //err ~= first;
      err.write;
   }


   /*import std.algorithm;
   import std.traits;

   template sort_static(alias less = "a < b", SwapStrategy ss = SwapStrategy.unstable)
   {
       auto sort(Arr)(ref Arr arr) if (isStaticArray!Arr) {
           return std.algorithm.sort!(less, ss)(arr[]);
       }

       auto sort(Range)(Range r) if (!isStaticArray!Range) {
           return std.algorithm.sort!(less, ss)(r);
       }
   }*/

   // Basic Operations: Sorting, Reversal
   static void ex4()
   {
      import std.algorithm : reverse, sort;

      int[4] arr = [3,6,1,2];
      //sort_static(arr); // because dmd doesn't (yet?) allow overloading templates imported from other modules:
      //sort(arr[]);
      sort(arr[1..arr.length]);
      arr.writeln;

      int[] darr = [2,7,1,3];
      sort(darr);
      darr.writeln('\n');

      reverse(darr);
      darr.writeln;

      reverse(arr[]);
      arr.writeln;
   }

   static void main()
   {
      //test1();
      //ex1();
      //ex2();
      //ex3();
      ex4();
   }
}

interface slices
{
   import core.memory;

   static ex1()
   {
      int[] nums = [2,1,4,5,6,0];

      GC.Stats gc;
      writefln("GC.freeSize:\t%s\nGC.usedSize:\t%s", gc.freeSize, gc.usedSize);

      writeln("\n", nums);
      writeln("\n", nums);
   }

   static main()
   {
      ex1();
   }
}

void run()
{
   //arr.main();
   slices.main();
}
