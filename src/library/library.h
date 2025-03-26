#pragma once

#include "ilibrary.h"

class Library : public ILibrary
{
public:
   bool doSomething(const std::string& somePar) override;
};
