#include "test.h"

#include <godot_cpp/variant/utility_functions.hpp>

void test::_bind_methods() {}

test::test() { UtilityFunctions::print("hello world"); }

test::~test() {
    UtilityFunctions::print("goodbye world");
}
