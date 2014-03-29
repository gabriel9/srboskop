# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = Srboskop

CONFIG += sailfishapp

SOURCES += src/Srboskop.cpp

OTHER_FILES += qml/Srboskop.qml \
    qml/cover/CoverPage.qml \
    rpm/Srboskop.spec \
    rpm/Srboskop.yaml \
    Srboskop.desktop \
    qml/pages/Cinema.qml \
    qml/pages/Movie.qml \
    qml/js/Logic.js

