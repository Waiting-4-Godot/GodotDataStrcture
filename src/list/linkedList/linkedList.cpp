#include "linkedList.h"

#include <godot_cpp/core/class_db.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

void LinkedList::_bind_methods() {
    ClassDB::bind_method(D_METHOD("set_listSize", "listSize"), &LinkedList::set_listSize);
    ClassDB::bind_method(D_METHOD("get_listSize"), &LinkedList::get_listSize);
    ClassDB::bind_method(D_METHOD("isEmpty"), &LinkedList::isEmpty);
    ClassDB::bind_method(D_METHOD("insert", "theIndex", "element"), &LinkedList::insert);
    ClassDB::bind_method(D_METHOD("get_element", "theIndex"), &LinkedList::get_element);
    ClassDB::bind_method(D_METHOD("get_next", "theIndex"), &LinkedList::get_next);

    ClassDB::add_property("LinkedList",
        PropertyInfo(Variant::INT, "listSize"),
        "set_listSize",
        "get_listSize"
    );
}

LinkedList::LinkedList() { 
    UtilityFunctions::print("hello LinkedList"); 
    listSize = 0;
    theFirstNode = nullptr;
}

LinkedList::~LinkedList() {
    UtilityFunctions::print("goodbye LinkedList");
}

bool LinkedList::isEmpty() const { 
    return listSize == 0; 
}

int LinkedList::size() const { 
    return listSize;
}

/// @brief 向指定索引的节点后面插入一个节点
/// @param theIndex 要在哪一个节点后面插入
/// @param element 所插入的节点的 element 域的值
void LinkedList::insert(int theIndex, const Variant& element) {
    checkIndex(theIndex);

    if (theIndex == 0) {
        theFirstNode = new linkedList::Node(element, theFirstNode);
    } else {
        linkedList::Node* preNode = theFirstNode;

        for (int i = 1; i < theIndex; ++i) {
            preNode = preNode->next;
        }
        preNode->next = new linkedList::Node(element, preNode->next);
    }

    listSize++;
}

/// @brief 返回指定索引处的节点的值
/// @param theIndex 指定的索引
/// @return 节点中的值
Variant LinkedList::get_element(int theIndex) const { 
    checkIndex(theIndex);
   
    linkedList::Node* targetNode = theFirstNode;
    for (int i = 0; i < theIndex; ++i) {
        targetNode = targetNode->next;
    }

    return targetNode->element;
}

/// @brief 返回指定索引的节点的next
/// @param theIndex 指定索引
/// @return next域
String LinkedList::get_next(int theIndex) const { 
    checkIndex(theIndex);
   
    linkedList::Node* targetNode = theFirstNode;
    for (int i = 0; i < theIndex; ++i) {
        targetNode = targetNode->next;
    }

    String next = String((const char*)targetNode->next);
    UtilityFunctions::print(next);
    return next;
}

void LinkedList::set_listSize(const int listSize) {
    this->listSize = listSize;
}

int LinkedList::get_listSize() const { 
    return listSize; 
}

void LinkedList::checkIndex(int theIndex) const {
    if (theIndex < 0 || theIndex > listSize) {
        UtilityFunctions::print("illegal index");
        throw("illegal index");
    }
}
