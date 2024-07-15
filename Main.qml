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
        interval: 10 // Triggers every 10 milliseconds = 100 FPS expected
        running: true // Start the timer
        repeat: true // Repeats the trigger
        property int count: 0
        onTriggered: {
            //count++;
            //console.log("timer update : " + count);
            myPlot.update();
        }
    }
}
