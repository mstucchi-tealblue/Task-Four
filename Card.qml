import QtQuick 2.5

Rectangle {
    id: card

    property Rectangle root
    property alias card_opacity: card_opacity
    property alias image: image
    property alias text_card: text_card
    property alias price_card: price
    property alias state_card: card.state
    property alias card_op: card.opacity

    width:200
    height:100
    color: "white"

    Image {
        id: image
        source: "images/cappuccino.png"
        anchors.centerIn: parent
    }

    Image {
        id:loading
        source: "images/red-circle.png"
        anchors {
            top: text_card.bottom
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

    Text {
        id: text_card
        color: "black"
        text:"Cappuccino"
        anchors{
            top: image.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }

    MouseArea {
        id: mouse_scheda
        anchors.fill:parent
        onClicked:
            switch(card.state) {
            case "": card.state = "dtapped"; break
            case "dtapped": card.state = ""; break
            }
        }


    //Behaviors
    Behavior on width {
        NumberAnimation { duration: 300 }
    }
    Behavior on height {
        NumberAnimation { duration: 300 }
    }

    Behavior on x {
        PropertyAnimation { duration: 300 }
    }

    Behavior on y {
        PropertyAnimation { duration: 300 }
    }

    //Animation
    OpacityAnimator on opacity {
        id:card_opacity
        target: card
        from: 1
        to: 0;
        duration: 500
        running:false
    }

    states: [
    State {
            name: "dtapped"
            PropertyChanges { target: price; text:"" }
            PropertyChanges { target: loading; visible:true }
            PropertyChanges { target: card; width:200 }
            PropertyChanges { target: card; height:300}
            PropertyChanges { target: card; x: root.width/2 - card.width/2; y: root.height/2 - card.height/2 }
        }
    ]
    state:""


}


