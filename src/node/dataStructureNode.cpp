#include "dataStructureNode.h"

namespace linkedList {
Node::Node() {

}

Node::Node(const Variant& element) {
    this->element = element;
}

Node::Node(const Variant& element, Node* next) {
    this->element = element;
    this->next = next;
}
}