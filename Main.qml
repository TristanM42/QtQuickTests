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

            states: State {
                name: "rotated"
                PropertyChanges { target: redRect; rotation: 0 }
            }

            transitions: Transition {
                RotationAnimation {
                    loops: Animation.alwaysRunToEnd
                    from: 0
                    to: -360
                    duration: 1000
                }
            }
        }

        Rectangle {
            id: blueRect
            x: redRect.width
            width: 50; height: 50
            color: "blue"

            states: State {
                name: "reparented"
                ParentChange { target: blueRect; parent: redRect; x: 0; y: 0 }
            }

            transitions: Transition {
                ParentAnimation {
                    NumberAnimation { properties: "x,y"; duration: 500 }
                }
            }

            MouseArea { anchors.fill: parent; onClicked: {
                    if (step==1)
                        blueRect.state = "reparented";
                    if (step==2)
                        redRect.state = "rotated"; //console.log('test');
                    step++;
                }
            }
        }
    }
}
