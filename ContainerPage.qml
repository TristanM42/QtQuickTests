import QtQuick
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: Container")
        font.pointSize: 20
        color: "lightblue"
    }

    Container {
        id: container

        anchors.fill: parent
        contentItem: ListView {
            model: container.contentModel
            snapMode: ListView.SnapOneItem
            orientation: ListView.Vertical
        }

        Text {
            text: qsTr("Page 1")
            width: container.width
            height: container.height
        }

        Text {
            text: qsTr("Page 2")
            width: container.width
            height: container.height
        }
    }
}
