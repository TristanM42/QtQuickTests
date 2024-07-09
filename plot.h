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
    int m_nbPoints = 0;

private:
    QPointF m_points[640*480];
};

#endif // PLOT_H
