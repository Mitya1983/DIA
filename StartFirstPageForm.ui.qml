import QtQuick 2.4
import QtQuick.Controls 2.4

Item {
    id: root
    Rectangle {
        anchors.fill: parent
        color: "#f4c067"
        Rectangle {
            id: header
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: startWindow.height / 10
            color: "#fad574"
            Text {
                text: qsTr("About this application")
                font.bold: true
                anchors.centerIn: parent
            }
        }
        ScrollView {
            anchors.fill: parent
            anchors.topMargin: header.height
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            clip: true
            Label {
                width: root.width
                height: contentHeight
                wrapMode: Text.WrapAnywhere
                font.pixelSize: 40
                text: qsTr("jdfhskdsdg sdjghskdg j dgkaskgda dgasjdgsd fdh f jdf d
           fhsdjfskfhf djskfsfj ksdjf sjkdf ksd sdjfks sfj sdkdjf ]
           sdlfkj d jdkslf dsjklf dsfsklfskdf jksldkfjldf kdlfsdkf
           dkf slfksfslkffaskf jskalfkaf sklafksf saklfksf sjkalsfj
           ksf;asfksas kdsla; ksla;lsf asfdl;asflksa klsa;flasla;s;")
            }
        }
    }    
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
