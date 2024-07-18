#ifndef PLOTQSG_H
#define PLOTQSG_H

#include <QObject>
#include <QQmlEngine>

#include <QDebug>
#include <QElapsedTimer>

#include <QQuickItem>
#include <QSGNode>
#include <QSGGeometryNode>
#include <QSGSimpleRectNode>
#include <QOpenGLContext>

// class GraphNode : public QSGNode
// {
// public:
//     GraphNode()
//     {
//         // Create geometry for a single point (you'd extend this for multiple points)
//         geometry = new QSGGeometryNode;
//         geometry->setFlag(QSGNode::PointType);
//         QSGGeometry *geo = new QSGGeometry(QSGGeometry::defaultAttributes_Point2D(), 1);
//         geo->vertexDataAsPoint2D()[0].set(0, 0); // Initial point position
//         geometry->setGeometry(geo);
//         geometry->setFlag(QSGNode::OwnsGeometry);

//         // Add the geometry to the scene graph
//         appendChildNode(geometry);
//     }

//     // Update the point's position (e.g., in response to a timer or data change)
//     void updatePoint(float x, float y)
//     {
//         QSGGeometry::Point2D *vertices = geometry->geometry()->vertexDataAsPoint2D();
//         vertices[0].set(x, y);
//         geometry->markDirty(QSGNode::DirtyGeometry);
//     }

// private:
//     QSGGeometryNode *geometry;
// };

// class GraphItem : public QQuickItem
// {
// public:
//     Q_INVOKABLE void updateData(float x, float y)
//     {
//         static_cast<GraphNode*>(m_graphNode)->updatePoint(x, y);
//     }

//     QSGNode *updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) override
//     {
//         if (!m_graphNode) {
//             m_graphNode = new GraphNode();

//             // Ensure OpenGL context is available
//             QOpenGLContext *ctx = QOpenGLContext::currentContext(); // Corrected access
//             if (!ctx) {
//                 qWarning("OpenGL context not available!");
//                 return nullptr;
//             }
//         }
//         return m_graphNode;
//     }
// private:
//     GraphNode *m_graphNode = nullptr;
// };


#endif // PLOTQSG_H
