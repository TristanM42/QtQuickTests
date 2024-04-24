import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    width: 200
    height: 150
    color: "lightblue"
    property var sharedDialog

    Text {
        anchors.centerIn: parent
        text: "Hello from somePage.qml!"
        font.pixelSize: 16
    }

    Button {
        id: debugButton
        onClicked: () => {
                       console.log("sharedDialog.debugVal = ", sharedDialog.debugVal)
                       sharedDialog.debugVal = 4;
                   }
    }
}
