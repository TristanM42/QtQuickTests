import QtQuick
import QtQuick.Layouts

Row {
    spacing: 0
    property int evenSpacing

    onWidthChanged: {
        var totalChildrenWidth = 0;
        for (var i = 0; i < children.length; i++)
        {
            totalChildrenWidth += children[i].width;
            children[i].anchors.verticalCenter = verticalCenter;
        }
        evenSpacing = (width - totalChildrenWidth) / (root.children.length + 1);
        spacing = evenSpacing;
        leftPadding = evenSpacing
    }
}
