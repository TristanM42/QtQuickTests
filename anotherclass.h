#ifndef ANOTHERCLASS_H
#define ANOTHERCLASS_H

#include <QObject>
#include <QtQml>

class AnotherClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString myMessage READ myMessage WRITE setMyMessage NOTIFY myCustomSignal1Temp);
public:
    explicit AnotherClass(QObject *parent = nullptr);
    QString myMessage() const;
    void setMyMessage(QString newValue);
    int intDebug;

public slots:
    void mySlot(QString myMessage);

signals:
    void myCustomSignal1(QString newValue);
    void myCustomSignal1Temp(QString newValue);

private:
    QString m_myMessage;
};

#endif // ANOTHERCLASS_H
