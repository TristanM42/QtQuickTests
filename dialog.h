#ifndef DIALOG_H
#define DIALOG_H

#include <QObject>
#include <QtQml>

class Dialog : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int debugVal READ debugVal WRITE setDebugVal  NOTIFY debugValChanged);
public:
    explicit Dialog(QObject *parent = nullptr);
    virtual ~Dialog();
    int debugVal() const { return m_debugVal; }
    void setDebugVal(int value) {
        if (value != m_debugVal) {
            m_debugVal = value;
            emit debugValChanged();
        }
    }


private:
    int m_debugVal = 0;

signals:
    void debugValChanged();
};

#endif // DIALOG_H
