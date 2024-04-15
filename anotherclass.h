#ifndef ANOTHERCLASS_H
#define ANOTHERCLASS_H

#include <QObject>
#include <QtQml>

class AnotherClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString myMessage READ myMessage WRITE setMyMessage NOTIFY myCustomSignal1Temp);
    Q_PROPERTY(int intDebug READ intDebug WRITE setIntDebug  NOTIFY intDebugChanged);
public:
    explicit AnotherClass(QObject *parent = nullptr);
    QString myMessage() const;
    void setMyMessage(QString newValue);
    int intDebug() const { return m_intDebug; }
    void setIntDebug(int value) {
        if (value != m_intDebug) {
            m_intDebug = value;
            emit intDebugChanged();
        }
    }

public slots:
    void mySlot(QString myMessage);

signals:
    void myCustomSignal1(QString newValue);
    void myCustomSignal1Temp(QString newValue);
    void intDebugChanged();

private:
    QString m_myMessage;
    int m_intDebug;
};

#endif // ANOTHERCLASS_H
