#pragma once

//! \file library.h
//! \brief The header file for the Library class.

#include "ilibrary.h"

//! \brief An implementation of the ILibrary interface.
class Library : public ILibrary
{
public:
   bool doSomething(const std::string& somePar) override;
};
