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
        width: 250
        height: 200

        property color initialColor: "lightblue"
        property color selectedColor: "salmon"

        Button {
            id: animatedButton
            text: "Change Color"
            width: 100
            height: 50
            x: 150
            y: 0

            property int animationDelay: 100

            onClicked: {
                colorAnimation.from = root.initialColor;
                colorAnimation.to = root.selectedColor;
                colorAnimationEnd.from = root.selectedColor;
                colorAnimationEnd.to = root.initialColor;
                buttonAnimation.target = this;
                buttonAnimation.from = this.y;
                buttonAnimation.to = this.y + 5;
                buttonAnimationEnd.target = this;
                buttonAnimationEnd.from = this.y + 5;
                buttonAnimationEnd.to = this.y;
                colorAnimation.start();
                buttonAnimation.start();
            }

            background: Rectangle {
                id: colorRect
                radius: 20
                color: root.initialColor

                // Property animation for color transition
                PropertyAnimation {
                    id: colorAnimation
                    target: colorRect
                    property: "color"
                    duration: animatedButton.animationDelay // milliseconds
                    onStopped: colorAnimationEnd.start()
                }

                // Property animation for color transition
                PropertyAnimation {
                    id: colorAnimationEnd
                    target: colorRect
                    property: "color"
                    duration: animatedButton.animationDelay // milliseconds
                }
            }

            // Property animation for button move
            PropertyAnimation {
                id: buttonAnimation
                property: "y"
                duration: animatedButton.animationDelay // milliseconds
                onStopped: buttonAnimationEnd.start()
            }

            // Property animation for button move
            PropertyAnimation {
                id: buttonAnimationEnd
                property: "y"
                duration: animatedButton.animationDelay // milliseconds
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
