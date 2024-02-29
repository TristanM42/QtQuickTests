import QtQuick
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: SplitView")
        font.pointSize: 20
        color: "lightblue"
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            implicitWidth: 200
            SplitView.maximumWidth: 400
            color: "lightblue"

            Label {
                text: qsTr("View 1")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            SplitView.minimumWidth: 50
            SplitView.fillWidth: true
            color: "lightgray"

            Label {
                text: qsTr("View 2")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            implicitWidth: 200
            color: "lightgreen"

            Label {
                text: qsTr("View 3")
                anchors.centerIn: parent
            }
        }
    }
}
