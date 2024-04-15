#include "anotherclass.h"
#include "myclass.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    MyClass *myClassPtr = new MyClass();
    AnotherClass *anotherClassPtr = new AnotherClass();

    myClassPtr->m_intDebug = 42;
    anotherClassPtr->setIntDebug(123);

    QQmlApplicationEngine engine;
    engine.setInitialProperties({
        {"_myClass", QVariant::fromValue(myClassPtr)},
        {"_anotherClass", QVariant::fromValue(anotherClassPtr)}
    });
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickTests", "Main");

    return app.exec();
}
