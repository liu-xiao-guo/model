import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "model.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("model")

        ListView {
            id: listview
            clip: true
            width: parent.width
            height: parent.height - button.height

            model: myModel
            delegate: Item {
                id: delegate
                width: listview.width
                height: units.gu(20)
                Row {
                    spacing: units.gu(2)
                    Image {
                        source: "images/" + type
                        height: delegate.height *.9
                        width: height
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: size
                        font.pixelSize: units.gu(5)
                        color: "red"
                    }
                }

                Image  {
                    width: units.gu(4)
                    height: width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: units.gu(1)
                    source: "images/remove.png"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            myModel.remove(index);
                        }
                    }
                }
            }
        }

        Button {
            id: button
            anchors.bottom: parent.bottom
            anchors.bottomMargin: units.gu(2)
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Add a bear"
            onClicked: {
                // We are going to add a bear to the list

                var o = {
                    "type" : "polarbear.jpg",
                    "size" :  "large"
                };

                myModel.append( o );
                listview.positionViewAtEnd()
            }
        }
    }
}

