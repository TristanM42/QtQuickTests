import QtQuick
import QtQuick.Controls
import QtQuickTests 1.0
import QtQuick.Layouts

Window {
    id: rootItem
    width: 640
    height: 480
    visible: true
    title: qsTr("Test Drawer")
    color: "white"

    Drawer { // warning, can't be used inside a grid/row/column element
        id: drawer
        parent: rootItem
        width: 0.3 * rootItem.width
        height: rootItem.height
        edge: Qt.RightEdge

        Rectangle {
            color: "grey"
            height: parent.height
            width: parent.width

            Label {
                text: "Drawer content"
                color: "white"
                anchors.centerIn: parent
            }
        }

        Component.onCompleted: {
            drawer.open();
        }
    }
}
