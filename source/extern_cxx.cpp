#include <iostream>

template<class T>
struct Foo
{
    private:
    T field;

    public:
    Foo(T t) : field(t) {}
    T get();
    void set(T t);
};

template<class T>
T Foo<T>::get()
{
    return field;
}

template<class T>
void Foo<T>::set(T t)
{
    field = t;
}

Foo<int> makeIntFoo(int i)
{
    return Foo<int>(i);
}

Foo<char> makeCharFoo(char c)
{
    return Foo<char>(c);
}

template<class T>
void increment(Foo<T> &foo)
{
    foo.set(foo.get() + 1);
}

template<class T>
void printThreeNext(Foo<T> foo)
{
    for(size_t i = 0; i < 3; ++i)
    {
        std::cout << foo.get() << std::endl;
        increment(foo);
    }
}

// The following two functions ensure that the required instantiations of
// printThreeNext are provided by this code module
void printThreeNexti(Foo<int> foo)
{
    printThreeNext(foo);
}

void printThreeNextc(Foo<char> foo)
{
    printThreeNext(foo);
}
