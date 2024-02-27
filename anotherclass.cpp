#include "anotherclass.h"

AnotherClass::AnotherClass(QObject *parent)
    : QObject{parent}
{

}

QString AnotherClass::myMessage() const
{
    return m_myMessage;
}

void AnotherClass::setMyMessage(QString myMessage)
{
    myMessage.append(" - data appended in AnotherClass::myCustomSignal1Function");
    emit myCustomSignal1(myMessage);
}
