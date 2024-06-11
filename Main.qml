import QtQuick 2.0
import QtQuick.Controls

Window {
    id: rootItem
    width: 800
    height: 600
    visible: true
    title: qsTr("Test Drawer")
    color: "white"

    Item {
        width: 800
        height: 600

        Rectangle {
            id: rect
            anchors.centerIn: parent
            implicitWidth: 500
            implicitHeight: 200
            color: "red"

            Button {
                text: "Toggle Full Size"
                anchors.centerIn: parent
                onClicked: {
                    if (rect.anchors.fill) {
                        rect.anchors.fill = undefined
                        rect.width = undefined
                        rect.height = undefined
                    } else {
                        rect.anchors.fill = rect.parent
                    }
                }
            }
        }
    }
}
