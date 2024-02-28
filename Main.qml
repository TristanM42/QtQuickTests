import QtQuick
import QtQuick.Controls.Basic
import QtQuickTests 1.0
import com.example 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML and C++ integration")

    //required property MyClass _myClass;

    Connections {
        target: MyClass
        onMySignall: (data) => { myTextArea.append(data) }
        onCounterChanged: console.log("Counter property changed")
        onMyCustomSignal1: (data) => { myTextArea.append(data + " custom signal 1") }
        onMyCustomSignal2: (data) => { myTextArea.append(data + " custom signal 2") }
    }

    AnotherClass {
        id: anotherClass
        onMyCustomSignal1: (data) => { myTextArea.append(data + " custom signal 1") }
    }

    MyClass {
        id: myClassId
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
                    MyClass.mySlot("Called my slot")
                    MyClass.counter = MyClass.counter + 1
                }
            }

            Button {
                width: 100
                height: 25
                text: "Call function"
                onClicked: { MyClass.myFunction("Called my function") }
            }

            Button {
                width: 100
                height: 25
                text: "Change property"
                onClicked: {
                    MyClass.myMessage += "Changing propertyy"
                    anotherClass.myMessage += "Changing propertyyy"
                }
            }
        }

        Text {
            text: "Slot called: " + MyClass.counter + " times"
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
