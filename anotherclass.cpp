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

void AnotherClass::mySlot(QString myMessage)
{
    myMessage.append(" - data appended in myySlot");
    myMessage.append(" ; DEBUG intDebug = ");
    myMessage.append(QString::number(this->intDebug));
    qDebug() << myMessage;
    emit myCustomSignal1(myMessage);
}
