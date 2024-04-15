#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dialog.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Dialog *m_dialog = new Dialog();
    m_dialog->setDebugVal(5);
    engine.setInitialProperties({
        {"_mainDialog", QVariant::fromValue(m_dialog)}
    });
    qmlRegisterType<Dialog>("EMS", 1, 0, "Dialog");

    const QUrl url(u"qrc:/QtQuickTests/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
