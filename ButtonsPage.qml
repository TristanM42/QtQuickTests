import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    RowLayout {
        anchors.fill: parent
        spacing: 20

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Button"
                font.italic: true
            }

            Button {
                icon.source: "qrc:/log.png"
                icon.name: "log"
                icon.color : "blue"
                icon.height: 40
                icon.width: 40
                display: AbstractButton.TextUnderIcon
                spacing: 5
                text: qsTr("Log to Console")
                onClicked: { console.log("Button clicked") }
                onDoubleClicked: { console.log("Button double clicked") }
                ToolTip.delay: 500
                ToolTip.timeout: 2000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("This tool tip is shown after hovering the button.")
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "CheckBox"
                font.italic: true
            }

                CheckBox {
                    text: qsTr("True/False")
                    onClicked: { if (checked) {
                            console.log("Check box: True")
                        }
                        else {
                            console.log("Check box: False")
                        }
                    }
                }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "CheckBox in a ButtonGroup"
                font.italic: true
            }

            GroupBox {
                title: qsTr("Langages")

                Column {
                    ButtonGroup {
                        id: langagesGroup

                        exclusive: false
                        checkState: langagesBox.checkState
                    }

                    CheckBox {
                        id: langagesBox

                        text: if (checkState == 2) {
                                  qsTr("Unselect All")
                              } else {
                                  qsTr("Select All")
                              }
                        checkState: langagesGroup.checkState
                        onCheckStateChanged: {
                            console.log("Langages box checkstate: " + checkState)
                        }
                    }

                    CheckBox {
                        checked: true
                        text: qsTr("Finnish")
                        ButtonGroup.group: langagesGroup
                        onClicked: { if (checked) {
                                console.log("Finnish check box: Checked by user")
                            }
                            else {
                                console.log("Finnish check box: Unchecked by user")
                            }
                        }
                    }

                    CheckBox {
                        text: qsTr("French")
                        ButtonGroup.group: langagesGroup
                        onClicked: { if (checked) {
                                console.log("French check box: Checked by user")
                            }
                            else {
                                console.log("French check box: Unchecked by user")
                            }
                        }
                    }
                }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "DelayButton"
                font.italic: true
            }

            DelayButton {
                id: delayButton

                text: qsTr("Log with delay")
                delay: 500
                progress: 0.1
                onActivated: { console.log("Delay button activated") }
                onProgressChanged: { console.log("Delay button's progress: " + progress) }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "RadioButton"
                font.italic: true
            }

            Column {
                RadioButton {
                    checked: true
                    text: qsTr("Python")
                    onClicked: {
                        console.log("Radio button clicked: " + text)
                    }
                }

                RadioButton {
                    text: qsTr("C++")
                    onClicked: {
                        console.log("Radio button clicked: " + text)
                    }
                }

                RadioButton {
                    text: qsTr("JavaScript")
                    onClicked: {
                        console.log("Radio button clicked: " + text)
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "RadioButton in a ButtonGroup"
                font.italic: true
            }

            Frame {
                Column {
                    ButtonGroup {
                        id: radioGroup

                        exclusive: true
                        onClicked: {
                            console.log("Radio button clicked: " + checkedButton.text)
                        }
                    }

                    RadioButton {
                        checked: true
                        text: qsTr("DAB")
                        ButtonGroup.group: radioGroup
                    }

                    RadioButton {
                        text: qsTr("FM")
                        ButtonGroup.group: radioGroup
                    }

                    RadioButton {
                        text: qsTr("AM")
                        ButtonGroup.group: radioGroup
                    }
                }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "RoundButton"
                font.italic: true
            }

            RoundButton {
                text: "\u2713" // Unicode Character 'CHECK MARK'
                radius: 10
                onClicked: { console.log("Round button clicked") }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Switch"
                font.italic: true
            }

            Switch {
                text: qsTr("Switch")
                onCheckedChanged: {
                    if (position === 1) {
                        console.log("Switch was switched")
                    }
                    else if (position === 0) {
                        console.log("Switch was unswitched")
                    }
                }
            }
        }
    }
}
