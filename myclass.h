#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QtQml>

class MyClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    //QML_UNCREATABLE("Singleton created in C++")
    QML_SINGLETON
    //Q_PROPERTY(QString myMessage MEMBER m_myMessage NOTIFY myNotifySignal);
    // Q_PROPERTY(QString myMessage MEMBER m_myMessage NOTIFY mySignal);
    Q_PROPERTY(QString myMessage READ myMessage WRITE setMyMessage NOTIFY mySignall);
    Q_PROPERTY(int counter READ counter WRITE setCounter NOTIFY counterChanged)

public:
    explicit MyClass(QObject *parent = nullptr);
    Q_INVOKABLE void myFunction(QString);
    int counter() const;
    void setCounter(int newCounter);
    QString myMessage() const;
    void setMyMessage(QString newValue);

public slots:
    void mySlot(QString myMessage);
    void myNotifySlot(QString myMessage);
    void myCustomSignal1Slot(QString myMessage);

signals:
    void mySignall(QString myMessage);
    void mySignal(QString myMessage);
    void myNotifySignal(QString myMessage);
    void counterChanged();
    void myCustomSignal1(QString newValue);
    void myCustomSignal1Temp(QString newValue);
    void myCustomSignal2(QString newValue);

private:
    QString m_myMessage;
    int m_counter;
};

#endif // MYCLASS_H
