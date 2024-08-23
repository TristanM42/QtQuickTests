import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("QtQuick Controls - QtQuickTests")
    color: "blue"
    
    ScrollView {
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Item {
            implicitWidth: 1920
            implicitHeight: 1080*2
        }
    }
}
