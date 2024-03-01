// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.Button {
        id: animatedButton
        text: "Change Color"
        width: 100
        height: 50
        x: 0
        y: 0

        property color initialColor: "pink"
        property color selectedColor: "red"
        property int animationDelay: 100

        contentItem: IconLabel {
            text: animatedButton.text
        }

        Timer {
           id: holdTimer
           interval: 100
           repeat: false

           onTriggered: {
               colorRect.color = Qt.darker(initialColor, 1.2);
           }
        }

        onPressed: {
            holdTimer.start()
        }

        onReleased: {
            holdTimer.stop()
            colorRect.color = initialColor // not working when cursor is outside of the button
        }

        onClicked: {
            colorAnimation.from = this.initialColor;
            colorAnimation.to = this.selectedColor;
            colorAnimationEnd.from = this.selectedColor;
            colorAnimationEnd.to = this.initialColor;
            buttonAnimation.target = this;
            buttonAnimation.from = 0;
            buttonAnimation.to = 5;
            buttonAnimationEnd.target = this;
            buttonAnimationEnd.from = 5;
            buttonAnimationEnd.to = 0;
            colorAnimation.start();
            buttonAnimation.start();
        }

        background: Rectangle {
            id: colorRect
            radius: 20
            color: animatedButton.initialColor

            // Property animation for color transition
            PropertyAnimation {
                id: colorAnimation
                target: colorRect
                property: "color"
                duration: animatedButton.animationDelay // milliseconds
                onStopped: colorAnimationEnd.start()
            }

            // Property animation for color transition
            PropertyAnimation {
                id: colorAnimationEnd
                target: colorRect
                property: "color"
                duration: animatedButton.animationDelay // milliseconds
            }
        }

        // Property animation for button move
        PropertyAnimation {
            id: buttonAnimation
            property: "y"
            duration: animatedButton.animationDelay // milliseconds
            onStopped: buttonAnimationEnd.start()
        }

        // Property animation for button move
        PropertyAnimation {
            id: buttonAnimationEnd
            property: "y"
            duration: animatedButton.animationDelay // milliseconds
        }
}
