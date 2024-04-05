#ifndef PLOT_H
#define PLOT_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickPaintedItem>
#include <QPainter>

class Plot : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
public:
    Plot();

    // QQuickPaintedItem interface
public:
    void paint(QPainter *painter);

private:
    QPointF m_points[1920*1080];
    int m_pointsInit[1920];
};

#endif // PLOT_H
