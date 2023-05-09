// Copyright (c) 2023 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import org.bitcoincore.qt 1.0
import "../../controls"

Page {
    background: null
    
    signal hidePopup()

    Rectangle {
        id: border_rect
        anchors.fill: rootColumn
        color: "transparent"
        radius: 10 
        border.color: "transparent"
        border.width: 2
    }
    ColumnLayout {
        id: rootColumn
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        ColumnLayout{
            Layout.alignment: Qt.AlignCenter
            spacing: 10
            Button {
                Layout.alignment: Qt.AlignCenter
                Layout.bottomMargin: 20
                background: null
                icon.source: "image://images/info"
                icon.color: Theme.color.neutral9
                icon.width: 60
                icon.height: 60
            }
            Header {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                header: qsTr("Something is not right")
                headerBold: true
                description: nodeModel.alert
                descriptionColor: Theme.color.neutral7
            }
        }
        ContinueButton {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.topMargin: 20
            Layout.bottomMargin: 40
            text: "Done"
            onClicked: hidePopup()
        }
    }
    state: AppMode.state

    states: [
        State {
            name: "MOBILE"
        },
        State {
            name: "DESKTOP"
            PropertyChanges {
              target: rootColumn
              height: undefined
              width: undefined
            }
            PropertyChanges {
              target: border_rect
              border.color: Theme.color.neutral5
            }
        }
    ]
}
