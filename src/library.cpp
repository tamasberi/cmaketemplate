#include <iostream>

#include "library.h"

bool Library::doSomething(const std::string& somePar)
{
   if(!somePar.empty())
   {
      std::cout << "Hallo " << somePar << "!" << std::endl;
      return true;
   }
   else
   {
      std::cout << "Hallo Welt!" << std::endl;
      return false;
   }
}
