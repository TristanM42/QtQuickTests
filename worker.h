#ifndef WORKER_H
#define WORKER_H

#include <QObject>
#include <QThread>
#include <QDebug>
#include <QTimer>

class Worker : public QObject
{
    Q_OBJECT
    
public:
    Worker();
    ~Worker();
    void setMainworker(bool newMainworker);
    //bool mainworker() const;

public slots:
    void process();
    void generate();
    void showValue(int value);
    void quit();

signals:
    void finished(QString results);
    void error(QString err);
    void generated(int value);

private:
    QTimer *m_timer;
    bool m_mainworker;
    int m_counter;
    QString m_results;
};

#endif // WORKER_H
