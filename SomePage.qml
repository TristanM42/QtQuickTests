import QtQuick

Rectangle {
    width: 200
    height: 150
    color: "lightblue"
    //property alias myDemoController: mainWindow._demoController

    Text {
        anchors.centerIn: parent
        text: "Hello from somePage.qml!"
        font.pixelSize: 16
    }
}
