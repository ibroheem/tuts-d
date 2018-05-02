import std.xml;
import std.stdio;
import std.string;
import std.file;

void test1()
{
   try
   {
      string s = cast(string) std.file.read("soap.xml");
      //writeln(s);

      check(s); /// Check for well formedness

      /// Make a DOM tree
      auto doc = new Document(s);

      /// Plain Print it
      writeln(doc);
   }
   catch(CheckException exp)
   {
      writef("CheckException: %s\n", exp.msg);
   }
   catch(XMLException exp)
   {
      writef("XMLException: %s\n", exp.msg);
   }
   catch(Exception exp)
   {
      writef("Exception: %s\n", exp.msg);
   }
}

struct Book
{
    string id;
    string author;
    string title;
    string genre;
    string price;
    string pubDate;
    string description;
}

void test2()
{
    string s = cast(string) std.file.read("books.xml");

    // Check for well-formedness
    check(s);

    // Take it apart
    Book[] books;

    auto xml = new DocumentParser(s);
    xml.onStartTag["book"] = (ElementParser xml)
    {
        Book book;
        book.id = xml.tag.attr["id"];

        xml.onEndTag["author"]       = (in Element e) { book.author      = e.text(); };
        xml.onEndTag["title"]        = (in Element e) { book.title       = e.text(); };
        xml.onEndTag["genre"]        = (in Element e) { book.genre       = e.text(); };
        xml.onEndTag["price"]        = (in Element e) { book.price       = e.text(); };
        xml.onEndTag["publish-date"] = (in Element e) { book.pubDate     = e.text(); };
        xml.onEndTag["description"]  = (in Element e) { book.description = e.text(); };

        xml.parse();

        books ~= book;
    };
    xml.parse();

    // Put it back together again;
    auto doc = new Document(new Tag("catalog"));
    foreach (book;books)
    {
        auto element = new Element("book");
        element.tag.attr["id"] = book.id;

        element ~= new Element("author",      book.author);
        element ~= new Element("title",       book.title);
        element ~= new Element("genre",       book.genre);
        element ~= new Element("price",       book.price);
        element ~= new Element("publish-date",book.pubDate);
        element ~= new Element("description", book.description);

        doc ~= element;
    }

    // Pretty-print it
    writefln(join(doc.pretty(3),"\n"));
}

void test3()
{
   string s = cast(string) std.file.read("soap.xml");
   //writeln(s);

   check(s); /// Check for well formedness

   /// Make a DOM tree
   auto xml = new DocumentParser(s);
   string str;

   xml.onStartTag["handleNewSubscriptionReturn"] = (ElementParser xml)
   {
      xml.onEndTag["amount"] = (in Element e)
      {
         str = e.text();
         writefln("amount: %s", str);
      };
      xml.parse();
   };
   xml.parse();
}

void exec()
{
   try
   {
      //test1();
      //test2();
      test3();
   }

   catch(CheckException exp)
   {
      writef("CheckException: %s\n", exp.msg);
   }

   catch(XMLException exp)
   {
      writef("XMLException: %s\n", exp.msg);
   }

   catch(Exception exp)
   {
      writef("Exception: %s\n", exp.msg);
   }
}

