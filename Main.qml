import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")

    Rectangle {
           id: root
           anchors.fill: parent

           Button {
               text: "Change Color"
               onClicked: {
                   colorAnimation.from = colorRect.color;
                   colorAnimation.to = "salmon"; // Set your desired color here
                   colorAnimation.start();
               }
           }

           Rectangle {
               id: colorRect
               width: 100
               height: 100
               color: "lightblue" // Initial color

               // Property animation for color transition
               PropertyAnimation {
                   id: colorAnimation
                   target: colorRect
                   property: "color"
                   duration: 500 // 500 milliseconds
               }
           }
       }

    // header: PageIndicator {
    //     count: view.count
    //     currentIndex: view.currentIndex
    // }
    // footer: RowLayout {
    //     CustomButton {
    //         text: "Custom button"
    //     }
    //     Button {
    //         Layout.fillWidth: true
    //         Layout.minimumWidth: 150
    //         Layout.preferredHeight: 50
    //         text: qsTr("Home")
    //         onClicked: view.setCurrentIndex(0)
    //         enabled: view.currentIndex !== 0
    //     }

    //     Button {
    //         Layout.fillWidth: true
    //         Layout.minimumWidth: 150
    //         Layout.preferredHeight: 50
    //         text: qsTr("Previous")
    //         onClicked: view.decrementCurrentIndex()
    //         enabled: view.currentIndex > 0
    //     }

    //     Button {
    //         Layout.fillWidth: true
    //         Layout.minimumWidth: 150
    //         Layout.preferredHeight: 50
    //         text: qsTr("Next")
    //         onClicked: view.incrementCurrentIndex()
    //         enabled: view.currentIndex < view.count - 1
    //     }
    // }
    // menuBar: MenuBar { Menu {
    //         title: "Menu"
    //         Action { text: "Action" }
    //     }
    // }

    // SwipeView {
    //     id: view

    //     anchors.fill: parent
    //     onCurrentIndexChanged: console.log(itemAt(currentIndex))



    //     ContainerPage {}

    //     TabBarPage {}

    //     ScrollViewPage {}

    //     StackViewPage {}

    //     SplitViewPage {}

    //     PaneToolBarPage {}
    // }
}
