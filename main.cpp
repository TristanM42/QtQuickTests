#include "anotherclass.h"
#include "myclass.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

static QObject* singletonTypeProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    MyClass *pMyClass = MyClass::instance();
    return pMyClass;
}

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    int typeId = qmlRegisterSingletonType<MyClass>("com.example", 1, 0, "MyClass", singletonTypeProvider);

    //MyClass *myClassPtr = new MyClass();
    //AnotherClass *anotherClassPtr = new AnotherClass();

    //myClassPtr->intDebug = 42;

    //QGuiApplication::connect(myClassPtr, &MyClass::<signalName>, anotherClassPtr, &AnotherClass::<slotName>);

    QQmlApplicationEngine engine;
    QJSValue instance = engine.singletonInstance<QJSValue>(typeId);
    // engine.setInitialProperties({
    //     {"_myClass", QVariant::fromValue(myClassPtr)},
    //     {"_anotherClass", QVariant::fromValue(anotherClassPtr)}
    // });
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickTests", "Main");

    return app.exec();
}
