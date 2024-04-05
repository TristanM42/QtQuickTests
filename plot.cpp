#include <random>
#include "plot.h"

Plot::Plot() {
    srand(static_cast<unsigned>(time(0)));
    for (int i= 0; i < 1920; i++) {
        m_pointsInit[i] = 0;
    }
}

void Plot::paint(QPainter *painter)
{
    float x, y, x0, y0;
    float xMin = 0.0;
    float xMax = 5.0;
    float yMin = 0.0;
    float yMax = 5.0;

    QList<QPointF> pointsList;

    float myMax = 0.5;
    std::random_device rd;
    // Engines
    std::mt19937 e2(rd());
    //std::knuth_b e2(rd());
    //std::default_random_engine e2(rd()) ;
    //float step = static_cast<float>(rand()) / (static_cast<float>(RAND_MAX/myMax));
    std::uniform_real_distribution<> dist(0, myMax);
    float step = dist(e2);

    x0 = dist(e2)*10;
    y0 = 0.0;
    x = width() * (x0 - xMin) / (xMax - xMin); // normalisation de x0 entre 0 et 1 puis multiplication par le max du nouveau repère
    y = height() * (y0 - yMin) / (yMax - yMin);
    auto randomPoint = QPointF(x, y);
    m_points[(int)std::round(x)+(int)std::round(y)*1920] = randomPoint;
    if (m_pointsInit[(int)std::round(x)] > 0) {
        m_points[(int)std::round(x)+(int)std::round(y+1)*1920] = QPointF(x, y+1);
    }
    m_pointsInit[(int)std::round(x)]++;
    for(QPointF ppoint : m_points) {
        painter->drawPoint(ppoint);
    }
    return;

    x = 0.0; y = 0.0;
    for (uint8_t i = 0 ; i < (xMax*2 + 1)*2 ; i++) {
        pointsList.append(QPointF(x, y));
        if (i%2 == 0)
            x += step;
        else
            y += step;
    }

    // changement de coordonnées pour remplir tout le contenant
    QList<QPointF> newPoints;
    for (int i = 0; i < pointsList.size(); ++i) {
        x0 = pointsList.at(i).x();
        y0 = pointsList.at(i).y();

        x = width() * (x0 - xMin) / (xMax - xMin); // normalisation de x0 entre 0 et 1 puis multiplication par le max du nouveau repère
        y = height() * (y0 - yMin) / (yMax - yMin);

        // qDebug() << "x0: " << x0 << ", y0: " << y0;
        // qDebug() << "x: " << x << ", y: " << y;
        // qDebug() << "---------";

        newPoints.append(QPointF(x, y));
    }

    painter->drawPolyline(newPoints);
}
