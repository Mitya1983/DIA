import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4


Window {
    property color buttonColor: "#db9035"
    property color buttonActiveColor: "#5d310e"
    property color buttonPressedColor: "#25190d"
    property color textPressedColor: "#f4c067"
    property int stackWidth: startStack.width
    property int stackHeight: startStack.height
    
    id: startWindow
    visible: true
    width: 375 
    height: 667
    title: qsTr("DIA Hello")
    StackView{
        id: startStack
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: footer.top
        }
        initialItem: firstPage
        Component{
            id: firstPage
            StartFirstPageForm{
                
            }
        }
        Component{
            id: secondPage
            UserDataPage1Form{
                Component.onCompleted: {
                    var currentDate = new Date()
                    monthPicker.model.append({months: qsTr("Jan")})
                    monthPicker.model.append({months: qsTr("Feb")})
                    monthPicker.model.append({months: qsTr("Mar")})
                    monthPicker.model.append({months: qsTr("Apr")})
                    monthPicker.model.append({months: qsTr("May")})
                    monthPicker.model.append({months: qsTr("Jun")})
                    monthPicker.model.append({months: qsTr("Jal")})
                    monthPicker.model.append({months: qsTr("Aug")})
                    monthPicker.model.append({months: qsTr("Sep")})
                    monthPicker.model.append({months: qsTr("Oct")})
                    monthPicker.model.append({months: qsTr("Nov")})
                    monthPicker.model.append({months: qsTr("Dec")})
                    monthPicker.positionViewAtIndex(currentDate.getMonth(), ListView.End)
                    for (var i = 1900; i <= currentDate.getFullYear(); i++)
                    {
                        yearPicker.model.append({years: i})
                    }
                    yearPicker.positionViewAtEnd();
                    var currentMonths = currentDate.getMonth()
                    if (currentMonths === 0 || currentMonths === 2 || currentMonths === 4 || currentMonths === 6 || 
                            currentMonths === 7 || currentMonths === 9 ||currentMonths === 11)
                    {
                        for (i = 1; i <= 31; i++)
                        {
                            datePicker.model.append({dates: i})
                        }
                    }
                    else if (currentMonths === 3 || currentMonths === 5 || currentMonths === 8 || currentMonths === 10 )
                    {
                        for (i = 1; i <= 30; i++)
                        {
                            datePicker.model.append({dates: i})
                        }
                    }
                    else if (currentMonths === 1 && ((currentDate.getFullYear() % 4 === 0 || currentDate.getFullYear() % 400 === 0) && 
                             currentDate.getFullYear() % 400 !== 0))
                        for (i = 1; i <= 28; i++)
                        {
                            datePicker.model.append({dates: i})
                        }
                    else
                        for (i = 1; i <= 29; i++)
                        {
                            datePicker.model.append({dates: i})
                        }
                    datePicker.positionViewAtIndex(currentDate.getDate() - 1, ListView.End)
                }
                
                boyButton.onClicked: {
                    boy.color = buttonPressedColor
                    boyText.color = textPressedColor
                    girl.color = buttonColor
                    girlText.color = "black"
                }
                girlButton.onClicked: {
                    girl.color = buttonPressedColor
                    girlText.color = textPressedColor
                    boy.color = buttonColor
                    boyText.color = "black"
                }
               
            }
        }        
    }    
    Rectangle{
        id: footer
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        anchors.margins: 0
        color: "#fad574"
        height: parent.height / 10 
        Rectangle{
            id: nextButton
            anchors.fill: parent
            anchors.leftMargin: parent.width / 2
            color: buttonColor
            Text{
                anchors.centerIn: parent
                text: qsTr("Next")
                font.bold: true
            }
            MouseArea{
                id: nextMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = buttonActiveColor
                }
                onExited: parent.color = buttonColor
                onClicked: {
                    
                    switch(startStack.depth)
                    {
                    case 1: 
                        startStack.push(secondPage)
                        previousButton.visible = true
                    }              
                }
            }
        }
        Rectangle{
            id: previousButton
            anchors.fill: parent
            anchors.rightMargin: parent.width / 2
            color: buttonColor
            visible: false
            Text{
                anchors.centerIn: parent
                text: qsTr("Back")
                font.bold: true
            }
            MouseArea{
                id: previousMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = buttonActiveColor
                onExited: parent.color = buttonColor
                onClicked: {
                    startStack.pop()
                    if (startStack.depth === 1)
                        previousButton.visible = false
                }
            }
        }
    }
}

