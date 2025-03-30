#pragma once

//! \file ilibrary.h
//! \brief The header file for the ILibrary class.

#include <string>

//! \brief The abstract ILibrary interface class.
class ILibrary
{
public:
   //! \brief Destructor, intentionally left unimplemented.
   virtual ~ILibrary() = default;
   //! \brief A dummy function does nothing.
   //! \param somePar A string parameter.
   //! \return The return value,
   virtual bool doSomething(const std::string& somePar) = 0;
};
