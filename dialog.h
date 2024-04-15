#ifndef DIALOG_H
#define DIALOG_H

#include <QObject>
#include <QtQml>

class Dialog : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Dialog(QObject *parent = nullptr);
    virtual ~Dialog();

private:
};

#endif // DIALOG_H
