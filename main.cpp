#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QDate>
#include <QQmlContext>
#include <memory>

#include "dia_lib.h"
#include "mysettings.h"
//TODO: CHack for QDate - create myDate class with Q_invocable functions
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    auto currentUser = std::make_shared<Patient>();
    QGuiApplication app(argc, argv);
    //QDate *today = new QDate(QDate::currentDate());
    app.setApplicationName("DIA");
    app.setOrganizationName("Tristan");
    app.setOrganizationDomain("tristan.ua");
    app.setFont(QFont("Bookman Old Style"));
    
    MySettings::QSettings::setPath(QSettings::Format::IniFormat, QSettings::Scope::UserScope, app.applicationDirPath());
    MySettings settings;

            
    auto engine = std::make_unique<QQmlApplicationEngine>();
    if (settings.isFirstStart())
    {
        //engine->rootContext()->setContextProperty("today", today);
        engine->load(QUrl(QStringLiteral("qrc:/start.qml")));        
    }
    
    
    
    if (engine->rootObjects().isEmpty())
        return -1;
    
    return app.exec();
}
