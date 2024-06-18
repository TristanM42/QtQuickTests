import QtQuick
import QtQuick.Controls.Basic
import QtQuickTests 1.0
import QtQuick.Layouts

import QtQuick.VirtualKeyboard 2.15
import QtQuick.VirtualKeyboard.Styles 2.15
import QtQuick.VirtualKeyboard.Settings 2.15

import "views/components" as Ems

Window {
    id:rootItem
    width: 640
    height: 480
    color: "grey"
    visible: true
    title: qsTr("Test qtvirtualkeyboard")

    ColumnLayout {
        width: 200
        height: 200
        spacing: 10

        // Label
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 20
            Layout.maximumHeight: 20

            Rectangle {
                anchors.fill: parent
                color: "transparent"

                Ems.Label {
                    defaultText: qsTr("Enter User ID")
                    defaultFontSize: 16

                    anchors.left: parent.left
                }
            }
        }

        // TextField
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 50
            Layout.maximumHeight: 50

            Rectangle {
                anchors.fill: parent
                color: "white"

                TextField {
                    placeholderText: qsTr("User ID")
                }
            }
        }

        // Label
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 20
            Layout.maximumHeight: 20

            Rectangle {
                anchors.fill: parent
                color: "transparent"

                Ems.Label {
                    defaultText: qsTr("Enter Patient ID")
                    defaultFontSize: 16

                    anchors.left: parent.left
                }
            }
        }

        // TextField
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 50
            Layout.maximumHeight: 50

            Rectangle {
                anchors.fill: parent
                color: "white"

                TextField {
                    placeholderText: qsTr("Patient ID")
                }
            }
        }
    }
}
