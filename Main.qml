import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import EMS 1.0

Window {
    id: mainWindow
//Rectangle {
    width: 500
    height: 200
    visible: true

    property Dialog _mainDialog
    property int step : 1

    Rectangle {
        id: container
        width: 500
        height: 500
        color: "transparent"
        anchors.leftMargin: 300
        Rectangle {
            id: rect1
            width: 100
            height: 100
            color: "blue"
            anchors.left: parent.left
            anchors.top: parent.top
        }
        Rectangle {
            id: rect2
            width: 100
            height: 100
            color: "red"
            anchors.top: rect1.bottom
            anchors.left: rect1.right
            anchors.leftMargin: -25
        }
    }
}
