import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0

Rectangle {
    width: 250
    height: 250
    color: "#FFFFFF"
    border.color: "#3498db"
    border.width: 5
    Rectangle {
        x: 75
        y: 135
        width: 100
        height: 25
        color: "#FFFFFF"
        Text {

             font.pixelSize:15
             text: "Speed"
             color: "#17202a"
             antialiasing: true
             anchors.verticalCenter: parent.verticalCenter  
               anchors.horizontalCenter: parent.horizontalCenter   
             }
        }
   Rectangle {
        x: 100
        y: 160
        width: 50
        height: 25
        color: "#FFFFFF"
        Text {

             font.pixelSize:15
             text: "KM/H"
             color: "#17202a"
             antialiasing: true
             anchors.verticalCenter: parent.verticalCenter  
               anchors.horizontalCenter: parent.horizontalCenter   
             }
        }
    CircularGauge {
        id: cg
        objectName: "speed_gauge"
        property real speed_value: 400.0
        anchors.centerIn: parent
        value: speed_value
        maximumValue: 400.0  // Largest Value
        minimumValue: 0.0       // Smallest Value
        Rectangle {
          x: 80
          y: 170
          width: 50
          height: 25
          color: "#FFFFFF"
          border.color: "#2471a3"
          border.width: 2
          Text {

               font.pixelSize:15
               text: cg.value
               color: "#17202a"
               antialiasing: true
               anchors.verticalCenter: parent.verticalCenter  
               anchors.horizontalCenter: parent.horizontalCenter               
               }
          }
        style: CircularGaugeStyle {
            id: style
            tickmarkStepSize: 20.0 // Tick Marks

            tickmark: Rectangle {
                visible: styleData.value < 400 || styleData.value % 20 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 400 ? "#fdedec" : "#78281f"
            }

           minorTickmark: Rectangle {
                visible: styleData.value < 400
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.03
                color: "#ff0000"
           }

           tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: styleData.value >= 8000 ? "#17202a" : "#17202a"
                antialiasing: true
           }

           needle: Rectangle {
               y: outerRadius * 0.15
               implicitWidth: outerRadius * 0.03
               implicitHeight: outerRadius * 1.1
               antialiasing: true
               color: "#DE3163"
          }

          foreground: Item {
               Rectangle {
                    width: outerRadius * 0.2
                    height: width
                    radius: width / 2
                    color: "#1c2833"
                    anchors.centerIn: parent
               }
          }
     }
}
}