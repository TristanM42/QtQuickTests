import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")
    header: PageIndicator {
        count: view.count
        currentIndex: view.currentIndex
    }
    footer: RowLayout {
        CustomButton {
            text: "Custom button"
        }
        Button {
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.preferredHeight: 50
            text: qsTr("Home")
            onClicked: view.setCurrentIndex(0)
            enabled: view.currentIndex !== 0
        }

        Button {
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.preferredHeight: 50
            text: qsTr("Previous")
            onClicked: view.decrementCurrentIndex()
            enabled: view.currentIndex > 0
        }

        Button {
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.preferredHeight: 50
            text: qsTr("Next")
            onClicked: view.incrementCurrentIndex()
            enabled: view.currentIndex < view.count - 1
        }
    }
    menuBar: MenuBar { Menu {
            title: "Menu"
            Action { text: "Action" }
        }
    }

    SwipeView {
        id: view

        anchors.fill: parent
        onCurrentIndexChanged: console.log(itemAt(currentIndex))

        ContainerPage {}

        TabBarPage {}

        ScrollViewPage {}

        StackViewPage {}

        SplitViewPage {}

        PaneToolBarPage {}
    }
}
