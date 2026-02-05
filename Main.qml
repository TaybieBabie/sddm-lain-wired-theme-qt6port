import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtMultimedia
import SddmComponents 2.0

Rectangle {
	color: "black"
	width: Window.width
	height: Window.height

	Connections {
		target: sddm

		onLoginSucceeded: {
		}

		onLoginFailed: {
			denied.play()
		}
	}

	AnimatedImage {
		width: parent.width
		height: parent.height
		fillMode: Image.Tile
		source: "bgN5.gif"
	}

	ColumnLayout {
		width: parent.width
		height: parent.height
		spacing: 0
		AnimatedImage{
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 2
			width: 192
			height: 192
			source: "WiredLogIn.gif"
		}
		AnimatedImage{
			Layout.alignment: Qt.AlignCenter
			Layout.bottomMargin: 20
			height: 50
			source: "whoIsUser.gif"
		}
		Text {
			Layout.alignment: Qt.AlignCenter
			text: "Ｕｓｅｒ ＩD:"
			color: "#c1b492"
			font.pixelSize: 16
		}
		Rectangle {
			Layout.alignment: Qt.AlignCenter
			implicitWidth: 200
			implicitHeight: 34
			color: "#000"
			border.color: "#d2738a"
			border.width: 1

			TextInput {
				id: username
				anchors.fill: parent
				anchors.margins: 8
				color: "#c1b492"
				font.pixelSize: 14
				selectionColor: "#d2738a"
				selectedTextColor: "black"
				text: userModel.lastUser
				verticalAlignment: TextInput.AlignVCenter
				KeyNavigation.backtab: shutdownBtn
				KeyNavigation.tab: password
				Keys.onPressed: {
					if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
						sddm.login(username.text, password.text, session.index)
						event.accepted = true
					}
				}
			}
		}
		Text {
			Layout.alignment: Qt.AlignCenter
			text: "Ｐａｓｓｗｏｒｄ："
			color: "#c1b492"
			font.pixelSize: 16
		}
		Rectangle {
			Layout.alignment: Qt.AlignCenter
			implicitWidth: 200
			implicitHeight: 34
			color: "#000"
			border.color: "#d2738a"
			border.width: 1

			TextInput {
				id: password
				anchors.fill: parent
				anchors.margins: 8
				echoMode: TextInput.Password
				color: "#c1b492"
				font.pixelSize: 14
				selectionColor: "#d2738a"
				selectedTextColor: "black"
				verticalAlignment: TextInput.AlignVCenter
				KeyNavigation.backtab: username
				KeyNavigation.tab: session
				Keys.onPressed: {
					if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
						sddm.login(username.text, password.text, session.index)
						event.accepted = true
					}
				}
			}
		}
		Item {
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 4
			Layout.bottomMargin: 50
			width: 200
			height: 38
			Rectangle {
				anchors.fill: parent
				color: "#d2738a"
			}
			Text {
				anchors.centerIn: parent
				text: "Ｌｏｇｉｎ"
				color: "#c1b492"
				font.pixelSize: 20
			}
			MouseArea {
				anchors.fill: parent
				onClicked: sddm.login(username.text, password.text, session.index)
			}
		}
	}
	AnimatedImage {
		id: shutdownBtn
		height: 80
		width: 80
		y: 10
		x: Window.width - width - 10
		source: "VisLain.gif"
		fillMode: Image.PreserveAspectFit
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onClicked: sddm.powerOff()
			onEntered: {
				var component = Qt.createComponent("ShutdownToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(shutdownBtn);
					tooltip.x = -45
					tooltip.y = 60
				tooltip.destroy(600);
				}
			}
		}
	}
	AnimatedImage {
		id: rebootBtn
		anchors.right: shutdownBtn.left
		anchors.rightMargin: 5
		y: shutdownBtn.y + 10
		height: 70
		width: 60
		source: "lain_myese.gif"
		fillMode: Image.PreserveAspectFit
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onClicked: sddm.reboot()
			onEntered: {
				var component = Qt.createComponent("RebootToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(rebootBtn);
					tooltip.x = -45
					tooltip.y = 50
				tooltip.destroy(600);
				}
			}
		}
	}
	ComboBox {
		id: session
		height: 30
		width: 200
		x: 15
		y: 20
		model: sessionModel
		index: sessionModel.lastIndex
		color: "#000"
		borderColor: "#d2738a"
		focusColor: "#d2738a"
		hoverColor: "#d2738a"
		textColor: "#c1b492"
		arrowIcon: "angle-down.png"
		KeyNavigation.backtab: password; KeyNavigation.tab: rebootBtn;
	}
	AudioOutput {
		id: bgMusicOutput
		volume: 1.0
	}
	MediaPlayer {
		id: bgMusic
		source: "bg_music.wav"
		audioOutput: bgMusicOutput
		loops: MediaPlayer.Infinite
		Component.onCompleted: play()
	}
	AudioOutput {
		id: welcomeOutput
		volume: 1.0
	}
	MediaPlayer {
		id: welcome
		source: "welcome.wav"
		audioOutput: welcomeOutput
		Component.onCompleted: play()
	}
	AudioOutput {
		id: deniedOutput
		volume: 1.0
	}
	MediaPlayer {
		id: denied
		source: "denied.wav"
		audioOutput: deniedOutput
	}

	Component.onCompleted: {
		if (username.text == "") {
			username.focus = true
		} else {
			password.focus = true
		}
	}
}
