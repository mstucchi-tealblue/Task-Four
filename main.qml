import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id:root
        anchors.fill: parent

        Image {
            id: background
            source: "images/background.png"
            anchors.fill:parent
        }

        Card {
            id: card1
            root:root
            x:150
            y:150
            image.source: "images/espresso.png"
            text_card.text: qsTr("Espresso")
            price_card.text: "1.00$"
            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true
                onClicked:
                    switch(card1.state_card) {
                    case "":
                        card2.card_opacity_anim.running = true
                        mouse.accepted = false
                        break
                    case "dtapped":
                        card1.state=""
                        card2.card_opacity = 1
                        card2.state=""
                        break
                    }
            }
        }

        Card {
            id: card2
            root:root
            x: 360
            y: 150
            image.source: "images/cappuccino.png"
            text_card.text: qsTr("Cappuccino")
            price_card.text: "3.50$"
            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true
                onClicked:
                    switch(card2.state_card) {
                    case "":
                        card1.card_opacity_anim.running = true
                        mouse.accepted = false
                        break
                    case "dtapped":
                        card2.state=""
                        card1.card_opacity = 1
                        card2.state=""
                        break
                    }

            }
        }

    }
}
