// name   : kaito_tateyama (uta8a)
// tag    : "tag"
// comment: ""

#include <catch2/catch.hpp>
#include <../mod_factorial/main.hpp>
#include <bits/stdc++.h>

TEST_CASE( "Mod Factorial" ) {
    REQUIRE(mod_factorial(0, 100) == 1);
    REQUIRE(mod_factorial(10, 17) == 14); // python3 math.factorial(10)%17
    REQUIRE(mod_factorial(100, 10007) == 1281);
}
