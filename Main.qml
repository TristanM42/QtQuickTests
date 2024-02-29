import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: root

    width: 900
    height: 600
    visible: true
    title: qsTr("Qt Quick Controls")

    //ApplicationWindow header definition ----------------------------------------------------------
    header: Rectangle {
        width: parent.width
        height: 60
        color: "lightblue"

        Column {
            anchors.fill: parent

            Text { text: qsTr("ApplicationWindow header: "); font.italic: true }

            ToolBar {
                RowLayout {
                    width: parent.width

                    ToolButton {
                        text: qsTr("Tool Button: Log to Console")
                        onClicked: { console.log("Tool button clicked") }
                    }

                    ToolSeparator {}

                    ToolButton {
                        text: qsTr("Disabled Tool Button")
                        enabled: false
                    }
                }
            }
        }
    }

    //ApplicationWindow footer definition ----------------------------------------------------------
    footer: Rectangle {
        width: parent.width
        height: 50
        color: "lightblue"

        Column {
            anchors.fill: parent

            Text { text: qsTr("ApplicationWindow footer: "); font.italic: true }

            TabBar {
                id: bar

                width: parent.width
                position: TabBar.Footer

                TabButton { text: qsTr("Buttons") }

                TabButton { text: qsTr("Indicators") }

                TabButton { text: qsTr("Inputs") }
            }

            PageIndicator {
                currentIndex: bar.currentIndex
                count: bar.count
            }
        }
    }

    //ApplicationWindow menu bar definition --------------------------------------------------------
    menuBar: MenuBar {
        Menu {
            title: qsTr("&Navigate")

            Action { text: qsTr("&1 Buttons"); onTriggered: swipeView.setCurrentIndex(0)}

            Action { text: qsTr("&2 Indicators"); onTriggered: swipeView.setCurrentIndex(1)}

            Action { text: qsTr("&3 Inputs"); onTriggered: swipeView.setCurrentIndex(2)}

            MenuSeparator { }

            Action { text: qsTr("&Quit"); onTriggered: root.close()}
        }

        Menu {
            title: qsTr("&Help")

            MenuItem {text: openDialogAction.text; action: openDialogAction}
        }

        Action {
            id: openDialogAction

            text: qsTr("&About")
            icon.name: "help-about"
            shortcut: StandardKey.HelpContents
            onTriggered: dialog.open()
        }

        Dialog {
            id: dialog

            title: qsTr("Help")
            standardButtons: Dialog.Ok
            onAccepted: console.log("Ok clicked")
            onRejected: console.log("Cancelled")
            implicitWidth: 400
            contentItem: Text {text: qsTr("Application to present the main features of Qt Quick Controls")}
        }
    }

    //ApplicationWindow main content definition ----------------------------------------------------
    SwipeView {
        id: swipeView

        anchors.fill: parent
        currentIndex: bar.currentIndex
        onCurrentIndexChanged: bar.setCurrentIndex(currentIndex)

        //Tab about Buttons Controls ---------------------------------------------------------------
        ButtonsPage {}

        //Tab about Indicators Controls ------------------------------------------------------------
        IndicatorsPage {}

        //Tab about Input Controls -----------------------------------------------------------------
        InputsPage {}
    }
}
