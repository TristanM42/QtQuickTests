import QtQuick
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: ScrollView")
        font.pointSize: 20
        color: "lightblue"
    }

    ScrollView {
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Label {
            text: "ABC"
            font.pixelSize: 624
        }
    }
}
