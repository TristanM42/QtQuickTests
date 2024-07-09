#include <random>
#include "plot.h"

Plot::Plot() {
    srand(static_cast<unsigned>(time(0)));
    timer.start();
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

    x0 = dist(e2);
    y0 = dist(e2);
    x = 640 * (x0 - xMin) / (xMax - xMin); // normalisation de x0 entre 0 et 1 puis multiplication par le max du nouveau repère
    y = 480 * (y0 - yMin) / (yMax - yMin);
    auto randomPoint = QPointF(x, y);
    m_points[(int)std::round(x)+(int)std::round(y)*480] = randomPoint;
    m_nbPoints++;
    qDebug() << "m_nbPoints = " << m_nbPoints << " ; FPS = " << 1000/timer.elapsed();
    timer.start();
    m_points[0] = randomPoint;
    for(QPointF ppoint : m_points) {
        painter->drawPoint(ppoint);
    }
    return;
}
