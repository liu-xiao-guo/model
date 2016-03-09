TEMPLATE = app
TARGET = model

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp \
    datalistmodel.cpp

RESOURCES += model.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  model.apparmor \
               model.desktop \
               model.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
    images/apple.jpg \
    images/banana.jpg \
    images/cumquat.jpg \
    images/durian.jpg \
    images/fruit-salad.jpg \
    images/hamburger.jpg \
    images/lemonade.jpg \
    images/pancakes.jpg \
    images/polarbear.jpg \
    images/quoll.jpg \
    images/vegetable-soup.jpg \
    images/wolf.jpg \
    images/arrow-down.png \
    images/arrow-up.png \
    images/list-delete.png \
    images/minus-sign.png \
    images/moreDown.png \
    images/moreUp.png \
    images/plus-sign.png

#specify where the config files are installed to
config_files.path = /model
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

HEADERS += \
    datalistmodel.h

