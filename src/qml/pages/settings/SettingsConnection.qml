// Copyright (c) 2022 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../controls"
import "../../components"

Item {
    property alias navRightDetail: connectionSwipe.navRightDetail
    property alias navLeftDetail: connectionSwipe.navLeftDetail
    SwipeView {
        id: connectionSwipe
        property alias navRightDetail: connection_settings.navRightDetail
        property alias navLeftDetail: connection_settings.navLeftDetail
        anchors.fill: parent
        interactive: false
        orientation: Qt.Horizontal
        InformationPage {
            id: connection_settings
            background: null
            clip: true
            bannerActive: false
            bold: true
            headerText: qsTr("Connection settings")
            headerMargin: 0
            detailActive: true
            detailItem: ConnectionSettings {}
        }
        SettingsProxy {
            navLeftDetail: NavButton {
                iconSource: "image://images/caret-left"
                text: qsTr("Back")
                onClicked: {
                    connectionSwipe.decrementCurrentIndex()
                }
            }
            navMiddleDetail: Header {
                headerBold: true
                headerSize: 18
                header: qsTr("Proxy Settings")
            }
        }
    }
}
