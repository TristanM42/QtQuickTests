import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Window {
    id: mainWindow
    width: 640
    height: 480
    minimumWidth: 300 // Set the minimum width
    minimumHeight: 300 // Set the minimum height
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")

    Component {
        id: somePageComponent
        SomePage {}
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
}
