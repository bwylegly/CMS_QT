import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Window 2.13

Window {
    id: main
    title: "cms"
    visible: true
    width: 659
    height: 503
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/views/SplashView.qml"
        clip: true
    }


    Component.onCompleted: {
        stackView.replace(loginView);
    }

    LoginView {
        id:loginView
        width: parent.width
        height: parent.height

        onUserLoginSuccessful: {
            stackView.replace("qrc:/views/UserView.qml", {width: parent.width, height: parent.height});
        }

        onAdminLoginSuccessful: {
            stackView.replace("qrc:/views/AdminView.qml", {width: parent.width, height: parent.height});
        }


        onLoginFailed: {
            console.log("Login failed")
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:200;anchors_x:"-21";anchors_y:13}
}
##^##*/
