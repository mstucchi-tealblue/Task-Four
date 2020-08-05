import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id:root
        anchors.fill: parent
        state: {card1.card_state === "popped" || card2.card_state === "popped" ? "single" : ""  }

        states: State {
            name: "single"
            PropertyChanges {
                target: card1
                opacity: card2.card_state==="popped" ? 0 : 1
                //card_state: card2.card_state==="popped" ? "hidden":""
                card_mouse.enabled: card2.card_state==="popped" ? false : true
            }
            PropertyChanges {
                target: card2
                opacity: card1.card_state==="popped" ? 0 : 1
                //card_state: card1.card_state==="popped" ? "hidden":""
                card_mouse.enabled: card1.card_state==="popped" ? false : true
            }
        }



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
            card_image.source: "images/espresso.png"
            card_text.text: qsTr("Espresso")
            card_price.text: "1.00$"

        }

        Card {
            id: card2
            root:root
            x: 360
            y: 150
            card_image.source: "images/cappuccino.png"
            card_text.text: qsTr("Cappuccino")
            card_price.text: "3.50$"

        }
    }

}
