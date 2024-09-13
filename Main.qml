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

    RowWithEvenSpacing 
    {
        id: root
        anchors.fill: parent
        leftPadding: 0

        Button {
            width: 100
            text: "Elem 10"
        }

        Button {
            width: 150
            text: "Elem 2"
        }

        Button {
            width: 100
            text: "Elem 3"
        }
    }
}
