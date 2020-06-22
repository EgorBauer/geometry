#include "../src/Pars.hpp"
#include "gtest/gtest.h"
#include <limits.h>
int i = 0;
namespace {
TEST(partStrTest, Circle)
{
    i = 0;
    ASSERT_EQ("circle", partStr("circle(1 4, 5)"));
    i = 0;
    EXPECT_EQ("circle", partStr("circle(6 3, 2)"));
    i = 0;
}
TEST(partStrTest, NotCircle)
{
    i = 0;
    EXPECT_NE("circle", partStr("dfsgs(1 4, 5)"));
    i = 0;
    EXPECT_NE("circle", partStr("Circle(6 3, 2)"));
    i = 0;
    EXPECT_NE("circle", partStr(""));
    i = 0;
}

TEST(partStr2Test, IsNumber)
{
    i = 0;
    partStr("circle(1 4, 5)");
    i++;
    EXPECT_EQ(1, partStr2("circle(1 4, 5)"));
    EXPECT_EQ(4, partStr2("circle(1 4, 5)"));
    EXPECT_EQ(5, partStr2("circle(1 4, 5)"));
    i = 0;
}
}
