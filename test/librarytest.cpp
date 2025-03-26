#include <gtest/gtest.h>

#include "library.h"

TEST(LibraryTest, LibraryTest_doSomething_not_empty)
{
   Library library;
   ASSERT_TRUE(library.doSomething("Hans"));
}

TEST(LibraryTest, LibraryTest_doSomething_empty)
{
   Library library;
   ASSERT_FALSE(library.doSomething(""));
}

GTEST_API_ int main(int argc, char **argv)
{
   testing::InitGoogleTest(&argc, argv);
   const int result = RUN_ALL_TESTS();
   return result;
}
