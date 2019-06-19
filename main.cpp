#include <QGuiApplication>
#include <QtQuick>
#include <QDebug>
#include <iostream>
#include <ctime>
#include <chrono>
#include "themeloader.h"

//#include <controls/themehelper.h>
//#include "src/utiltool/CFilterWordsLog.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();
    const QString appRootDir = app.applicationDirPath();
    //register themeLoader class
   // QPointer<ThemeLoader> themeLoader = new ThemeLoader();
   // engine.rootContext()->setContextProperty("themeLoader", themeLoader);
    engine.rootContext()->setContextProperty("applicationDirPath", appRootDir);
    //qmlRegisterType<CTextQuery>("CTextQuery", 1, 0, "CTextQuery");

    //load the theme
    QString packageId = "com.telenav.sync.telenav-app";
    QString appThemePath = appRootDir + "/AppThemeData/8inch/Ford-MY20-nav";
    qInfo() << "Telenav App package id " << packageId;
    qInfo() << "Telenav  theme path " << appThemePath;
   // themeLoader->loadAppTheme(packageId, appThemePath);
qputenv("PACKAGE_ID", QDir::toNativeSeparators("com.telenav.sync.telenav-app").toLatin1());
    if (qgetenv("PACKAGE_ID").isEmpty()) { // qnx not ALM installation or window
        qInfo() << "Telenav App package is empty ";
        qputenv("HMI_APP_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/AppThemeData/8inch/Ford-MY20-nav").toLatin1());
        qputenv("HMI_THEME_BASE", QDir::toNativeSeparators(appRootDir + "/HMIThemeData").toLatin1());
    }

    //judge the environment path is remaintain
    QString qml2ImportPath;
    if (!qgetenv("QML2_IMPORT_PATH").isEmpty()){
        qInfo() << "QML2_IMPORT_PATH IS NOT EMPTY" << qgetenv("QML2_IMPORT_PATH");
        qml2ImportPath += QString::fromLocal8Bit(qgetenv("QML2_IMPORT_PATH").constData()) + ':';
    }
    // Add the plugin path from the TARGET as a search path for SYNC-specific
    // plugins (i.e. the libHMIControls).
#ifdef SYNC_TARGET_LOCATION_QMLPLUGINS
#define xstr(s) str(s)
#define str(s) #s
    QString qmlPluginPath = QStringLiteral(xstr(SYNC_TARGET_LOCATION_QMLPLUGINS));
    engine.addImportPath(qmlPluginPath);
#endif

    ctxt->setContextProperty("defaultGallery", qgetenv("HMI_DEFAULT_GALLERY"));
    // Expose context properties for system information
    QSysInfo systemInfo;
    ctxt->setContextProperty("buildCpuArchitecture", systemInfo.buildCpuArchitecture());
    ctxt->setContextProperty("currentCpuArchitecture", systemInfo.currentCpuArchitecture());
    ctxt->setContextProperty("buildAbi", systemInfo.buildAbi());
    ctxt->setContextProperty("kernelType", systemInfo.kernelType());
    ctxt->setContextProperty("kernelVersion", systemInfo.kernelVersion());
    ctxt->setContextProperty("productType", systemInfo.productType());
    ctxt->setContextProperty("productVersion", systemInfo.productVersion());
    ctxt->setContextProperty("prettyProductName", systemInfo.prettyProductName());
    ctxt->setContextProperty("machineHostName", systemInfo.machineHostName());

    // Expose context property for the process environment
    QProcessEnvironment processEnvironment = QProcessEnvironment::systemEnvironment();
    ctxt->setContextProperty("processEnvironment", processEnvironment.toStringList());

    // Expose context property for the version of Qt used to compile the application
#ifdef BUILD_QT_VERSION
#define STRINGIFY(x) #x
#define STRINGIFYMACRO(y) STRINGIFY(y)
    ctxt->setContextProperty("buildQtVersion", STRINGIFYMACRO(BUILD_QT_VERSION));
#endif

    engine.load(QUrl(QStringLiteral("qmlf/main.qml")));
    return app.exec();
}
