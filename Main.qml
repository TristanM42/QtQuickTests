import QtQuick 2.0
import QtQuick.Controls

Window {
    id: rootItem
    width: 800
    height: 600
    visible: true
    title: qsTr("Test Drawer")
    color: "white"

    ListModel {
        id: myModel

        ListElement {
            title: "elemA"
            selected: false
        }
        ListElement {
            title: "elemB"
            selected: false
        }
        ListElement {
            title: "elemC"
            selected: false
        }
        ListElement {
            title: "elemD"
            selected: false
        }
        ListElement {
            title: "elemE"
            selected: false
        }
        ListElement {
            title: "elemF"
            selected: false
        }
        ListElement {
            title: "elemG"
            selected: false
        }
    }

    ListView {
        id: listView
        width: 200
        height: 150 // Display only 4 items at once (4-1)*50
        model: myModel
        boundsBehavior: Flickable.StopAtBounds
        focus: true
        currentIndex: -1

        delegate: Rectangle {
            width: listView.width
            height: 50
            color: index === listView.currentIndex ? "lightblue" : "white"
            Text {
                anchors.centerIn: parent
                text: "Item " + index + " : " + model.title
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index;
                }
            }
        }
    }
}
