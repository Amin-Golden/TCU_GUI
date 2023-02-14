import serial.tools.list_ports
ports = list(serial.tools.list_ports.comports())
for p in ports:
    print (p)
import sys
import time
from PyQt5.QtCore import QObject, QUrl, Qt, pyqtProperty, pyqtSignal
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine, qmlRegisterType, QQmlEngine, QQmlComponent
from PyQt5 import QtCore, QtGui
from PyQt5.QtQuick import QQuickView

if __name__ == "__main__":
    app = QApplication(sys.argv)
    view = QQuickView()
    view.setSource(QUrl('full_gauge.qml'))
    print(view)
    gauge=view.findChild(QObject,'test_gauge')
    gauge.setProperty('gauge_value',4500)
    view.show()
    sys.exit(app.exec_())