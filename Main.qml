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

       Rectangle {
           id: rectid
           color: "red"
           Layout.fillWidth: true
           Layout.fillHeight: true

           Button {
               id: elem
               width: 100
               text: "Elem"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
           }
       }

       Rectangle {
           color: "green"
           Layout.fillWidth: true
           Layout.fillHeight: true

           Button {
               id: elem1
               width: 100
               text: "Elem"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
           }
       }

       Rectangle {
           color: "blue"
           Layout.fillWidth: true
           Layout.fillHeight: true

           Button {
               id: elem2
               width: 100
               text: "Elem"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
           }
       }

       // Filler item
       Item {
           Layout.preferredWidth: rectid.width - elem.width
       }
    }
}
