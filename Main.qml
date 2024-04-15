import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import EMS 1.0

Window {
    id: mainWindow
    width: 640
    height: 480
    minimumWidth: 300 // Set the minimum width
    minimumHeight: 300 // Set the minimum height
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")

    property Dialog _mainDialog

    Component {
        id: somePageComponent
        SomePage {
            sharedDialog: mainWindow._mainDialog
        }
    }

    // Main content area
    Rectangle {
        width: parent.width
        height: parent.height

        // Display the 'somePage.qml' component
        Item {
            anchors.fill: parent
            Loader {
                sourceComponent: somePageComponent
            }
        }
    }

    Timer {
       id: debugTimer
       interval: 500
       repeat: true

       onTriggered: {
           console.log("debugVal = ", _mainDialog.debugVal);
       }
    }

    Component.onCompleted: {
        debugTimer.start()
    }
}
