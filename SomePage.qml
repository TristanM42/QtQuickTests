import QtQuick

Rectangle {
    width: 200
    height: 150
    color: "lightblue"
    property Window refMainWindow
    property var sharedDialog: refMainWindow.mainDialog

    Text {
        anchors.centerIn: parent
        text: "Hello from somePage.qml!"
        font.pixelSize: 16
    }
}
