// name   : kaito_tateyama (uta8a)
// tag    : "tag"
// comment: ""

#include <catch2/catch.hpp>
#include <../char_integer/main.hpp>
#include <bits/stdc++.h>

TEST_CASE( "Integer2Char" ) {
    REQUIRE(integer2char(97) == 'a');
}

TEST_CASE( "Char2Integer" ) {
    REQUIRE(char2integer('a') == 97);
}

TEST_CASE( "Char2IntegerConcat" ) {
    REQUIRE( integer2char(char2integer('a')) == 'a' );
}
