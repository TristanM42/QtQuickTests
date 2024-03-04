import QtQuick
import QtQuick.Controls.Basic
import QtQuickTests 1.0

Window {
    id:rootItem
    width: 640
    height: 480
    visible: true
    title: qsTr("QML and C++ integration")

    property MyClass _myClass
    property AnotherClass _anotherClass
    property list<QtObject> _personList

    Connections {
        target: _myClass
        onMySignall: (data) => { myTextArea.append(data) }
        onCounterChanged: console.log("Counter property changed")
        onMyCustomSignal1: (data) => { myTextArea.append(data + " custom signal 1") }
        onMyCustomSignal2: (data) => { myTextArea.append(data + " custom signal 2") }
    }

    Connections {
        target: _anotherClass
        onMyCustomSignal1: (data) => { myTextArea.append(data + " custom signal 1") }
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
                    _myClass.mySlot("Called my slot")
                    _myClass.counter = _myClass.counter + 1
                    _anotherClass.mySlot("Called my slot")
                }
            }

            Button {
                width: 100
                height: 25
                text: "Call function"
                onClicked: {
                    _myClass.myFunction("Called my function")
                    console.log("Length of the list : ", _personList.length);
                }
            }

            Button {
                width: 100
                height: 25
                text: "Change property"
                onClicked: {
                    _myClass.myMessage += "Changing propertyy"
                    _anotherClass.myMessage += "Changing propertyyy"
                }
            }
        }

        Text {
            text: "Slot called: " + _myClass.counter + " times"
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
