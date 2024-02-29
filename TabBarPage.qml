import QtQuick
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: TabBar")
        font.pointSize: 20
        color: "lightblue"
    }

    Row {
        anchors.fill: parent

        TabBar {
            id: tabBar

            width: parent.width - addButton.width
            onContentChildrenChanged: () => {
                console.log(qsTr(count + " TabBar's children: "))
                for (const i in contentChildren)
                console.log(contentChildren[i])
            }
        }

        Component {
            id: tabButton

            TabButton { text: qsTr("TabButton") }
        }

        Button {
            id: addButton

            text: "+"
            flat: true
            onClicked: () => { tabBar.addItem(tabButton.createObject(tabBar) as Item) }
        }
    }
}
