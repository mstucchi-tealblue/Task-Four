import QtQuick 2.5


Rectangle {
    id: card
    width:200
    height:100
    color: "white"
    property Rectangle root
    property alias card_image: image
    property alias card_text: card_text
    property alias card_price: price
    property alias card_state: card.state
    property alias card_mouse: card_mouse

    Image {
        id: image
        source: "images/cappuccino.png"
        anchors.centerIn: parent
    }

    Text {
        id: card_text
        color: "black"
        text:"Cappuccino"
        anchors{
            top: image.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }

    Image {
        id:loading
        source: "images/red-circle.png"
        anchors {
            top: card_text.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        visible: false
    }

    Text {
        id: price
        color: "black"
        text:"1.00$"
        anchors {
            top:parent.top
            topMargin: 5
            left:parent.left
            leftMargin: 5
        }
    }

    states: [
        State {
            name: "popped"
            PropertyChanges {
                target: card
                width:200
                height:300
                x: root.width/2 - card.width/2;
                y: root.height/2 - card.height/2
            }
            PropertyChanges{target: price; text:""}
            PropertyChanges {target: loading; visible:true }
        }
    ]
    state:""

    transitions: [
        Transition {
            from:""
            to:"popped"
            PropertyAnimation{
                target: card
                properties: "width,height,x,y"
                duration: 500
            }
        }
    ]

    MouseArea {
        id: card_mouse
        anchors.fill:parent
        onClicked:
            switch(card.state) {
            case "": card.state = "popped"; break
            case "popped": card.state = ""; break
            }
    }

}
