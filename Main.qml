import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 640
    height: 480
    minimumWidth: 300 // Set the minimum width
    minimumHeight: 300 // Set the minimum height
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")

    // Rectangle {
    //     width: 200; height: 200

        ListModel {
            id: myModel
            ListElement { name: "Element 1" }
            ListElement { name: "Element 2" }
            ListElement { name: "Element 3" }
        }

        ListView {
            anchors.fill: parent
            model: myModel

            delegate: Item {
                width: parent.width; height: 50

                Rectangle {
                    width: parent.width; height: parent.height
                    color: index % 2 === 0 ? "lightblue" : "white"

                    Text {
                        text: "Index: " + index + ", Name: " + name
                        anchors.centerIn: parent
                    }
                }
            }
        }
    //}
}
