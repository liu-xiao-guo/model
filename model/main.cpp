#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>

#include "datalistmodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    DataListModel model;
    model.append( Data("wolf.jpg", "Medium") );
    model.append( Data("polarbear.jpg", "Large") );
    model.append( Data("quoll.jpg", "Small") );

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.rootContext()->setContextProperty("myModel", &model);
    view.show();
    return app.exec();
}

