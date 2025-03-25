#pragma once

class ILibrary
{
public:
	virtual ~ILibrary() = default;
	virtual bool doSomething() = 0;
};
