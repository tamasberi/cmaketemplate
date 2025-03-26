#pragma once

#include <string>

class ILibrary
{
public:
   virtual ~ILibrary() = default;
   virtual bool doSomething(const std::string& somePar) = 0;
};
