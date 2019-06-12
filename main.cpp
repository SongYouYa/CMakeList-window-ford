#include <QGuiApplication>
#include <QtQuick>
#include <QDebug>

//#include "D:\Awork_\ford-kipawa\ford-qt-hmi\arpQt\inc\themeloader.h"
//#include "D:\Awork_\ford-kipawa\ford-qt-hmi\ford\include\HMIControls\controls\themehelper.h"
//#include<controls/themehelper.h>

#include <iostream>
#include <ctime>
#include <chrono>

#include "src/utiltool/CFilterWordsLog.h"
//#include "qmlf/tableModuleView/TableViewItem.qml"
#define EXIT_FAILURE   -1

using namespace std;



int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QQmlContext *ctxt = engine.rootContext();

    // Add the plugin path from the TARGET as a search path for SYNC-specific
    // plugins (i.e. the libHMIControls).
#ifdef SYNC_TARGET_LOCATION_QMLPLUGINS
#define xstr(s) str(s)
#define str(s) #s
    QString qmlPluginPath = QStringLiteral(xstr(SYNC_TARGET_LOCATION_QMLPLUGINS));
    engine.addImportPath(qmlPluginPath);
#endif
     const QString appRootDir = app.applicationDirPath();
     qputenv("HMI_APP_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/AppThemeData/12inch").toLatin1());
     qputenv("HMI_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/HMIThemeData").toLatin1());
     engine.rootContext()->setContextProperty("applicationDirPath", appRootDir);
     ctxt->setContextProperty("defaultGallery", qgetenv("HMI_DEFAULT_GALLERY"));
    // Expose context properties for system information

   engine.addImportPath(QDir::toNativeSeparators("D:/testcmake/CMakeList-window-ford/qmlf/tableModuleView/tableModuleView"));
    // Expose context property for the process environment
    QProcessEnvironment processEnvironment = QProcessEnvironment::systemEnvironment();
    ctxt->setContextProperty("processEnvironment", processEnvironment.toStringList());

    // Expose context property for the version of Qt used to compile the application
#ifdef BUILD_QT_VERSION
#define STRINGIFY(x) #x
#define STRINGIFYMACRO(y) STRINGIFY(y)
    ctxt->setContextProperty("buildQtVersion", STRINGIFYMACRO(BUILD_QT_VERSION));
#endif
//    ThemeHelper *inst = ThemeHelper::getInstance();
//    if(inst)
//    {
//        std::cout << "create ThemeHelper success" << std::endl;
//    }

    qmlRegisterType<CTextQuery>("CTextQuery",1,0,"CTextQuery");
   // qmlRegisterType<TableModel>("TableModel", 0, 1, "TableModel");


    engine.load(QUrl(QStringLiteral("qrc:/qmlf/main.qml")));
    return app.exec();
}
