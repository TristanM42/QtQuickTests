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

    Row
    {
        id: root
        spacing: 0
        anchors.fill: parent
        property int evenSpacing

        onWidthChanged: () =>
                            {
                               var totalChildrenWidth = 0;
                               for(var i = 0; i < root.children.length; ++i){
                                   totalChildrenWidth += root.children[i].children[0].width; // assuming every items are inside a container
                               }
                               root.evenSpacing = (root.width-totalChildrenWidth)/(root.children.length+1);
                            }


        Rectangle {
            id: rectid
            color: "red"
            width: root.evenSpacing + children[0].width
            height: 50

            Button {
               width: 100
               text: "Elem 1"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
            }
        }

        Rectangle {
            color: "green"
            width: root.evenSpacing + children[0].width
            height: 50

           Button {
               width: 150
               text: "Elem 2"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
           }
        }

        Rectangle {
            color: "blue"
            width: root.evenSpacing + children[0].width
            height: 50

           Button {
               width: 100
               text: "Elem 3"
               anchors.right: parent.right
               anchors.top: parent.verticalCenter
           }
        }
    }
}
