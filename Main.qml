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

    // Show keyboard inside the window (on text field click)
    InputPanel {
        id: inputPanel
        y: yPositionWhenHidden
        anchors.left: parent.left
        anchors.right: parent.right

        property real yPositionWhenHidden: parent.height

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: inputPanel.yPositionWhenHidden - inputPanel.height
            }
        }
        transitions: Transition {
            id: inputPanelTransition
            from: ""
            to: "visible"
            reversible: true
            enabled: !VirtualKeyboardSettings.fullScreenMode
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

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
                    onAccepted: patientField.focus = true
                    inputMethodHints: Qt.ImhNoAutoUppercase
                    EnterKeyAction.actionId: EnterKeyAction.Next
                    EnterKeyAction.label: "Next"
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
                    id: patientField
                    placeholderText: qsTr("Patient ID")
                    inputMethodHints: Qt.ImhNoAutoUppercase
                    EnterKeyAction.actionId: EnterKeyAction.Send
                    onAccepted: () => { Qt.inputMethod.hide(); }
                }
            }
        }
    }
}
