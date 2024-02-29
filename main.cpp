#include "anotherclass.h"
#include "myclass.h"
#include "worker.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    MyClass *myClassPtr = new MyClass();
    AnotherClass *anotherClassPtr = new AnotherClass();

    myClassPtr->intDebug = 42;
    anotherClassPtr->intDebug = 123;

    QQmlApplicationEngine engine;
    engine.setInitialProperties({
        {"_myClass", QVariant::fromValue(myClassPtr)},
        {"_anotherClass", QVariant::fromValue(anotherClassPtr)}
    });


    // Testing thread - Creation of a thread with a QThread and a worker
    QThread *qthread = new QThread();
    QThread *mqthread = new QThread();
    Worker *mainworker = new Worker();
    Worker *otherworker = new Worker();

    mqthread->setObjectName("Main Worker Thread");
    qthread->setObjectName("Other Worker Thread");
    mainworker->setObjectName("Main Worker");
    otherworker->setObjectName("Other Worker");

    //Move worker to the thread
    otherworker->moveToThread(qthread);
    mainworker->moveToThread(mqthread);
    mainworker->setMainworker(true);

    //When threads start, workers' slots are executed
    QObject::connect(qthread, &QThread::started, otherworker, &Worker::process);
    QObject::connect(mqthread, &QThread::started, mainworker, &Worker::process);
    QObject::connect(mainworker, &Worker::finished, mqthread, &QThread::quit);
    QObject::connect(otherworker, &Worker::finished, qthread, &QThread::quit);

    //Connections between the two objects
    QObject::connect(mainworker, &Worker::generated, otherworker, &Worker::showValue);
    QObject::connect(mainworker, &Worker::finished, otherworker, &Worker::quit);

    qthread->start();
    mqthread->start();
    mqthread->wait(5000);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickTests", "Main");

    return app.exec();
}
