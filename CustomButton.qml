import QtQuick 6.5
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    id: customButton
    
    // Public

    height: 50
    width: 0

    property var statesDict: {
        "dummyKey": "dummyValue"
    }
    property int initStep: 1
    property var enabledStatesMask: []
    property int pixelSize: 26
    property int fontWeight: Font.Normal
    property bool animationsEnabled: true
    property int animationDelay: 150
    property int animationPositionOffset: 5
    property bool imageSizeAuto: true
    property color borderColor: "black"
    property int borderWidth: 1
    property int padding: 0
    property bool disableDefaultPadding: false // if you need to fill button with image containing padding for example, or for small characters
    property var textAlignment: null
    property bool disabled: false
    
    // Private
    
    property int step : 1
    color: "transparent"
    property int yRef: 0 // fix button running away if clicked many times quickly    
    property color backgroundColor: "#07be8e"
    property color currentTextColor
    property string currentStateImagePath
    property string state1BText
    property color state1BTextColor
    property color state1BBGColor
    property string state1BImagePath
    property int totalStep
    property int enabledStatesCount: 0
    property bool tempAnimationsEnabled: false // must no be set modified manually
    property var myStates: []
    states: myStates
    property var intToObjState: {
        "dummyKey": "dummyValue"
    }
    property var enabledStates: []

    // Callbacks
    // property AnotherClass _anotherClass // TODO : send signals to the class you want (controller)
    signal customStateChanged(string newState);

    Component.onCompleted: {
        totalStep = Object.keys(statesDict).length;
    
        // Set state implicitly from given step
        for (var i=1; i<=totalStep; i++)
        {
            intToObjState[i] = "state" + i;
        }

        // Setup states from dict
        for (i=1; i<=totalStep; i++)
        {
            myStates.push(stateTemplateComponent.createObject(parent, {
                name: intToObjState[i],
                stateText: customButton.statesDict[intToObjState[i]]["stateText"] ?? null,
                stateBGColor: customButton.statesDict[intToObjState[i]]["stateBGColor"] ?? null,
                stateTextColor: customButton.statesDict[intToObjState[i]]["stateTextColor"]?? null,
                stateImagePath: customButton.statesDict[intToObjState[i]]["stateImagePath"] ?? null
            }))
            myStatesChanged();
        }
        customButton.state = intToObjState[initStep];
        
        // Set enabled states 
        var enabledStatesProvided = (enabledStatesMask.length != 0);
        enabledStates.push(undefined); // index 0 is not used but needed so that index is the same : "state1" and enabledStates[1]
        for (i=0; i<totalStep; i++)
        {
            if (!enabledStatesProvided)
                enabledStatesMask.push(1);
            enabledStates.push(enabledStatesMask[i] === 1);
            if (enabledStates[i+1]) enabledStatesCount++;
        }
        customButton.state = intToObjState[initStep];
        if (enabledStatesCount == 1) initStep = enabledStates.indexOf(true);

        // Trigger animation even if there is only one state
        if (totalStep == 1 || enabledStatesCount == 1)
        {
            myStates.push(stateTemplateComponent.createObject(parent, {
                name: "state1B",
                stateText: customButton.statesDict[intToObjState[initStep]]["stateText"] ?? null,
                stateBGColor: customButton.statesDict[intToObjState[initStep]]["stateBGColor"] ?? null,
                stateTextColor: customButton.statesDict[intToObjState[initStep]]["stateTextColor"] ?? null,
                stateImagePath: customButton.statesDict[intToObjState[initStep]]["stateImagePath"] ?? null
            }))
            myStatesChanged();
            customButton.state = intToObjState[initStep]; // warning, must be done because state changes "" after myStatesChanged
        }
        tempAnimationsEnabled = true;
        step = initStep;

        if (customButton.width !== 0)   // use given size, else auto
            button.width = customButton.width;


        if (disableDefaultPadding)
        {
            button.leftPadding = 0;
            button.rightPadding = 0;
            button.topPadding = 0;
            button.bottomPadding = 0;
        }
    }

    Button {
        id: button
        text: qsTr("A custom button")
        font.pixelSize: parent.pixelSize
        font.family: "Arial"
        font.weight: parent.fontWeight
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        height: parent.height

        onClicked : {
            if (disabled) return;
            
            // workaround to enable animation after anchors.centerIn
            if (customButton.anchors.centerIn !== null)
            {
                customButton.x = customButton.parent.width / 2 - customButton.width / 2
                customButton.y = customButton.parent.height / 2 - customButton.height / 2
                if (customButton.yRef == 0) customButton.yRef = customButton.y;
                customButton.anchors.centerIn = undefined;
            }
        
            customButton.step++;
            if (customButton.step > customButton.totalStep)
                customButton.step = 1;
            if (customButton.enabledStatesCount == 1)
            {
                customButton.state = (customButton.state === "state1B") ?
                        customButton.intToObjState[customButton.initStep]
                    :
                        "state1B";
            }
            else
            {
                for (var i=1; i<=4; i++)
                {
                    if (customButton.step == i)
                    {
                        if (enabledStates[i])
                        {
                            customButton.state = intToObjState[i];
                            break;
                        }
                        else
                        {
                            customButton.step++;
                            i = 0; // warning, i++ also called after this loop so 0 instead of 1
                            if (customButton.step > customButton.totalStep) {customButton.step = 1;}
                        }
                    }
                }
            }
            customStateChanged(customButton.state);
        }

        background: Rectangle {
            id: colorRect
            radius: 8
            color: (button.down && !customButton.disabled) ?  Qt.darker(customButton.backgroundColor, 0.7) : customButton.backgroundColor
            border.color:  customButton.borderColor
            border.width: customButton.borderWidth
        }

        contentItem:
            RowLayout {
                id: row
                spacing: img.visible ? 10 : 0

                Item {
                    width: customButton.padding
                    visible: padding !==0
                }

                Row { // workaround to change image width and height
                    spacing: 0
                    Layout.alignment: Qt.AlignCenter
                    //Layout.fillWidth: true
                    Image {
                        id: img
                        height: imageSizeAuto ? customButton.height*8/10 : implicitHeight // workaround to fix label text not centered when image is big
                        width: customButton.currentStateImagePath === "" ? 0 : imageSizeAuto ? customButton.height/implicitHeight*implicitWidth : implicitWidth
                        source: customButton.currentStateImagePath
                        fillMode: Image.PreserveAspectFit
                        visible: customButton.currentStateImagePath !== ""
                    }
                }

                Label {
                    id: lbl
                    text: button.text
                    font.pixelSize: customButton.pixelSize
                    color: (button.down && !customButton.disabled) ?  Qt.darker(customButton.currentTextColor, 0.7) : customButton.currentTextColor
                    horizontalAlignment: customButton.textAlignment === null ?
                                                img.visible ?
                                                    Text.AlignLeft
                                                :
                                                    Text.AlignHCenter
                                            :
                                                customButton.textAlignment
                    Layout.alignment: Qt.AlignCenter
                    //Layout.fillWidth: true
                    visible: button.text !== ""
                }

                Item {
                    width: customButton.padding
                    visible: padding !==0
                }
            }
    }
    
    Component {
        id: stateTemplateComponent
        State {
            id: stateTemplateID
            name: "stateName"
            property string stateText
            property color stateBGColor
            property color stateTextColor
            property string stateImagePath
            PropertyChanges {
                target: button
                text: stateTemplateID.stateText
            }
            PropertyChanges {
                target: customButton
                backgroundColor: stateTemplateID.stateBGColor
            }
            PropertyChanges {
                target: customButton
                currentTextColor: stateTemplateID.stateTextColor
            }
            PropertyChanges {
                target: customButton
                currentStateImagePath: stateTemplateID.stateImagePath
            }
        }
    }

    transitions: [
        Transition {
            enabled: tempAnimationsEnabled && animationsEnabled
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
