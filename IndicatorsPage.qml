import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    id: indicatorsTab

    RowLayout {
        anchors.fill: parent
        spacing: 20

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "BusyIndicator"
                font.italic: true
            }

            Switch {
                id: busySwitch

                text: qsTr("Busy")
                onCheckedChanged: {
                    if (position === 1) {
                        console.log("Switch was switched, check BusyIndicator")
                    }
                    else if (position === 0) {
                        console.log("Switch was unswitched, check BusyIndicator")
                    }
                }
            }

            BusyIndicator { running: busySwitch.position }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "ProgressBar"
                font.italic: true
            }

            ProgressBar {
                from: 0
                to: 1
                value: 0.5
                indeterminate: false
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "ScrollBar, ScrollIndicator"
                font.italic: true
            }

            Flickable {
                id: flickable

                width: 100
                height: 100
                contentWidth: label.width
                contentHeight: label.height
                clip: true

                Label {
                    id: label

                    text: "Flickable"
                    font.italic: true
                    font.pixelSize: 90
                }

                ScrollBar.vertical: ScrollBar {
                    active: true
                    parent: flickable
                }

                ScrollIndicator.horizontal: ScrollIndicator {
                    active: true
                    anchors {left: parent.left; right: parent.right; bottom: parent.bottom }
                }
            }
        }
    }
}
