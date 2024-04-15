import QtQuick

Rectangle {
    width: 200
    height: 150
    color: "lightblue"
    property alias sharedDialog: mainWindow.mainDialog

    Text {
        anchors.centerIn: parent
        text: "Hello from somePage.qml!"
        font.pixelSize: 16
    }
}
