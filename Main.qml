import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import EMS 1.0
import QtQuick 6.5
import QtQuick.Shapes 1.15

Window {
    id: mainWindow
    width: 1000
    height: 1000
    visible: true

    property Dialog _mainDialog

    Rectangle {
        width: 1000
        height: 1000
        color: "black"
        z: 0

        Shape {
            width: 200; height: 200
            ShapePath {
                strokeWidth: 1
                strokeColor: "white"
                fillColor: "transparent"
                startX: 100; startY: 100
                PathArc {
                    x: 200; y: 100
                    radiusX: 50; radiusY: 50
                    useLargeArc: false
                    direction: PathArc.Counterclockwise
                }
            }
            ShapePath {
                strokeWidth: 1
                strokeColor: "white"
                fillColor: "transparent"
                startX: 100; startY: 100
                PathArc {
                    x: 200; y: 100
                    radiusX: 50; radiusY: 50
                    useLargeArc: false
                    direction: PathArc.Clockwise
                }
            }
        }
    }

    Item {
        width: 400
        height: 400
        z: 1

        property real endAngle: Math.PI*2

        Canvas {
            id: canvas
            width: parent.width
            height: parent.height
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.beginPath();
                ctx.arc(width / 2, height / 2, 100, 0, parent.endAngle, false);
                ctx.lineWidth = 1;
                ctx.strokeStyle = "red";
                ctx.closePath();
                ctx.stroke();
            }
        }
    }

    Shape {
        z: 2
        ShapePath {
            fillColor: "red"
            strokeWidth: 2
            strokeColor: "blue"
            startX: 50
            startY: 50
            PathSvg {
                path: "L 150 50 L 100 150 z"
            }
        }
    }
}
