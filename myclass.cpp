#include "myclass.h"

#include <windows.h>

using namespace std;

MyClass::MyClass(QObject *parent)
    : QObject{parent}
{
    // QObject::connect(this, &MyClass::myNotifySignal, this, &MyClass::myNotifySlot);
}

void MyClass::myFunction(QString myMessage)
{
    myMessage.append(" - data appended in myFunction");
    emit mySignall(myMessage);
}

void MyClass::mySlot(QString myMessage)
{
    myMessage.append(" - data appended in myySlot");
    Sleep(1000);
    emit mySignall(myMessage);
}

// void MyClass::myNotifySlot(QString myMessage)
// {
//     myMessage.append(" - data appended in myNotifySlot");
//     emit mySignall(myMessage);
// }

int MyClass::counter() const
{
    return m_counter;
}

QString MyClass::myMessage() const
{
    return m_myMessage;
}

void MyClass::setCounter(int newCounter)
{
    if (m_counter == newCounter)
        return;
    m_counter = newCounter;
    emit counterChanged();
}

void MyClass::setMyMessage(QString newValue) {
    newValue.append(" - data appended in setMyMessage");
    m_myMessage = newValue;
    emit mySignall(newValue);
    emit myCustomSignal1(newValue);
    emit myCustomSignal2(newValue);
}
