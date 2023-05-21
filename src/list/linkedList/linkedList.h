#ifndef LINKED_LIST_H
#define LINKED_LIST_H

#include "dataStructureNode.h"

#include <godot_cpp/classes/control.hpp>

using namespace godot;

class LinkedList : public Control {
    GDCLASS(LinkedList, Control)
protected:
	static void _bind_methods();

public:
    LinkedList();
    LinkedList(const LinkedList& theLinkedList);
    ~LinkedList();

    bool isEmpty() const;
    int size() const;
    void insert(int theIndex, const Variant& element);
    Variant get_element(int theIndex) const;

public:
    void set_listSize(const int listSize);
    int get_listSize() const;

private:
    /// @brief 链表的大小
    int listSize;
    /// @brief 链表中的第一个节点
    linkedList::Node* theFirstNode;

    void checkIndex(int theIndex) const;
};

#endif