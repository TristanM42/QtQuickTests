import QtQuick
import QtQuick.Controls.Basic
import QtQuickTests 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML and C++ integration")

    MyClass {
        id: myClass

        counter: 0
        onMySignall: (data) => { myTextArea.append(data) }
        onCounterChanged: console.log("Counter property changed")
        onMyCustomSignal1: (data) => { myTextArea.append(data + " custom signal 1") }
        onMyCustomSignal2: (data) => { myTextArea.append(data + " custom signal 2") }
    }

    Column {
        anchors.centerIn: parent
        spacing: 15

        Row {
            spacing: 15

            Button {
                width: 100
                height: 25
                text: "Call slot"
                onClicked: {
                    myClass.mySlot("Called my slot")
                    myClass.counter = myClass.counter + 1
                }
            }

            Button {
                width: 100
                height: 25
                text: "Call function"
                onClicked: { myClass.myFunction("Called my function") }
            }

            Button {
                width: 100
                height: 25
                text: "Change property"
                onClicked: { myClass.myMessage += "Changing propertyy" }
            }
        }

        Text {
            text: "Slot called: " + myClass.counter + " times"
        }

        ScrollView {
            id: view

            width: 350
            height: 200
            rightPadding: 20
            bottomPadding: 0

            TextArea {
                id: myTextArea

                property int entries: 1

                text: "Output will appear below..."
                onTextChanged: {
                    entries = entries + 1
                    if (entries > 13) {
                        myFrame.height = myFrame.height + 16
                    }
                }
            }

            Frame {
                id: myFrame

                width: 330
                height: 200
                clip: true
            }
        }
    }
}
