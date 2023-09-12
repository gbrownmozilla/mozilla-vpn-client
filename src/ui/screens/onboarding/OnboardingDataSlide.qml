/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.15
import QtQuick.Layouts 1.15

import Mozilla.Shared 1.0
import components 0.1

ColumnLayout {
    id: root

    signal nextClicked()

    spacing: 0

    MZHeadline {
        Layout.topMargin: MZTheme.theme.vSpacing
        Layout.leftMargin: MZTheme.theme.windowMargin * 2
        Layout.rightMargin: MZTheme.theme.windowMargin * 2
        Layout.fillWidth: true

        text: MZI18n.OnboardingDataSlideHeader
        horizontalAlignment: Text.AlignLeft
    }

    MZInterLabel {
        Layout.topMargin: 8
        Layout.leftMargin: MZTheme.theme.windowMargin * 2
        Layout.rightMargin: MZTheme.theme.windowMargin * 2
        Layout.fillWidth: true

        text: MZI18n.OnboardingDataSlideBody
        horizontalAlignment: Text.AlignLeft
        color: MZTheme.theme.fontColor
   }

    Item {
        Layout.minimumHeight: 24
        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    Image {
        Layout.alignment: Qt.AlignHCenter

        source: "qrc:/ui/resources/data-collection.svg"
    }

    Item {
        Layout.minimumHeight: 24
        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    MZCheckBoxRow {
        Layout.leftMargin: MZTheme.theme.windowMargin * 2
        Layout.rightMargin: MZTheme.theme.windowMargin * 2
        Layout.fillWidth: true

        subLabelText: MZI18n.OnboardingDataSlideCheckboxLabel
        leftMargin: 0
        isChecked: MZSettings.gleanEnabled
        showDivider: false
        onClicked: {
            MZSettings.gleanEnabled = !MZSettings.gleanEnabled
       }
    }

    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumHeight: 24
    }

    MZButton {
        Layout.leftMargin: MZTheme.theme.windowMargin * 2
        Layout.rightMargin: MZTheme.theme.windowMargin * 2
        Layout.fillWidth: true
        text: MZI18n.GlobalNext
        onClicked: root.nextClicked()
    }

    MZInterLabel {
        Layout.topMargin: 8
        Layout.leftMargin: MZTheme.theme.windowMargin * 2
        Layout.rightMargin: MZTheme.theme.windowMargin * 2
        Layout.fillWidth: true

        text: MZI18n.OnboardingDataSlideLearnMoreCaption
        color: MZTheme.theme.fontColor
   }

    MZLinkButton {
        Layout.topMargin: 8
        Layout.leftMargin: 32
        Layout.rightMargin: 32
        Layout.bottomMargin: 16
        Layout.fillWidth: true

        labelText: MZI18n.InAppSupportWorkflowPrivacyNoticeLinkText
        onClicked: MZUrlOpener.openUrlLabel("privacyNotice")
    }
}