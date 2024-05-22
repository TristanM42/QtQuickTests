import QtQuick
import QtQuick.Controls.Basic
import QtQuickTests 1.0
import QtQuick.Layouts

Window {
    id:rootItem
    width: 640
    height: 480
    visible: true
    title: qsTr("Test rowlayout")

    RowLayout
    {
       spacing: 0
       anchors.fill: parent

        ColumnLayout {
            width: parent.width
            height: parent.height

            Rectangle {
                color: "red"
                border.color: "grey"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignCenter
            }
        }

        ColumnLayout {
            id: customButtons
            width: parent.width
            height: parent.height
            spacing: 0

            Rectangle {
                color: "green"
                border.color: "grey"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignCenter
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Rectangle {
                    color: "yellow"
                    border.color: "grey"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignCenter
                }

                Rectangle {
                    color: "purple"
                    border.color: "grey"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignCenter
                }
            }

            Rectangle {
                color: "blue"
                border.color: "grey"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
