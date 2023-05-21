#ifndef DATA_STRUCTURE_NODE_H
#define DATA_STRUCTURE_NODE_H

#include <godot_cpp/variant/variant.hpp>

using namespace godot;

/// @brief 单链表的节点
namespace linkedList  {
class Node{
public:
    Node();
    explicit Node(const Variant& element);
    Node(const Variant& element, Node* next);

    Variant element;
    Node* next;
};
}

#endif