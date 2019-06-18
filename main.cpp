#include <QGuiApplication>
#include <QtQuick>
#include <QDebug>
#include <iostream>
#include <ctime>
#include <chrono>
//#include "themeloader.h"
//#include <controls/themehelper.h>
#include "src/utiltool/CFilterWordsLog.h"

#define EXIT_FAILURE   -1

using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QString qml2ImportPath;
    if(! qgetenv("QML2_IMPORT_PATH").isEmpty())
        qml2ImportPath += QString::fromLocal8Bit(qgetenv("QML2_IMPORT_PATH").constData()) +':' ;
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
     engine.rootContext()->setContextProperty("applicationDirPath", appRootDir);
//     QPointer<ThemeLoader> themeLoader = new ThemeLoader();
//     engine.rootContext()->setContextProperty("themeLoader", themeLoader);

//     QString appThemePath = appRootDir + "/AppThemeData/8inch/Ford-MY20-nav";
//     QString packageId ="com.telenav.sync.telenav-app";
//     qInfo() << "Telenav App package id " << packageId;
//     qInfo() << "Telenav  theme path " << appThemePath;
//D:/_Project2/ford-kipawa/hmi/bin/AppThemeData/8inchHMI_THEME_BASE
//qputenv("HMI_APP_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/AppThemeData/").toLatin1());
//qputenv("HMI_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/HMIThemeData/").toLatin1());
//     themeLoader->loadAppTheme(packageId, appThemePath);
// if (qgetenv("PACKAGE_ID").isEmpty()) { // qnx not ALM installation or window

//      qputenv("HMI_APP_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/AppThemeData/8inch").toLatin1());
//}
     engine.rootContext()->setContextProperty("applicationDirPath", appRootDir);
     ctxt->setContextProperty("defaultGallery", qgetenv("HMI_DEFAULT_GALLERY"));
    // Expose context properties for system information

   //engine.addImportPath(QDir::toNativeSeparators("D:/testcmake/CMakeList-window-ford/qmlf/tableModuleView/tableModuleView"));
    // Expose context property for the process environment
    QProcessEnvironment processEnvironment = QProcessEnvironment::systemEnvironment();
    ctxt->setContextProperty("processEnvironment", processEnvironment.toStringList());
//#if defined(QNX_DEVICE)

//#else
 //   std::shared_ptr<QPluginLoader> pluginLoader(new QPluginLoader(appRootDir + "/qt-arp/hal/fordhal.dll"));
//#endif
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


    engine.load(QUrl(QStringLiteral("qmlf/main.qml")));
    return app.exec();
}
