// Person.h
#pragma once
#include <QObject>

class Person : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)

public:
    explicit Person(const QString& name = "Name undefined", int age = 0, QObject *parent = nullptr);

    QString name() const;
    void setName(const QString& name);

    int age() const;
    void setAge(int age);

signals:
    void nameChanged();
    void ageChanged();

private:
    QString m_name;
    int m_age;
};
