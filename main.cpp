#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Install the application icon by specifying the full path to the picture
    app.setWindowIcon(QIcon(":/Musicplayer/assets/icons/app_icon.png"));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/Musicplayer/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
