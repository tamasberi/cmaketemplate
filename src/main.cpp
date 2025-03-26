#include <iostream>

#include "library.h"

int main(int /*argc*/, char** /*argv*/)
{
   Library library;
   if(library.doSomething("Hans"))
   {
      std::cout << "Ja!" << std::endl;
   }
   if(!library.doSomething(""))
   {
      std::cout << "Nein!" << std::endl;
   }
   return 0;
}
