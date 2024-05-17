import QtQuick 6.5
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    id: customButton
    height: 50
    width: 0
    color: "transparent"
    property int yRef: 0 // fix button running away if clicked many times quickly
    property string state1Text: "state 1"
    property string state2Text: "state 2"
    property string state3Text: "state 3"
    property string state4Text: "state 4"
    property color state1BGColor: "#07be8e"
    property color state2BGColor: "red"
    property color state3BGColor: "grey"
    property color state4BGColor: "blue"
    property color backgroundColor: "#07be8e"
    property string currentStateImagePath
    property string state1ImagePath: "" // example : "/resources/images/chest.png"
    property string state2ImagePath: ""
    property string state3ImagePath: ""
    property string state4ImagePath: ""
    property int step : 1
    property int totalStep : 4
    state: "state1"
    property int animationDelay: 150
    property int animationPositionOffset: 5
    // property AnotherClass _anotherClass // TODO : send signals to the class you want (controller)

    Component.onCompleted: {
        // workaround to enable animation after anchors.centerIn
        console.log("anchors.centerIn = " + anchors.centerIn);
        if (anchors.centerIn !== null)
        {
            x = anchors.centerIn.width / 2 - width / 2
            y = anchors.centerIn.height / 2 - height / 2
        }
        anchors.centerIn = undefined
        yRef = y

        if (customButton.width !== 0)   // use given size, else auto
            button.width = customButton.width;

        // Trigger animation even if there is only one state
        if (totalStep == 1)
        {
            state2Text = state1Text;
            state2BGColor = state1BGColor;
            state2ImagePath = state1ImagePath;
            totalStep = 2;
        }
    }

    Button {
        id: button
        text: qsTr("A custom button")
        font.pixelSize: 26
        font.family: "Arial"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        height: parent.height

        onClicked : {
            customButton.step++;
            if (customButton.step > customButton.totalStep)
                customButton.step = 1;
                // _anotherClass.myMessage += "Changing propertyyy" // TODO : send signals to the class you want (controller)
            if (customButton.step == 1)
                customButton.state = "state1";
            if (customButton.step == 2)
                customButton.state = "state2";
            if (customButton.step == 3)
                customButton.state = "state3";
        }

        background: Rectangle {
            id: colorRect
            radius: 8
            color: button.down ?  Qt.darker(customButton.backgroundColor, 0.7) : customButton.backgroundColor
            border.color: "black"
            border.width: 1
        }

        contentItem:
            RowLayout {
                id: row
                spacing: img.visible ? 10 : 0

                Row { // workaround to change image width and height
                    spacing: 0
                    Layout.alignment: Qt.AlignCenter
                    Image {
                        id: img
                        height: customButton.height*8/10 // workaround to fix label text not centered when image is big
                        width: customButton.currentStateImagePath === "" ? 0 : customButton.height/implicitHeight*implicitWidth
                        source: customButton.currentStateImagePath
                        fillMode: Image.PreserveAspectFit
                        visible: customButton.currentStateImagePath !== ""
                    }
                }

                Label {
                    id: lbl
                    text: button.text
                    horizontalAlignment: img.visible ? Text.AlignLeft : Text.AlignHCenter
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    visible: button.text !== ""
                }
            }
    }

    states: [
        State {
            name: "state1"
            PropertyChanges {
                target: button
                text: state1Text
            }
            PropertyChanges {
                target: customButton
                backgroundColor: customButton.state1BGColor
            }
            PropertyChanges {
                target: customButton
                currentStateImagePath: state1ImagePath
            }
        },
        State {
            name: "state2"
            PropertyChanges {
                target: button
                text: state2Text
            }
            PropertyChanges {
                target: customButton
                backgroundColor: customButton.state2BGColor
            }
            PropertyChanges {
                target: customButton
                currentStateImagePath: state2ImagePath
            }
        },
        State {
            name: "state3"
            PropertyChanges {
                target: button
                text: state3Text
            }
            PropertyChanges {
                target: customButton
                backgroundColor: customButton.state3BGColor
            }
            PropertyChanges {
                target: customButton
                currentStateImagePath: state3ImagePath
            }
        },
        State {
            name: "state4"
            PropertyChanges {
                target: button
                text: state4Text
            }
            PropertyChanges {
                target: customButton
                backgroundColor: customButton.state4BGColor
            }
            PropertyChanges {
                target: customButton
                currentStateImagePath: state4ImagePath
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"
            ParallelAnimation {
                SequentialAnimation {
                    // Property animation for color transition
                    PropertyAnimation {
                        target: customButton
                        property: "backgroundColor"
                        duration: customButton.animationDelay
                        to: "white"
                    }
                    PropertyAnimation {
                        target: customButton
                        property: "backgroundColor"
                        duration: customButton.animationDelay
                    }
                }
                SequentialAnimation {
                    // Property animation for button move
                    PropertyAnimation {
                        target: customButton
                        property: "y"
                        from: yRef
                        to: yRef + animationPositionOffset
                        duration: customButton.animationDelay
                    }
                    PropertyAnimation {
                        target: customButton
                        property: "y"
                        from: yRef + animationPositionOffset
                        to: yRef
                        duration: customButton.animationDelay
                    }
                }
            }
        }
    ]
}
