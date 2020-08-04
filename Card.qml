import QtQuick 2.15

Rectangle {
    id: scheda

    property Rectangle root
    property alias card_opacity: card_opacity
    property alias image: image
    property alias text_card: text_card
    property alias price_card: price

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
        onDoubleClicked: {
            scheda.width = 200;
            scheda.height = 300;
            scheda.x = root.width/2 - height
            scheda.y = root.height/2 - width
            price.text = " "
            loading.visible = true
        }
    }

    //Behaviors
    Behavior on width {
        NumberAnimation { duration: 500 }
    }
    Behavior on height {
        NumberAnimation { duration: 500 }
    }

    Behavior on x {
        PropertyAnimation { duration: 500 }
    }

    Behavior on y {
        PropertyAnimation { duration: 500 }
    }

    //Animation
    OpacityAnimator on opacity {
        id:card_opacity
        target: scheda
        from: 1
        to: 0;
        duration: 500
        running:false
    }


}



