QT  += core gui qml

TARGET = $$qtLibraryTarget(TaoQuickPlugin)
TEMPLATE = lib
CONFIG += plugin
msvc {
    QMAKE_CFLAGS += -source-charset:utf-8
    QMAKE_CXXFLAGS += -source-charset:utf-8
}

include(../TaoPlugin.pri)
include(../TaoBundle.pri)

SOURCES += \
        Src/TaoQuickPlugin.cpp

HEADERS += \
        Src/TaoQuickPlugin.h

RESOURCES += \
    Qml.qrc
CONFIG(debug, debug|release){
    tgt=$$absolute_path($${_PRO_FILE_PWD_}/../../bin/debug/$${BundlePath}TaoPlugin)
} else {
    tgt=$$absolute_path($${_PRO_FILE_PWD_}/../../bin/release/$${BundlePath}TaoPlugin)
}
win32 {
    tgt ~= s,/,\\\\,g
}
DESTDIR = $${tgt}
CONFIG(debug,debug|release){
    MOC_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/debug/moc)
    RCC_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/debug/rcc)
    UI_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/debug/ui)
    OBJECTS_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/debug/obj)
} else {
    MOC_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/release/moc)
    RCC_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/release/rcc)
    UI_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/release/ui)
    OBJECTS_DIR = $$absolute_path($${_PRO_FILE_PWD_}/../../build/release/obj)
}
OTHER_FILES += README.md \
    .clang-format \
    LICENSE
