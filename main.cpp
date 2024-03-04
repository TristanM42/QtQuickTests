#include "anotherclass.h"
#include "myclass.h"
#include "Person.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Pass an array to QML
    qmlRegisterType<Person>("QtQuickTests", 1, 0, "Person");
    QVariantList personList;
    personList << QVariant::fromValue(new Person("Alice", 30))
               << QVariant::fromValue(new Person("Bob", 25))
               << QVariant::fromValue(new Person("Charlie", 22));
    //engine.rootContext()->setContextProperty("_personList", personList); // not necessary if using setInitialProperties


    qmlRegisterType<MyClass>("QtQuickTests", 1, 0, "MyClass");
    qmlRegisterType<AnotherClass>("QtQuickTests", 1, 0, "AnotherClass");
    MyClass *myClassPtr = new MyClass();
    AnotherClass *anotherClassPtr = new AnotherClass();

    myClassPtr->intDebug = 42;
    anotherClassPtr->intDebug = 123;

    engine.setInitialProperties({
        {"_myClass", QVariant::fromValue(myClassPtr)},
        {"_anotherClass", QVariant::fromValue(anotherClassPtr)},
        {"_personList", QVariant::fromValue(personList)},
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
