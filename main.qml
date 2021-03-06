import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id:root
        anchors.fill: parent

        states: [
            State {
                name: "single1"
                when: card1.card_state == "popped"
                PropertyChanges {
                    target: card2
                    opacity: 0
                    card_mouse.enabled: false
                }
            },
            State{
                name: "single2"
                when: card2.card_state == "popped"
                PropertyChanges {
                    target: card1
                    opacity: 0
                    card_mouse.enabled: false
                }
            }
        ]
        state: ""

        transitions: [
            Transition {
                from: ""
                to: "single1"
                reversible: true
                PropertyAnimation{
                    target: card2
                    property: "opacity"
                    duration: 500
                }
            },
            Transition {
                from: ""
                to: "single2"
                reversible: true
                PropertyAnimation{
                    target: card1
                    property: "opacity"
                    duration: 500
                }
            }
        ]

        Image {
            id: background
            source: "images/background.png"
            anchors.fill:parent
        }

        Card {
            id: card1
            root:root
            x:100
            y:190
            card_image.source: "images/espresso.png"
            card_text.text: qsTr("Espresso")
            card_price.text: "1.00$"
        }

        Card {
            id: card2
            root:root
            x: 320
            y: 190
            card_image.source: "images/cappuccino.png"
            card_text.text: qsTr("Cappuccino")
            card_price.text: "3.50$"
        }
    }

}
