/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14

import Mozilla.VPN 1.0
import themes 0.1

RowLayout {
    id: checkBoxRow

    property var labelText
    property var subLabelText: ""
    property bool isChecked
    property bool isEnabled: true
    property bool showDivider: true
    property var leftMargin: 18
    property bool showAppImage: false

    signal clicked()

    spacing: Theme.windowMargin

    VPNCheckBox {
        id: checkBox
        onClicked: checkBoxRow.clicked()
        checked: isChecked
        enabled: isEnabled
        opacity: isEnabled ? 1 : 0.5
        Component.onCompleted: {
            if (!showAppImage) {
                Layout.leftMargin = leftMargin
            }
        }
    }

    Rectangle {
        visible: showAppImage
        width: Theme.windowMargin * 2
        height: Theme.windowMargin * 2
        color: "transparent"
        radius: 4
        Layout.alignment: Qt.AlignTop

        Image {
            sourceSize.width: Theme.windowMargin * 2
            sourceSize.height: Theme.windowMargin * 2
            anchors.centerIn: parent
            asynchronous: true
            fillMode:  Image.PreserveAspectFit
            Component.onCompleted: {
                if (showAppImage && appID !== "") {
                    source = "image://app/"+appID
                }
            }
        }
    }

    ColumnLayout {
        id: labelWrapper

        Layout.fillWidth: true
        Layout.topMargin: 2
        spacing: 4
        Layout.alignment: Qt.AlignTop

        VPNInterLabel {
            id: label
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true
            text: labelText
            color: Theme.fontColorDark
            horizontalAlignment: Text.AlignLeft
        }

        VPNTextBlock {
            id: subLabel

            Layout.fillWidth: true
            text: subLabelText
            visible: !!subLabelText.length
            wrapMode: showAppImage ? Text.WrapAtWordBoundaryOrAnywhere : Text.WordWrap
        }

        Rectangle {
            id: divider

            Layout.topMargin: Theme.windowMargin
            Layout.preferredHeight: 1
            Layout.fillWidth: true
            color: "#E7E7E7"
            visible: showDivider
        }

    }

}
