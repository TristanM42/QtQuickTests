import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    id: inputsTab

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "ComboBox"
                font.italic: true
            }

            ComboBox {
                editable: true
                //displayText: "Fruit: " + currentText //can be used if editable: false
                model: ListModel {
                    id: model

                    ListElement { text: qsTr("Banana") }
                    ListElement { text: qsTr("Apple") }
                    ListElement { text: qsTr("Coconut") }
                }
                onAccepted: {
                    if (find(editText) === -1)
                        model.append({text: editText})
                }
                onActivated: (index) => console.log("ComboBox: " + index + " - " + currentText)
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Dial"
                font.italic: true
            }

            Dial {
                inputMode: "Circular" //"Horizontal" "Vertical"
                stepSize: 0.2
                wrap: true
                onMoved: { console.log("Dial moved: " + angle + "deg") }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Slider"
                font.italic: true
            }

            Slider {
                id: slider

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 100
                value: 50
                onPositionChanged: { console.log("Slider position changed: " + position) }

                ToolTip {
                    parent: slider.handle
                    visible: slider.pressed
                    text: slider.value.toFixed(1)
                } 
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "RangeSlider"
                font.italic: true
            }

            RangeSlider {
                id: rangeSlider

                from: 0
                to: 10
                first.value: 2
                second.value: 7
                first.onMoved: {
                    console.log("Range slider: first.value changed to " + first.value)
                }
                second.onValueChanged: {
                    console.log("Range slider: second.value changed to " + second.value)
                }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "TextArea"
                font.italic: true
            }

            TextArea {
                placeholderText: qsTr("Enter multi-line text")
                onEditingFinished: { console.log("TextArea: " + text) }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "TextField"
                font.italic: true
            }

            TextField {
                placeholderText: qsTr("Enter one-line text")
                onEditingFinished: { console.log("TextField: " + text) }
            }
        }

        Column {
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Tumbler"
                font.italic: true
            }

            Tumbler {
                model: 5
                onCurrentIndexChanged: { console.log("Tumbler: " + currentIndex) }
            }
        }
    }
}
