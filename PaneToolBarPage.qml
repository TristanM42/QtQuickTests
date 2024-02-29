import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Page {
    header: Text {
        text: qsTr("Container Type: Pane (GroupBox, Frame) and ToolBar")
        font.pointSize: 20
        color: "lightblue"
    }
    footer: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("Open Menu Button")
                onClicked: {
                    menu.x = 0
                    menu.y = 0
                    menu.open()
                }
            }

            Label {
                text: qsTr("ToolBar's title")
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                text: qsTr("Popup Menu Button")
                onClicked: menu.popup()
            }
        }
    }

    Pane {
        anchors.centerIn: parent
        RowLayout {
            GroupBox {
                title: qsTr("GroupBox")
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    CheckBox { text: qsTr("Selection 1") }
                    CheckBox { text: qsTr("Selection 2") }
                    CheckBox { text: qsTr("Selection 3") }
                }
            }

            Frame {
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    CheckBox { text: qsTr("Item 1") }
                    CheckBox { text: qsTr("Item 2") }
                    CheckBox { text: qsTr("Item 3") }
                }
            }
        }
    }

    Menu {
        id: menu

        MenuItem { text: action1.text; action: action1 }
        Action { text: qsTr("Action 2" ); onTriggered: console.log(text) }

        MenuSeparator {}

        Menu {
            title: qsTr("Submenu")
            Action { text: qsTr("Action 3"); onTriggered: console.log(text) }
        }
    }

    Action { id: action1; text: qsTr("Action 1"); onTriggered: console.log(text) }
}
