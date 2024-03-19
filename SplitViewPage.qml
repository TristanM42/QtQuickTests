import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts 1.1

Page {
    header: Text {
        text: qsTr("Container Type: SplitView")
        font.pointSize: 20
        color: "lightblue"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            color: "lightblue"

            Label {
                text: qsTr("View 1")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            color: "lightgray"

            Label {
                text: qsTr("View 2")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            color: "lightgreen"

            Label {
                text: qsTr("View 3")
                anchors.centerIn: parent
            }
        }
    }
}
