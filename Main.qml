import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import EMS 1.0

Window {
    id: mainWindow
//Rectangle {
    width: 500
    height: 200
    visible: true

    property Dialog _mainDialog
    property int step : 1

    Item {
        width: 200; height: 100

        Rectangle {
            id: redRect
            width: 100; height: 100
            color: "red"

            states: [
                State {
                    name: ""
                    PropertyChanges { target: redRect; rotation: 0 }
                },
                State {
                    name: "rotated"
                    PropertyChanges { target: redRect; rotation: -360 }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "rotated"
                    RotationAnimation {
                        id: rotAnim
                        from: 0
                        to: -360
                        duration: 1000
                    }
                }
            ]
        }

        Rectangle {
            id: blueRect
            x: redRect.width
            width: 50; height: 50
            color: "blue"

            states: [
                State {
                    name: ""
                    PropertyChanges { target: blueRect; x: redRect.width }
                },
                State {
                    name: "reparented"
                    ParentChange { target: blueRect; parent: redRect; x: 0; y: 0 }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "reparented"
                    ParentAnimation {
                        NumberAnimation { properties: "x,y"; duration: 500 }
                    }
                }
            ]

            MouseArea { anchors.fill: parent; onClicked: {
                    if (step==1)
                    {
                        // Reset properties to allow multiple loops
                        redRect.state = "";
                        blueRect.state = "";

                        blueRect.state = "reparented";
                    }
                    if (step==2)
                    {
                        redRect.state = "rotated";
                        step = 0
                    }
                    step++;
                }
            }
        }
    }
}
