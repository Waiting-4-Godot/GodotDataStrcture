#ifndef TEST_H
#define TEST_H

#include <godot_cpp/classes/control.hpp>


using namespace godot;

class test : public Control {
    GDCLASS(test, Control)

protected:
    static void _bind_methods();

public:
    test();
    ~test();
};

#endif