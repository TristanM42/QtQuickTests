#include <random>
#include "plot.h"
#include <cmath>
#include <math.h>
#include "src/date_utils.hpp"

using namespace utils;

Plot::Plot() {
    srand(static_cast<unsigned>(time(0)));
    timerAnim.start();
    timerLogs.start();
}

void Plot::paint(QPainter *painter)
{
    float x, y, x0, y0;
    float xMin = 0.0;
    float xMax = 5.0;
    float yMin = 0.0;
    float yMax = 5.0;

    QList<QPointF> pointsList;

    float myMax = 5.0;
    std::random_device rd;
    // Engines
    std::mt19937 e2(rd());
    //std::knuth_b e2(rd());
    //std::default_random_engine e2(rd()) ;
    //float step = static_cast<float>(rand()) / (static_cast<float>(RAND_MAX/myMax));
    std::uniform_real_distribution<> dist(0, myMax);
    float step = dist(e2);

    QPixmap pixmap(640, 480);
    pixmap.fill(Qt::black);
    // create painter that will draw the plot
    QPainter pixmapPainter(&pixmap);
    //pixmapPainter.setRenderHint(QPainter::Antialiasing);
    QColor curveColor = QColor().fromRgb(qRgb(61,248,138));
    pixmapPainter.setPen(QPen(curveColor, 1.0));

    // Add animation to points to test if performance is worse when a lot of points are updated
    float animPeriod = 4000.0;
    float animRadius = 50;
    int xTrans = (int)std::round(animRadius * cos(timerAnim.elapsed()/animPeriod * M_PI*2));
    int yTrans = (int)std::round(animRadius * sin(timerAnim.elapsed()/animPeriod * M_PI*2));
    //qDebug() << "xTrans = " << xTrans << " ; yTrans = " << yTrans;
    if (timerAnim.elapsed() > animPeriod)
        timerAnim.start();

    // x0 = dist(e2);
    // y0 = dist(e2);
    // x = 640 * (x0 - xMin) / (xMax - xMin); // normalisation de x0 entre 0 et 1 puis multiplication par le max du nouveau repère
    // y = 480 * (y0 - yMin) / (yMax - yMin);
    // auto randomPoint = QPointF(x, y);
    //m_points[(int)std::round(x)+(int)std::round(y)*480] = randomPoint;
    m_points[linePointToAddIndex] = QPointF(pX[linePointToAddIndex], pY[linePointToAddIndex]);
    if (linePointToAddIndex < 456)
        linePointToAddIndex++;
    m_nbPoints++;
    bool refreshLogs = false;
    if (timerLogs.elapsed() > animPeriod/8)
    {
        refreshLogs = true;
        timerLogs.start();
    }
    uint64_t timeStampMicro;
    if (refreshLogs)
    {
        timeStampMicro = DateTime::GetCurrentTimestamp();
        qDebug() << "m_nbPoints = " << m_nbPoints << " ; FPS = " << 1000/((timeStampMicro-fullLoopStartTimestamp)/1000);
    }
    fullLoopStartTimestamp = DateTime::GetCurrentTimestamp();
    // m_points[0] = randomPoint;

    paintLoopStartTimestamp = DateTime::GetCurrentTimestamp();
    for(int i=0; i<std::size(m_points); i++) {
        m_points[i] += QPointF(xTrans, yTrans);
        //painter->drawPoint(m_points[i]); // 7~11 FPS
    }
    //painter->drawPoints(m_points, (int)std::size(m_points));
    pixmapPainter.drawPolyline(m_points, linePointToAddIndex);
    for(int i=0; i<std::size(m_points); i++) {
        m_points[i] -= QPointF(xTrans, yTrans);
    }
    if (refreshLogs)
    {
        timeStampMicro = DateTime::GetCurrentTimestamp();
        qDebug() << "FPS paint loop = " << 1000/((timeStampMicro-paintLoopStartTimestamp)/1000);
    }

    // stop painting
    pixmapPainter.end();
    // convert pixmap into an image
    QImage plotImage = pixmap.toImage();
    // draw the resulted image
    painter->drawImage(0.0, 0.0, plotImage);

    return;
}
