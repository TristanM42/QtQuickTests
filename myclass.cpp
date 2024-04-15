#include "myclass.h"
//#include "anotherclass.h"

#include <windows.h>

using namespace std;

MyClass::MyClass(QObject *parent)
    : QObject{parent}
{
    QObject::connect(this, &MyClass::myCustomSignal1Temp, this, &MyClass::myCustomSignal1Slot);
}

void MyClass::myFunction(QString myMessage)
{
    myMessage.append(" - data appended in myFunction");
    emit mySignall(myMessage);
}

void MyClass::mySlot(QString myMessage)
{
    myMessage.append(" - data appended in myySlot");
    myMessage.append(" ; DEBUG m_intDebug = ");
    myMessage.append(QString::number(this->m_intDebug));
    Sleep(1000);
    qDebug() << myMessage;
    emit mySignall(myMessage);
}

void MyClass::myNotifySlot(QString myMessage)
{
    myMessage.append(" - data appended in myNotifySlot");
    emit mySignall(myMessage);
}

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
    emit myCustomSignal1Temp(newValue);
    emit myCustomSignal2(newValue);
}

void MyClass::myCustomSignal1Slot(QString myMessage)
{
    myMessage.append(" - data appended in myCustomSignal1Function");
    emit myCustomSignal1(myMessage);
}
