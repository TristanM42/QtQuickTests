pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: StackView")
        font.pointSize: 20
        color: "lightblue"
    }
    footer: RowLayout {
        Button {
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            text: qsTr("Push")
            onClicked: () => { stack.push(mainView) }
        }

        Button {
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            text: qsTr("Pop")
            enabled: stack.depth > 1
            onClicked: () => { stack.pop(StackView.PopTransition) }
        }
    }

    StackView {
        id: stack

        initialItem: mainView
        anchors.fill: parent
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }

        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }

        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }

        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }

    Component {
        id: mainView

        Rectangle {
            color: (stack.depth % 2 == 0) ? "lightgrey" : "lightblue"

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: stack.depth
                font.pointSize: 20
            }
        }
    }
}
