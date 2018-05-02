import std.stdio;

template func_()
{
   void func1(T) (T var)
   {
      writefln("var: %d\n", var);
   }

   T func2(T) (T var)
   {
      writeln("T version\n");
      return var;
   }

   /// Function specialisation
   T func2(T: int) (T var)
   {
      writeln("T:int version\n");
      return T();
   }

   T func2(T: char[]) (T var)
   {
      writeln("T:char[] version\n");
      return var;
   }

   T del(T) (T delegate(string ln) fn)
   {
      string data = "Loop";
      fn(data);
      T ret;
      return ret;
   }

   void exec()
   {
      func1!(int)(20);
      func2!(int)(20);
      func2("20");

      string s = "Hello";
      del!(bool)((s) { writeln(s); return true; });
   }
}

alias func = func_!();

alias uint8_t  = byte;
alias uint16_t = ushort;
alias uint32_t = uint;

template class_based_()
{
   struct buffer (T = ubyte, size_t SIZE)
   {
      public:
         //this() { }
         this(T[]) { }


         ref buffer append(const byte val)   { /*this += val; return this; */return memcpy_n_incr(val); }
         ref buffer append(const ushort val)  { return memcpy_n_incr(val); }
         ref buffer append(const uint val)  { return memcpy_n_incr(val); }

         void  opIndexAssign(T val, int i) { data[i] = val; offset += val.sizeof; }
         //void  opIndexAssign(ref T val, int i) { data[i] = val; }

         ref T opIndex(size_t i)  { return data[i]; }

         /// Returns Maximum size of the buffer
         size_t max_size() { return SIZE; }

         /// Returns the number of elements in the buffer
         size_t size()     { return offset; }

         /// Returns the number of elements in the buffer
         size_t length()   { return offset; }

         void append_values(T[] lst)
         {
            foreach (v;lst)
               memcpy_n_incr(v);
         }

         T[SIZE] data;
         size_t offset = 0;

      public:
         ref buffer memcpy_n_incr(T)(T val)
         {
            import core.stdc.string : memcpy;
            memcpy(&buffer[offset], &val, val.sizeof);
            offset += val.sizeof;
            return this;
         }
   };

   void use_buffer()
   {
      buffer!(ubyte, 5) buf;
      buf[0] = 50;
      buf.append(77);
      buf.append(cast(uint8_t)23);

      buf.append_values([7, 2]);

      for (int i = 0; i < buf.size(); ++i)
         writef("Value: %d\n", buf[i]);

      writefln("\nBuffer Element Count: %d", buf.size());
   }

   class ctmpl
   {
      this() { }

      void get() { }
   };

   void exex()
   {
      use_buffer();
   }
}

alias class_based = class_based_!();

template constraints_()
{
   template type_v(T)
   {
      alias T FixedSizeArray;
   }

   type_v fn(type_v)()
   {
      writeln(typeid(type_v));

      static if (is(type_v == bool))
         return false;
      else
         return ;
   }

   void exec()
   {
      fn!(void)();
      fn!(bool)();
   }
}

alias constraints = constraints_!();

void run()
{
   constraints.exec();
   //func.exec();
   //class_based.exex();
}
