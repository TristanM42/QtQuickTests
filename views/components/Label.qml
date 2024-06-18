// Copyright (C) 2024 eMyoSound
// All Rights Reserved

import QtQuick 6.5
import QtQuick.Controls.Basic

Item {
    id: root
    anchors.fill: parent

    property string defaultText: "Label"
    property int defaultFontSize: 14
    property int defaultPadding: 0
    property bool isBold: false
    property bool isCentered: false
    property bool isLeftAligned: true
    property bool isRightAligned: false
    property int defaultWrapMode: Text.Wrap

    Rectangle {
        width: root.width - (2 * root.defaultPadding)
        height: root.height - (2 * root.defaultPadding) - (root.defaultFontSize / 2)
        y: root.defaultFontSize / 2
        color: "transparent"

        Text {
            width: parent.width
            text: qsTr(root.defaultText)
            color: "cyan"

            anchors.centerIn: parent
            horizontalAlignment: isLeftAligned ? Text.AlignLeft : (isRightAligned ? Text.AlignRight : Text.AlignHCenter)

            wrapMode: root.defaultWrapMode

            font.pixelSize: root.defaultFontSize
            font.family: "Arial"
            font.weight: (root.isBold) ? Font.Bold : Font.DemiBold
        }
    }

}
