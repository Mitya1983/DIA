import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4



/*TODO:
Implement calendar
Write down property aliases
*/
Item {
    id: root
    property alias boy: boy
    property alias boyText: boyText
    property alias boyButton: boyButton
    property alias girl: girl
    property alias girlText: girlText
    property alias girlButton: girlButton
    property alias monthPicker: monthpicker
    property alias mouseMonthPicker: mousemonthpicker
    property alias datePicker: datepicker
    property alias mouseDatePicker: mousedatepicker
    property alias yearPicker: yearpicker
    property alias mouseYearPicker: mouseyearpicker

    //    width: 400
    //    height: 400
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
                text: qsTr("Let us meet each other")
                font.bold: true
                anchors.centerIn: parent
            }
        }
        Flickable {
            anchors {
                top: header.bottom
                right: parent.right
                left: parent.left
                bottom: parent.bottom
            }
            Rectangle {
                id: whatIsYourName
                anchors {
                    top: parent.top
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                Text {
                    text: qsTr("What is you Name?")
                    font.italic: true
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: name
                anchors {
                    top: whatIsYourName.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                border.width: 4
                border.color: "#25190d"
                radius: 3
                TextInput {
                    id: nameInput
                    anchors.fill: parent
                    anchors.margins: 2
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    font.pointSize: parent.height / 2
                    KeyNavigation.tab: surnameInput
                }
            }
            Rectangle {
                id: whatIsYourSurname
                anchors {
                    top: name.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                Text {
                    text: qsTr("What is you Surname?")
                    font.italic: true
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: surname
                anchors {
                    top: whatIsYourSurname.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                border.width: 4
                border.color: "#25190d"
                radius: 3
                TextInput {
                    id: surnameInput
                    anchors.fill: parent
                    anchors.margins: 2
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    font.pointSize: parent.height / 2
                }
            }
            Rectangle {
                id: gender
                anchors {
                    top: surname.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                Text {
                    text: qsTr("Are you a Girl or a Boy?")
                    font.italic: true
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: genderButtons
                anchors {
                    top: gender.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                Rectangle {
                    id: boy
                    anchors.fill: parent
                    anchors.rightMargin: parent.width / 2
                    color: buttonColor
                    border.width: 4
                    border.color: "#25190d"
                    radius: 3
                    Text {
                        id: boyText
                        text: "I'm a Boy"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        id: boyButton
                        anchors.fill: parent
                    }
                }
                Rectangle {
                    id: girl
                    anchors.fill: parent
                    anchors.leftMargin: parent.width / 2
                    color: buttonColor
                    border.width: 4
                    border.color: "#25190d"
                    radius: 3
                    Text {
                        id: girlText
                        text: "I'm a Girl"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        id: girlButton
                        anchors.fill: parent
                    }
                }
            }
            Rectangle {
                id: whenisyourbirthday
                anchors {
                    top: genderButtons.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                Text {
                    text: qsTr("When is your birthday?")
                    font.italic: true
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: birthdate
                anchors {
                    top: whenisyourbirthday.bottom
                    right: parent.right
                    left: parent.left
                }
                height: startWindow.height / 10
                color: "#00000000"
                border.width: 4
                border.color: "#25190d"
                radius: 3
                Rectangle {
                    id: date
                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                    }
                    width: (parent.width / 9) * 2
                    height: parent.height
                    color: "#00000000"
                    border.width: 2
                    border.color: "#25190d"
                    MouseArea {
                        id: mousedatepicker
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                    ListView {
                        id: datepicker
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        focus: true
                        snapMode: ListView.SnapToItem
                        model: ListModel {
                        }
                        delegate: Rectangle {
                            width: date.width - 10
                            height: date.height - 10
                            color: "#00000000"
                            Text {
                                anchors.fill: parent
                                text: dates
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
                Rectangle {
                    id: month
                    anchors {
                        bottom: parent.bottom
                        left: date.right
                    }
                    width: (parent.width / 9) * 3
                    height: parent.height
                    color: "#00000000"
                    border.width: 2
                    border.color: "#25190d"
                    MouseArea {
                        id: mousemonthpicker
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                    ListView {
                        id: monthpicker
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        focus: true
                        snapMode: ListView.SnapToItem
                        model: ListModel {
                        }

                        delegate: Rectangle {
                            width: month.width - 10
                            height: month.height - 10
                            color: "#00000000"
                            Text {
                                anchors.fill: parent
                                text: months
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
                Rectangle {
                    id: year
                    anchors {
                        bottom: parent.bottom
                        left: month.right
                    }
                    width: (parent.width / 9) * 4
                    height: parent.height
                    color: "#00000000"
                    border.width: 2
                    border.color: "#25190d"
                    MouseArea {
                        id: mouseyearpicker
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                    ListView {
                        id: yearpicker
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        focus: true
                        snapMode: ListView.SnapToItem
                        model: ListModel {
                        }

                        delegate: Rectangle {
                            width: year.width - 10
                            height: year.height - 10
                            color: "#00000000"
                            Text {
                                anchors.fill: parent
                                text: years
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }

                //                Text {
                //                    text: qsTr("Set up the date please")
                //                    anchors.centerIn: parent
                //                }
                //                MouseArea {
                //                    anchors.fill: parent
                //                }
            }
        }
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
