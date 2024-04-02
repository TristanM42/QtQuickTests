import QtQuick
import ems 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Plot {
        id: myPlot
        anchors.fill: parent
    }

    Timer {
        interval: 100 // Triggers every 100 milliseconds
        running: true // Start the timer
        repeat: true // Repeats the trigger
        onTriggered: {
            myPlot.update();
        }
    }
}
