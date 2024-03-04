// Person.cpp
#include "Person.h"

Person::Person(const QString& name, int age, QObject* parent) : m_name(name), m_age(age), QObject(parent) {}

QString Person::name() const {
    return m_name;
}

void Person::setName(const QString& name) {
    if (m_name != name) {
        m_name = name;
        emit nameChanged();
    }
}

int Person::age() const {
    return m_age;
}

void Person::setAge(int age) {
    if (m_age != age) {
        m_age = age;
        emit ageChanged();
    }
}
