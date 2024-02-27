#include "anotherclass.h"
#include "myclass.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine qEngine;

    MyClass *myClassPtr = new MyClass();
    AnotherClass *anotherClassPtr = new AnotherClass();

    //QGuiApplication::connect(myClassPtr, &MyClass::<signalName>, anotherClassPtr, &AnotherClass::<slotName>);
    qEngine.setInitialProperties({{"myClass", QVariant::fromValue(myClassPtr)},
                                  {"anotherClass", QVariant::fromValue(anotherClassPtr)}});

    QQmlApplicationEngine engine;
    engine.setInitialProperties({
        {"_myClass", QVariant::fromValue(myClassPtr)},
        {"_anotherClassPtr", QVariant::fromValue(anotherClassPtr)}
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
