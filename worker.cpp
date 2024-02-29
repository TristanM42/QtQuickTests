#include "worker.h"

Worker::~Worker()
{
    qInfo() << this << "destroyed. Thread:" << QThread::currentThread();
}

Worker::Worker():
    m_mainworker(false),
    m_counter(0),
    m_results(QString())
{
    qInfo() << this << "created. Thread:" << QThread::currentThread();
}

void Worker::process()
{
    qInfo() << this << ": Process started" << QThread::currentThread();
    m_timer = new QTimer(this);
    qInfo() << m_timer->thread();
    connect(m_timer, &QTimer::timeout, this, &Worker::generate);

    if (m_mainworker) {
        qInfo() << this << ": Timer started" << QThread::currentThread();
        m_timer->setInterval(1000);
        m_timer->start();
    }
}

void Worker::generate()
{
    if (m_counter < 10) {
        m_counter ++;
        int value = 10 * m_counter;
        qInfo() << this << "generated" << value << QThread::currentThread();
        emit generated(value);
    } else {
        m_results = "Process done in separate thread: results passed from C++";
        quit();
    }
}

void Worker::quit()
{
    qInfo() << this << "finished process" << QThread::currentThread();
    m_timer->stop();
    delete m_timer;
    emit finished(m_results);
}

void Worker::showValue(int value)
{
    qInfo() << this << value << QThread::currentThread();
}

void Worker::setMainworker(bool newMainworker)
{
    m_mainworker = newMainworker;
}
